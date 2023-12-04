# Summary statistics on the data

## Count specific columns and rows
# To obtain insight into the distribution of values in your dataset, the count() function is here to help.
# The “%>%” operator can be used here as the “|” would be in Unix, making it easy to combine two functions.

### Count how many rows are associated with each sample in the data
var_tb %>% count(SAMPLE)

### Sorting the counts
var_tb %>% count(SAMPLE, sort = TRUE)

### Using count() with more than one data object
# Here, the output should show 28 lines without the head() function, used here to reduce the output.
# By default, head() outputs 6 lines of the result.
# Distribution of genes per sample and counts
var_tb %>% count(SAMPLE, GENE, sort = TRUE) %>% head()

## Basic Maths
# Here are a few operations that are very intuitive to understand and use, that can be very helpful for data analysis.
# They operate on individual columns.

### Maximum value of column DP
max(var_tb$DP)

### Minimum value of column DP
min(var_tb$DP)

### Mean value of column DP
mean(var_tb$DP)

## Compute operations in new columns
# You can compute operations on columns and store the results in a new column that will be appended to your data table.
# For this, we can use the mutate() function from the “dplyr” package.

### Compute a LOG2 transformation on the DP values
var_tb_log <- var_tb %>% mutate(DP_log2 = log2(DP))

### View the table columns with the DP_log2 new column appended at the end
head(var_tb_log)

### View a selected content including the new column
select(var_tb_log, SAMPLE, REF, ALT, DP, DP_log2) %>% head()

## Split-apply-combine approach for data analysis
# The “split-apply-combine” approach allows one to operate on data by splitting it into groups, applying some analysis, and then combining the results.
# The function group_by() can be used to split data into groups, taking the column names as arguments.
# It is classically associated with the summarize() function that combines each group and outputs a single-row summary for each of these groups.
# Remember how we used this already with the count() function.

### Show the maximum value of DP for each sample
var_tb %>% group_by(SAMPLE) %>% summarize(max(DP))

### Show the minimum value of DP for each sample
var_tb %>% group_by(SAMPLE) %>% summarize(min(DP))
