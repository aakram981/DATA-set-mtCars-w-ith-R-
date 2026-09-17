#DATA MANIPULATION WITH mtcars dataset 
#Etape 1: Charger la librarie ggplot2 qui répertorie les outils graphiques
library(ggplot2)
#Etape 2: Charger la base de données mtcars
mtcars
#******Visuel 1: Nuage de points avec couleur et tailles proportionnels aux variables***
install.packages('tidyverse')
library(tidyverse)
#**************
install.packages("dplyr")
library(dplyr)
library(ggplot2)
ggplot(mtcars,aes(x=wt,y=mpg,color=factor(cyl),size=hp))+
  geom_point(alpha=0.7)+
  labs(title="Consommation en fonction du poids",
       x="Poids (1000lbs)",
       y="Miles per gallon",
       color="Cylindres",
       size="Puissance(hp)")+
  theme_minimal()
#aes: associer les varaibles à des propriétés visuelles
#geom_point: transparence des couleurs
#labs pour ajouter les titres : figure et ceux es axes
#color, size ajoutent les légendes sur la proportionalité des couelurs et taille
#theme_minimal(): donne une figure avec fond blanc et grille dicrètes

#******Visuel 2: Histogramme et Densité
ggplot(mtcars,aes(x=mpg))+
  
  geom_histogram(aes(y=..density..),bins=10,fill="steelblue",
                 color="black")+
  geom_density(color="red",size=1)+
  labs(title="Distribution des consommations",
       x="mpg",
       y="Densité")+
  theme_classic() #axes noirs et fond blanc
#****Visuel 3: Boxplots ************
ggplot(mtcars,aes(x=factor(cyl),y=mpg,fill=factor(cyl)))+
  geom_boxplot()+
  labs(title="Consommation par nombre de Cylindres",
       x="Cylindres",y="mpg")+
  scale_fill_brewer(palette = "Set3")+
  theme(legend.position="none")
#******************LAB5 Pré-traiatement des données avancé*****
#tidyverse : regroupe plusieurs packages qui servent pour 
#la manipulation des bases de données

#dplyr: pour le pré-traitement
#tidyr: pour la restructuration des données 
#ggplot2: pour les visualisations
#Etape 1: Charger la base de données
library(dplyr)
data(mtcars)
#Etape 2: Sélectionner le svariables utiles
#le cas de colonnes non consécutives
mtcars %>%
  select(mpg,cyl,hp,wt)

#Option: Les colonnes à sélectionner sont multiples et consécutives
mtcars%>%
  select(mpg:wt)

#Etape 3: Sélectionner les vaoitures ayant plus de 150 chevaux
mtcars %>%
  filter(hp>150)
#Option: Cas de plusieurs options
#toutes les conditions doivent être vérifiées (AND)
mtcars %>%
  filter(
    hp>150,
    wt<4
  )

#Le cas "OR": au moins satisfaire une condition
mtcars %>%
  filter( cyl==4 | cyl==8)
#Autre syntaxe pour illustrer OR
mtcars %>%
  filter(
    cyl %in% c(4,8)
  )

#Etape 4: Trier les observations
#Tri croissant selon la puissance
mtcars %>%
  arrange(cyl,desc(hp))
#les voitures sont d'abord regroupées par type de cynlindres puis triées selon 
#l'odre décroissant des puissances

#Etape 5: Modifier une colonne

mtcars %>%
  mutate(
    wt=wt*453,592
  )

#Etape 6: Ajouter une colonne
#ratio: puissance/poids
mtcars %>%
  mutate(
    hp_c=hp/wt
  )

#Etape 7: Définir une nouvelle variable catégorique selon 
#plusieurs conditions obersées sur une autre variable

mtcars %>%
  mutate(
    hp_category=case_when(
      hp<100 ~"Faible",
      hp<200 ~ "Moyenne",
      TRUE ~"élevée"
    )
  )
#Recommandée si groupes multiples

#Option : Utilisation de if-else
#Etape 8: Ajouter une colonne qui spécifie si une voiture est puissante ou non
#Condition hp>150 --> puissante sinon : non-puissante

mtcars %>%
  mutate(
    voiture_puissante=if_else(
      hp>=150,"Puissante","Non-puissante"
    )
  )
str(mtcars)
#Etape 9: Transformer une colonne au type facteur
mtcars %>%
  mutate(
    cyl=factor(cyl,
               levels=c(4,6,8))
  )
str(mtcars)

#Etape 10: Supprimer des lignes avec des données manquantes
mtcars$mpg[1]=NA
mtcars$hp[3]=NA
head(mtcars)
library(tidyr)
mtcars %>%
  drop_na(.)
head(mtcars)
#  drop_na(.) : chercher NA au niveau de toutes les colonnes et toutes les lignes

