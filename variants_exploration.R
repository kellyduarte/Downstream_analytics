#Progressing in variants exploration
#Variants data to explore

#Distribution of DP values per chromosome and per sample
#This can be done using boxplots. 
#To further highlight each species, we will use colours as we did previously, and to further emphasize independent chromosome output, we will introduce here the use of faceting. 
#The faceting approach subdivides a plot into a matrix of plots representing smaller data subsets.

ggplot(data = var_tb, aes(x=CHROM, y=DP, fill= SAMPLE)) + geom_boxplot() + ylim(0,10000) + scale_fill_brewer(palette="RdYlBu") + labs(title="DP_per_Chromosome") + facet_grid(. ~ SAMPLE)

#A good practice in R is to create a variable to store the data you fixed, and then add to it what you want to test. 
#This simplifies the code a lot. It is common to use “p” as a variable related to plotting stages, but you can use any name you feel is more convenient. 
#Knowing that in one single project, many variables of this type can be created, simply make sure to use names with the most intuitively indicative content.

# Define a variable with plotting options
p_DP_CHROM <- ggplot(data = var_tb, aes(x=CHROM, y=DP, fill= SAMPLE)) + ylim(0,10000) + scale_fill_brewer(palette="RdYlBu") + labs(title="DP_per_Chromosome") + theme(legend.position="bottom")

# Test boxplots with faceting 
p_DP_CHROM + geom_boxplot() + facet_grid(. ~ SAMPLE)

# Combine violin plots and boxplots with faceting
p_DP_CHROM + geom_violin(trim=FALSE) + facet_grid(. ~ SAMPLE) + geom_boxplot(width=0.1)

#Variants effects per sample
# Plotting the variants effects
# Count number of different effects per sample
p_EFFECT <- ggplot(data = var_tb, aes(x=EFFECT, fill= SAMPLE)) + scale_fill_brewer(palette="RdBu") + labs(title="Effect_per_Sample") + theme(legend.position="bottom")

p_EFFECT + geom_bar()

# Flip orientation
p_EFFECT_flip <- ggplot(data = var_tb, aes(y=EFFECT, fill= SAMPLE)) + scale_fill_brewer(palette="RdBu") + labs(title="Effect_per_Sample") + theme(legend.position="bottom")

p_EFFECT_flip + geom_bar()

#Counting the variants effects
# Count the number of different effects
var_tb %>% count(EFFECT)

# Count the number of different effects and link them to sample information
var_tb %>% count(EFFECT, SAMPLE, sort = TRUE)

#The genes showing variants effects
# Counting and extracting all effects for all genes
# Counting the effects per gene

var_tb %>% count(EFFECT, GENE, sort = TRUE)

#Counting and extracting specific effects for all genes
#Among the high impact effects of variants are those modifying the stop codons, as they might affect the integrity of the protein and its related isoforms. 
#Let’s have a look specifically at variants affecting stop codons, reported in our table as either “stop_lost” or “stop_gained”.

# Filtering option 1 to select for effect on stop

filter(var_tb, EFFECT == "stop_lost" | EFFECT == "stop_gained")

# Filtering option 2 to select for effect on stop
filter(var_tb, EFFECT %in% c("stop_lost", "stop_gained"))

# Filtering on effect and selected columns
filter(var_tb, EFFECT %in% c("stop_lost", "stop_gained")) %>% select(SAMPLE, CHROM, GENE, EFFECT)

#Read depth per position
#Another data you might want to visualize is at which positions do the highest or the lowest DP values occur. 
#This usually allows us to identify certain spots for varying density of reads. 
#Obviously, if one can also relate this information to each sample, that’s even better.

# Define your variable
p_DP_POS <- ggplot(data = var_tb, aes(x=POS, y=DP, fill= SAMPLE)) + scale_fill_brewer(palette="RdBu") + labs(title="DP_per_Position") + theme(legend.position="bottom")

# Plot
p_DP_POS + geom_point(shape = 21, size = 5)

# Plot with transparency options
p_DP_POS + geom_point(shape = 21, size = 5, alpha = 0.7)