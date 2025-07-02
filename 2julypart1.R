library(sf)
library(tidyverse)
library(leaflet)
library(janitor)


dir(path = "India Shape")


india <- st_read("India Shape/india_ds.shp")


india %>% 
  mutate(random_no = sample(c(1:100), 482, replace = T )) -> india
india

## creating a map 

ggplot(data = india) +
  geom_sf(fill = "lightblue" , color = "black")+
  ggtitle("India Map")+
  theme_minimal()




ggplot(data = india) +
  geom_sf(aes(fill = random_no) , color = "black")+
  ggtitle("India Map")+
  theme_minimal()



ggplot(data = india) +
  geom_sf(aes(fill = random_no) , color = "black")+
  ggtitle("India Map")+
  scale_fill_gradient(low = "red" , high = "yellow")+
  theme_void()


india %>% 
  filter(STATE == "ANDHRA PRADESH") -> AP


ggplot(data = AP) +
  geom_sf(fill = "lightblue" , color = "black")+
  ggtitle("India Map")+
  theme_minimal()


ggplot(data = AP) +
  geom_sf(aes(fill = random_no) , color = "black")+
  ggtitle("Andhra Pradesh Map")+
  scale_fill_gradient(low = "red" , high = "yellow")+
  theme_void()


india %>% 
  group_by(STATE) %>% 
  summarise(geometry = st_union(geometry)) -> india_state


ggplot(data = india_state) +
  geom_sf(fill = "yellow" , color = "black")+
  ggtitle("India State Map")+
  #scale_fill_gradient(low = "red" , high = "yellow")+
  theme_void()


leaflet() %>% 
  addTiles()
  

leaflet(india) %>% 
  addTiles() %>% 
  addPolygons(
    fillColor = "yellow",
    weight = 1 , 
    color = "black", 
    fillOpacity = 0.5,
    popup = ~as.character(random_no)
  )


#https://leaflet-extras.github.io/leaflet-providers/preview/


