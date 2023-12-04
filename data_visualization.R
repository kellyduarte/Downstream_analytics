# Data Visualization using ggplot2

## Basic ggplot2 requirements for plotting

### Define the data
# We first need to relate “ggplot2” to a specific data frame using the data argument.
ggplot(data = var_tb)

### Define the aesthetics
# Link ggplot2 to specific variables using aesthetics
ggplot(data = var_tb, aes(x = SAMPLE, y = DP))

### Define the plot type
# Points (left-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_point()

# Boxplot (right-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_boxplot()

### Advanced plotting options: axis transformation
# Points (left-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_point() + ylim(0, 10000)

# Boxplot (right-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_boxplot() + ylim(0, 10000)

# Points (left-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_point() + scale_y_continuous(name = "dp", limits = c(0, 10000))

# Boxplot (right-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_boxplot() + scale_y_continuous(name = "dp", limits = c(0, 10000))

# Points (left-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_point() + scale_y_continuous(trans = 'log10')

ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_point() + scale_y_log10()

# Boxplot (right-hand plot)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_boxplot() + scale_y_continuous(trans = 'log10')

ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_boxplot() + scale_y_log10()

### Advanced plotting options: colors, shapes, legend

#### Change colors

##### Colours of shapes
ggplot(data = var_tb, aes(x = SAMPLE, y = DP, colour = SAMPLE)) + geom_boxplot() + ylim(0, 10000)

##### Colours for filling options
ggplot(data = var_tb, aes(x = SAMPLE, y = DP, fill = SAMPLE)) + geom_boxplot() + ylim(0, 10000)

##### Colours for filling options with manual colors
ggplot(data = var_tb, aes(x = SAMPLE, y = DP, fill = SAMPLE)) + geom_boxplot() + ylim(0, 10000) + scale_fill_manual(values = c("#cb6015", "#e1ad01", "#6d0016", "#808000", "#4e3524"))

##### Colours for filling options with preset palettes
install.packages("RColorBrewer")
library(RColorBrewer)
ggplot(data = var_tb, aes(x = SAMPLE, y = DP, fill = SAMPLE)) + geom_boxplot() + ylim(0, 10000) + scale_fill_brewer(palette = "RdYlBu")

# All possible palettes can be displayed using:
display.brewer.all()

#### Change legend position
ggplot(data = var_tb, aes(x = SAMPLE, y = DP, fill = SAMPLE)) + geom_boxplot() + ylim(0, 10000) + scale_fill_brewer(palette = "RdYlBu") + theme(legend.position = "top")

ggplot(data = var_tb, aes(x = SAMPLE, y = DP, fill = SAMPLE)) + geom_boxplot() + ylim(0, 10000) + scale_fill_brewer(palette = "RdYlBu") + theme(legend.position = "none")

#### Change plot and axis titles
ggplot(data = var_tb, aes(x = SAMPLE, y = DP, fill = SAMPLE)) + geom_boxplot() + ylim(0, 10000) + scale_fill_brewer(palette = "RdYlBu") + theme(legend.position = "bottom") + labs(title = "DP_per_Sample", x = "SampleID", y = "DP")

ggplot(data = var_tb, aes(x = SAMPLE, y = DP, fill = SAMPLE)) + geom_boxplot() + ylim(0, 10000) + scale_fill_brewer(palette = "RdYlBu") + theme(legend.position = "bottom") + ggtitle("DP per Sample") + xlab("Sample") + ylab("DP")

#### Change shapes, colors, and sizes
ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_point(shape = 21, fill = "#e4dbc1", color = "#b92e17", size = 6) + ylim(0, 10000)

ggplot(data = var_tb, aes(x = SAMPLE, y = DP)) + geom_point(shape = 23, color = "#e4dbc1", fill = "#b92e17", size = 5, alpha = 0.5) + ylim(0, 10000)

# All possible points can be displayed using:
ggpubr::show_point_shapes()
