library(devtools)
library(ggplot2)
library(ggmap)
library(data.table)
require(plotly)
setwd("/home/rxe/myProjects/dataScience/bikesStolen")
bikesStolen <- read.csv("bikesStolen.csv", stringsAsFactors = F)
View(bikesStolen)
bikesStolen <- data.table(bikesStolen)
str(bikesStolen)

#### CLEANING DATA AND CONVERTING TO RIGHT TYPES
bikesStolen$fromDate <- as.Date(bikesStolen$fromDate, format = "%m/%d/%Y")
bikesStolen$toDate <- as.Date(bikesStolen$toDate, format = "%m/%d/%Y")
bikesStolen$Speed <- as.factor(bikesStolen$Speed)
bikesStolen$Speed
bikesStolen$Color <- ordered(bikesStolen$Color, 
                             levels=c("BLK","BLU","WHI","GRN","RED","GRY",
                                      "SIL","YEL","PLE","PNK","ONG",
                                      "BRO","LGR","LBL","MAR","TRQ","DGR",
                                      "TAN","COM","GLD","DBL","CRM","BGE", ""),
                             labels=c("Black","Blue","White","Green","Red", "Grey",
                                      "Silver", "Yellow","Purple","Pink","Orange",
                                      "Brown","Light Green","Light Blue","Burgundy/Maroon","Turquoise", 
                                      "Dark Green","Tan","Chrome","Gold","Diamond Blue","Cream/Ivory","Beige", "Not Given"))


# CREATE GGPLOT GRAPH DISPLAYING THE COLOR OPTIONS OF STOLEN BIKES
colors <- data.table(table(bikesStolen$Color))

colnames(colors) <- c("Color", "Counts")
colors
colors$Color <- ordered(colors$Color, levels=c("Black","Blue","White","Green","Red", "Grey",
                                                    "Silver", "Yellow","Purple","Pink","Orange",
                                                    "Brown","Light Green","Light Blue","Burgundy/Maroon","Turquoise", "Dark Green",
                                                    "Tan","Chrome","Gold","Diamond Blue","Cream/Ivory","Beige", "Not Given"))
colors$Color
gg <- ggplot(colors, aes(Color, Counts, fill=factor(Color))) + geom_bar(stat='identity', colour = "turquoise2") + theme_minimal() + 
  labs(title = "Color of Bikes Stolen within Isla Vista (2011-2016)") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_fill_manual(values=c("#000000", "#1f23af", "#ffffff", "#03c11d", "#dd1616", "#808080", "#C0C0C0", "#ffff00", "#800080", 
                               "#FFC0CB", "#FF8C00", "#8B4513", "#76EE00", "#ADD8E6", "#800000", "turquoise4", "#006400", "#D2B48C", 
                               "#a8a8a8", "#D4AF37", "#0EBFE9", "#FCFBE3", "#f5f5dc", "gray99"))
ggplotly(gg)


  
