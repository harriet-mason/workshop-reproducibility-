minimum_quarto <- numeric_version("1.9.0")
minimum_r <- numeric_version("4.3.0")
required <- c("knitr", "rmarkdown", "readr", "dplyr", "ggplot2")
failures <- character()

report <- function(ok, label, detail = "") {
  mark <- if (ok) "[PASS]" else "[FAIL]"
  cat(mark, label, detail, "\n")
}

cat("Quarto workshop preflight\n\n")

quarto_path <- Sys.which("quarto")
has_quarto <- nzchar(quarto_path)
quarto_version <- if (has_quarto) {
  numeric_version(system2(quarto_path, "--version", stdout = TRUE)[1])
} else {
  numeric_version("0")
}
quarto_ok <- has_quarto && quarto_version >= minimum_quarto
report(quarto_ok, "Quarto", if (has_quarto) as.character(quarto_version) else "not found")
if (!quarto_ok) failures <- c(failures, "Quarto 1.9 or later")

r_ok <- getRversion() >= minimum_r
report(r_ok, "R", as.character(getRversion()))
if (!r_ok) failures <- c(failures, "R 4.3 or later")

for (package in required) {
  ok <- requireNamespace(package, quietly = TRUE)
  detail <- if (ok) as.character(utils::packageVersion(package)) else "not installed"
  report(ok, paste0("R package ", package), detail)
  if (!ok) failures <- c(failures, paste("R package", package))
}

latex_engines <- Sys.which(c("xelatex", "lualatex", "pdflatex"))
latex_engine <- unname(latex_engines[nzchar(latex_engines)][1])
has_latex <- length(latex_engine) == 1 && !is.na(latex_engine)
report(has_latex, "LaTeX engine", if (has_latex) latex_engine else "not found")
if (!has_latex) failures <- c(failures, "LaTeX/TinyTeX")

if (quarto_ok && r_ok && length(failures) == 0) {
  check_dir <- tempfile("quarto-preflight-")
  dir.create(check_dir)
  check_file <- file.path(check_dir, "check.qmd")
  writeLines(
    c(
      "---",
      "title: \"Preflight render\"",
      "format:",
      "  html: default",
      "  pdf: default",
      "---",
      "",
      "A computed value: `r 6 * 7`."
    ),
    check_file
  )
  old_directory <- setwd(check_dir)
  render_output <- suppressWarnings(
    system2(
      quarto_path,
      c("render", "check.qmd"),
      stdout = TRUE,
      stderr = TRUE
    )
  )
  setwd(old_directory)
  render_status <- attr(render_output, "status")
  if (is.null(render_status)) render_status <- 0L
  render_ok <- identical(render_status, 0L)
  report(render_ok, "HTML and PDF render", if (render_ok) "successful" else "failed")
  if (!render_ok) {
    cat(paste(tail(render_output, 12), collapse = "\n"), "\n")
    failures <- c(failures, "test render")
  }
}

cat("\n")
if (length(failures) == 0) {
  cat("Preflight passed.\n")
} else {
  cat("Preflight needs attention:", paste(unique(failures), collapse = ", "), "\n")
  quit(status = 1)
}
