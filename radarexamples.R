### radar plot example
### consider use in everglades data


library(tidyverse) 
devtools::install_github("ricardo-bion/ggradar") 
library("ggradar") 


### try with everglades data
load("data/EG_site_wide2.RData")
eg <- EG_site_wide2
eg2 <- eg[, 1:13]
eg2 <- cbind(eg2[,c(1,2,3,5,9,10,11,12,13,4,6,7,8)])

## convert to proportions for each site
eg3 <-  round(prop.table(as.matrix(eg2[,2:13]), margin = 1),1)
eg3x <- as.data.frame(eg3)
##add site names
eg4 <- data.frame(cbind(group=eg2$Site, eg3x))

p1 <- ggradar(eg4)
library(plotly)
p2 <- ggplotly(p1)

### see bellow for ggradar options

## select 2 sites for comparisons
eg5 <- eg4[c(2,6),]

p3 <- ggradar(
  eg4, 
  values.radar = c("0", ".5", "1"),
  grid.min = 0, grid.mid = ,5, grid.max = 1,
  # Polygons
  group.line.width = 1, 
  group.point.size = 1,
  #group.colours = c("#00AFBB", "#E7B800"),
  background.circle.colour = "white",
  gridline.mid.colour = "grey",
  legend.position = "bottom"
)

p4 <- ggplotly(p3)
p4

########### transpose


eg2t <- t(eg2[,-1])
colnames(eg2t) <- eg2$Site

## convert to proportions for each site
eg3t <-  round(prop.table(as.matrix(eg2t[,2:17]), margin = 1),1)*100
eg3xt <- as.data.frame(sqrt(eg3t))
##add site names
eg4t <- data.frame(cbind(group=rownames(eg3xt), eg3xt))

p1_t <- ggradar(eg4t)
library(plotly)
p2_t <- ggplotly(p1_t)


p3_t <- ggradar(
  eg4t, 
  #values.radar = c("0", ".5", "1"),
  grid.min = 0, grid.mid = ,5, grid.max = 10,
  # Polygons
  group.line.width = 1, 
  group.point.size = 1,
  #group.colours = c("#00AFBB", "#E7B800"),
  background.circle.colour = "white",
  gridline.mid.colour = "grey",
  legend.position = "bottom"
)

p4_t <- ggplotly(p3_t)
p4_t







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




##########
# try this for everglades data

# p <- ggradar(
#   df, 
#   values.radar = c("0", "5", "10"),
#   grid.min = 0, grid.mid = 5, grid.max = 10,
#   # Polygons
#   group.line.width = 1, 
#   group.point.size = 3,
#   group.colours = c("#00AFBB", "#E7B800", "#FC4E07"),
#   background.circle.colour = "white",
#   gridline.mid.colour = "grey",
#   legend.position = "bottom"
# )

