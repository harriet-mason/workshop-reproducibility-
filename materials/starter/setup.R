required <- c("knitr", "rmarkdown", "readr", "dplyr", "ggplot2")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]

if (length(missing) == 0) {
  message("All required R packages are installed.")
} else {
  message("Installing missing packages: ", paste(missing, collapse = ", "))
  install.packages(missing, repos = "https://cloud.r-project.org")
}

if (!nzchar(Sys.which("pdflatex")) &&
    !nzchar(Sys.which("xelatex")) &&
    !nzchar(Sys.which("lualatex"))) {
  message(
    "\nNo LaTeX engine was found. For PDF output, run:\n",
    "install.packages(\"tinytex\")\n",
    "tinytex::install_tinytex()\n"
  )
}

