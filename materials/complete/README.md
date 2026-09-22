# Quarto workshop completed project

This is the completed reference project for **Reproducible Writing with Quarto**.
It contains:

- `manuscript.qmd`: one source rendered to HTML and PDF;
- `chunk-options-demo.qmd`: runnable examples of execution and display options;
- `tutorial.qmd`: student and solution teaching formats;
- `slides.qmd`: a RevealJS presentation;
- `journal-demo.qmd`: an instructor demonstration using Elsevier formatting;
- a documented synthetic CSV and bibliography; and
- setup and preflight scripts.

## Render

```bash
Rscript preflight.R
quarto render manuscript.qmd
quarto render chunk-options-demo.qmd
quarto render tutorial.qmd
quarto render slides.qmd
```

The journal demo is intentionally separate from the default project render:

```bash
quarto render journal-demo.qmd
```
