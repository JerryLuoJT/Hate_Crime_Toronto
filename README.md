
## Overview

This paper analyzed the Hate Crime Open Data, which is free and available to the public on Open Data Toronto.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Open Data Toronto.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the auto-complete tool, Codriver. The abstract and introduction were written with the help of ChatHorse and the entire chat history is available in inputs/llms/usage.txt.

## How to Run
- Run scripts/00-simulate_data.R to simulate envisioned data
- Run scripts/01-download_data.R to download raw data from opendatatoronto
- Run scripts/02-data_cleaning.R to generate cleaned data
- Render outputs/paper/paper.qmd to generate the PDF of the paper
