# Inspecting the data is one thing, but manipulating it is another.
# Manipulating the data requires different functions than those required for inspecting the data. 
# There are tens of different functions used to manipulate the data, which enables simple and complex operations in R.

# Selecting entire columns and rows

# Filtering columns
# Check column names
colnames(var)

# Select columns 1, 4, and 5
var[, c(1, 4, 5)]

# The select() function from the “dplyr” package can help you extract specific columns in a new table.

# Select columns 1, 4, and 5 with default display
select(var, SAMPLE, REF, ALT)

# Select columns 1, 4, and 5 with selected display
select(var, SAMPLE, REF, ALT) %>% head(3)

# Select all columns except the column “CALLER” with selected display
select(var, -CALLER) %>% head(3)

# Transform the data frame into a tibble
var_tb <- as_tibble(var)

select(var_tb, SAMPLE, REF, ALT) %>% head(3)

# Filtering rows
# Filtering rows is another option that base R code offers; “dplyr” can also facilitate this using the filter() function.
# Select rows with selected display using base R code
var_tb[var_tb$SAMPLE == "SRR13500958",]

# Select rows with selected display using dplyr functions
filter(var_tb, SAMPLE == "SRR13500958") %>% head(3)

# Filtering columns and rows
# Select sample type (rows) and variables (columns) with selected display
var_tb %>% filter(SAMPLE == "SRR13500958") %>% select(CHROM, POS, REF, ALT) %>% head(3)

# Selecting specific values from columns and rows

# To select all data related to the specified sample
var_tb %>% filter(SAMPLE == "SRR13500958") %>% select(CHROM, POS, REF, ALT, DP)

# To select only values for which DP>=500 for the same sample
var_tb %>% filter(SAMPLE == "SRR13500958" & DP >= 500) %>% select(CHROM, POS, REF, ALT, DP)

# To select only values for which DP>=1000 for the same sample
var_tb %>% filter(SAMPLE == "SRR13500958" & DP >= 1000) %>% select(CHROM, POS, REF, ALT, DP)
