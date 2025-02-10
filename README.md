# Sentiment_dictionaries_R
# Sentiment_dictionaries_R

This project performs sentiment analysis on pre-processed, tokenized text data using R. It employs several libraries to handle text processing, sentiment scoring, and data manipulation. The analysis uses the General Inquirer (GI) dictionary provided by the SentimentAnalysis package.

# Project Setup

## Dependencies

**Ensure the following R libraries are installed:**

- `quanteda`
- `SentimentAnalysis`
- `tidyverse` (includes dplyr, tidyr, readr)
- `janitor` (for cleaning column names)
- `MASS` (for statistical modelling)

You can install the required packages using the command:
`install.packages(c("quanteda", "tidyverse", "janitor", "SentimentAnalysis", "MASS"))`

## Data Requirements

The input file for this project is a CSV file named tokens_control.csv. It must contain a column named tokens, which holds the tokenized text data to be analyzed.
Example file structure:

`tokens`
`"This is the first document."`
`"Another example of tokenized text."`
...

Script Overview

1. Read and Prepare Data

The script reads the input data from tokens_control.csv and cleans the column names using the janitor package.

`input_file <- "tokens_control.csv"`
`tokens_data <- read_csv(input_file, show_col_types = FALSE) %>%`
  `clean_names()`

If the tokens column is not found or the file is missing, the script will display an error message and terminate.

2. Sentiment Analysis

The tokenized text is passed to the analyzeSentiment() function, which uses the GI dictionary to calculate sentiment scores.

`texts <- tokens_data$tokens`
`sentiment_results <- analyzeSentiment(texts)`

If no text is available, the script will display an error.

3. Export Results

The sentiment analysis results are combined with the original data and exported to a CSV file named SentimentAnalysis_control.csv.

`results <- cbind(tokens_data, sentiment_results)`
`write_csv(results, "SentimentAnalysis_control.csv")`

## Output

The output file SentimentAnalysis_control.csv contains both the original tokenized text and the sentiment analysis results. Example columns may include:

**tokens**: Original tokenized text
**SentimentGI**: Sentiment score based on the GI dictionary

Additional sentiment metrics as provided by the SentimentAnalysis package

## How to Run

- Install the required R packages.
- Place the input file (tokens_control.csv) in the project directory.
- Run the script in an R environment (e.g., RStudio).
- Upon successful execution, the results will be saved to SentimentAnalysis_control.csv.
