### radar plot example
### consider use in everglades data

######## Example from here: https://www.r-bloggers.com/2023/10/creating-interactive-radar-charts-in-r-with-the-fmsb-library/
# Load the fmsb package
library(fmsb)

# Create sample data
data <- as.data.frame(matrix(sample(2:20, 10, replace = T), 
                             ncol = 10))
colnames(data) <- c("Var1", "Var2", "Var3", "Var4", "Var5", 
                    "Var6", "Var7", "Var8", "Var9", "Var10")
data <- rbind(rep(20, 10), rep(0, 10), data)

# Create a basic radar chart
radarchart(data)

### customized plot

# Create sample data
data <- as.data.frame(matrix(sample(2:20, 10, replace = T), 
                             ncol = 10))
colnames(data) <- c("Var1", "Var2", "Var3", "Var4", "Var5", 
                    "Var6", "Var7", "Var8", "Var9", "Var10")
data <- rbind(rep(20, 10), rep(0, 10), data)

# Customize the radar chart
radarchart(data, axistype = 1, pcol = rgb(0.2, 0.5, 0.5, 0.9), 
           pfcol = rgb(0.2, 0.5, 0.5, 0.5), plwd = 4, cglcol =
             "grey", cglty = 1)

# Create sample data

#use this to compare at sites: native vs non-native

set.seed(1)
data <- data.frame(rbind(rep(10, 8), rep(0, 8), 
                         matrix(sample(0:10, 24, replace = TRUE),
                                nrow = 3)))
colnames(data) <- paste("Var", 1:8)

# Create a radar chart with multiple groups
radarchart(data, axistype = 1, pcol = 1, plwd = 2, 
           pdensity = 10, pangle = 40, cglty = 1, 
           cglcol = "gray")

### ggradar example
data<- data.frame(
  row.names = c("A", "B", "C"),
  Thickness = c(7.9, 3.9, 9.4),
  Apperance = c(10, 7, 5),
  Spredability = c(3.7, 6, 2.5),
  Likeability = c(8.7, 6, 4)
)
data
library(tidyverse) 
devtools::install_github("ricardo-bion/ggradar") 
library("ggradar") 
df<-data %>% rownames_to_column("group")
df


## try this for everglades data

p <- ggradar(
  df, 
  values.radar = c("0", "5", "10"),
  grid.min = 0, grid.mid = 5, grid.max = 10,
  # Polygons
  group.line.width = 1, 
  group.point.size = 3,
  group.colours = c("#00AFBB", "#E7B800", "#FC4E07"),
  background.circle.colour = "white",
  gridline.mid.colour = "grey",
  legend.position = "bottom"
)

library(plotly)ggplotly(p)

