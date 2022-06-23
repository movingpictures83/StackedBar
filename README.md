# StackedBar
# Language: R
# Input: TXT
# Output: PNG 
# Tested with: PluMA 2.0, R 4.0.0
# Dependencies: ggsci_2.9,hrbrthemes_0.8.0,viridis_0.5.1,viridisLite_0.3.0,gplots_3.1.1,ggpubr_0.4.0,ggplot2_3.3.5

PluMA plugin to produce a stacked bar chart of differentiating taxa for two sets of samples.

The plugin expects as input a TXT file of keyword-value pairs:
abundance: CSV file of samples, abundances, and groups
levels: TXT file of differentiating taxa, one per line
colors: TXT file of colors for differentiating taxa, one per line
species: true or false, if this is a species-level plot (more colors are typically needed in this case, the plugin will default to using the ramp color pallette)

Output will be sent to a PNG.
