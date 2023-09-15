# INSTALL
install.packages("tidyverse")
install.packages("palmerpenguins")
install.packages("ggthemes")

# IMPORTS
library(tidyverse)
library(palmerpenguins)
library(ggthemes)

# RAW data
view(penguins)

# constructing plot
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")+
  labs( 
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species")



