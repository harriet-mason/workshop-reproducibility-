# Reproducible Writing with Quarto

This repository contains a complete three-hour workshop for university research
staff who know some R but are new to Quarto.

## Deliverables

- `_site/index.html` — rendered portable workshop book
- `_site/Reproducible-Writing-with-Quarto.pdf` — printable book
- `instructor-run-sheet.html` and `.pdf` — facilitator guide
- `materials/downloads/quarto-workshop-starter.zip` — participant starter
- `materials/downloads/quarto-workshop-complete.zip` — completed reference
- `materials/downloads/quarto-assessment-starter.zip` — optional no-code
  assessment task
- `appendices/assessment-guide.qmd` — assessor verification and feedback guide

The participant projects bundle `unilur` 0.2.3 and the Quarto Elsevier format
0.4.5 under `_extensions`, so workshop rendering does not require an extension
download.

## Customise

Edit `_variables.yml` to change the institution, presenter, workshop date, and
contact address. The book title and facilitator author are configured in
`_quarto.yml`.

The synthetic study data are documented in each participant project's
`data/README.md` and are released under CC0.

The post-workshop competency assessment is pathway-neutral. Executable code,
data analysis, and R are optional; the supplied assessment task is a no-code
writing and documentation project.

## Render

From the repository root:

```bash
quarto render
quarto render instructor-run-sheet.qmd
```

To validate the supplied assessment project:

```bash
cd materials/assessment-starter
quarto render staff-handover.qmd
```

To validate the completed participant project:

```bash
cd materials/complete
Rscript preflight.R
quarto render
quarto render journal-demo.qmd
```

Render the participant projects and rebuild the zip archives after changing
their source. The book must then be rendered again so the updated archives are
copied into `_site`.

## Workshop scope

The live pathway covers Markdown, literate R computation, HTML/PDF research
output, a journal-format demonstration, `unilur` question/solution output, and a
RevealJS demonstration. Git, `renv`, Python, deployment, and custom template
authoring are follow-up material rather than live activities.
