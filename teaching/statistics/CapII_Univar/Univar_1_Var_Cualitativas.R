

## install.packages("janitor")
## install.packages("summarytools")
## install.packages("tidyverse")


## ------------------------------------------------------------------------------------------------------
library(janitor)
library(summarytools)
library(ggplot2)


## ----datos---------------------------------------------------------------------------------------------
# Cargar los datos sobre Cancer de mama:
url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer/breast-cancer.data"
datos <- read.table(url, sep=",",stringsAsFactors=TRUE)
names(datos) <- c("clase","edad","menopausia","tamanio",
                       "inv_nodes","node_caps","deg_malig",
                       "breast","breast_quad","irradiat")
## Mas informacion en: https://archive.ics.uci.edu/ml/datasets/Breast+Cancer
  


## ----------------------------------------------------------------------------
## head(datos) # primeros 6


## ------------------------------------------------------------------------------------------------------
str(datos)


## ------------------------------------------------------------------------------------------------------
# Explorando con tablas: frecuencias y proporciones
table(datos$clase)


## ------------------------------------------------------------------------------------------------------
# prop.table convierte la tabla a proporciones
proptable <- prop.table(table(datos$clase))
# round redondea a los digitos indicados en el segundo argumento.
round(proptable, 3) 


## ------------------------------------------------------------------------------------------------------
# El comando as.data.frame convierte esta tabla a un data frame para mejorar la visualización. 
as.data.frame(proptable)  



## -----------------------------------------------------------------------------------------
library(janitor)
janitor::tabyl(datos$edad)


## --------------------------------------------------------------------------
library(summarytools)
summarytools::freq(datos$menopausia, 
                   order = "freq")


## ------------------------------------------------------------------------------------------------------
pie(table(datos$clase), 
    main="Gráfico para la clasificación de casos")


## Gráfico Pie - V2---------------------------------------------------------------------------------------------------
tabla_clase <- data.frame(table(datos$clase))
names(tabla_clase) <- c("Clase","Frecuencia")

library(ggplot2)
ggplot(tabla_clase, 
       aes(x="", y=Frecuencia, fill=Clase)) +
  geom_bar(stat="identity", width=1) + 
  coord_polar("y", start=0) + theme_void()

 
## ------------------------------------------------------------------------------------------------------
barplot(table(datos$menopausia), 
        xlab="Menopausia",
        ylab="Frecuencia",
        main="Distribución de tipos de menopausia")

