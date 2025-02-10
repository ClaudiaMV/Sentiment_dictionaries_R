# Sentiment Analysis Script

# Load required libraries
library(quanteda)
library(tidyverse)      # Includes dplyr, tidyr, readr, etc.
library(janitor)        # For cleaning column names
library(SentimentAnalysis)
library(MASS)           # For statistical modelling

# Check if the input file exists
input_file <- "tokens_control.csv"
if (!file.exists(input_file)) {
  stop("Error: Input file 'tokens_control.csv' not found.")
}

# Read and clean data
tokens_data <- read_csv(input_file, show_col_types = FALSE) %>%
  clean_names()

# Validate that the required 'tokens' column is present
if (!"tokens" %in% colnames(tokens_data)) {
  stop("Error: 'tokens' column not found in the input file.")
}

# Extract the tokenized text data
texts <- tokens_data$tokens

# Check if there are any texts to analyze
if (length(texts) == 0) {
  stop("Error: No texts found for sentiment analysis.")
}

# Perform sentiment analysis using the GI dictionary
sentiment_results <- analyzeSentiment(texts)

# Display the first few rows of the results for verification
print(head(sentiment_results))

# Ensure the number of rows in sentiment results matches the input data
if (nrow(tokens_data) != nrow(sentiment_results)) {
  stop("Error: Mismatch between input data and sentiment results.")
}

# Combine the original data with the sentiment analysis results
results <- cbind(tokens_data, sentiment_results)

# Export the combined results to a CSV file
output_file <- "SentimentAnalysis_control.csv"
write_csv(results, output_file)

# Confirm completion
cat("Sentiment analysis completed. Results saved to", output_file, "\n")
