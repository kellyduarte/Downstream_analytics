# Declare your data
# Make sure the data is in your working folder

list.files()

# Import the data into RStudio
# Create a variable called “var” to store the imported data from the "variants_long_table.csv" file.
# The read.csv() function is used to import the data in a table format from a CSV file.

var <- read.csv("variants_long_table.csv")

# Check the first few rows of the imported data
head(var)

# Exploring the file and data structure

# The dim() function
# Check the dimensions of the data (number of rows and columns)
dim(var)

# Check the number of rows
nrow(var)

# Check the number of columns
ncol(var)

# The str() function
# Display the structure of your R object, providing information on the data type and structure of each column.
str(var)

# The summary() function
# Provide summary statistics for numerical columns in the dataset, including minimum, maximum, mean, median, and quartiles.
# We will use summary(var) for the entire table and show examples for non-numerical (categorical) and numerical columns.

## For the entire table
summary(var)

## For non-numerical data (e.g., SAMPLE column)
summary(var$SAMPLE)

## For numerical data (e.g., DP column)
summary(var$DP)

# The class() function
# Check the class (data type) of the entire dataset and individual columns.

# Check the class of the entire data
class(var)

# Check the class of an object (e.g., CHROM column)
class(var$CHROM)

# Check the type of an object (e.g., CHROM column)
typeof(var$CHROM)

# The View() function
# Preview the data using a spreadsheet-style data viewer in RStudio.
View(var)
