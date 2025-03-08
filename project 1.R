#install.packages("tidyverse")
library(tidyverse)
View(starwars) #built in dataset in dplyr package

#in this project BMI of humans will calculate

starwars %>% 
  select(height,mass,gender,species) %>% 
  filter(species=="Human") %>%  #select human species
  na.omit() %>% # ignore an observation that has na
  mutate(height=height/100) %>% #converte the height to meter
  mutate(BMI=mass/(height^2)) %>% #create a BMI column
  group_by(gender) %>% 
  summarise(Average_BMI=mean(BMI)) #get the summerise of gender wrt averge of BMI
  