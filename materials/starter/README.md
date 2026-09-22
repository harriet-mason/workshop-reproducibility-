# Quarto workshop starter

This is the participant project for **Reproducible Writing with Quarto**.

## Before the workshop

From a terminal in this folder:

```bash
Rscript setup.R
Rscript preflight.R
quarto render manuscript.qmd --to html
```

The manuscript and tutorial contain `TODO` markers that are completed during the
workshop. The initial files are deliberately incomplete but renderable.

`chunk-options-demo.qmd` is a completed sandbox for comparing `eval`, `echo`,
`output`, `include`, figure, table, and inline-code behaviour.

## Main commands

```bash
quarto preview
quarto render manuscript.qmd
quarto render chunk-options-demo.qmd
quarto render tutorial.qmd
quarto render slides.qmd
```

The `_extensions` directory is bundled so the teaching formats work without a
network connection.
