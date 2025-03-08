my_data<-read.csv("data/Friends.csv") # object de denir

plot(as.factor(my_data$Sex),my_data$Height)

# bu ilk projede veri setini düzenledim veri kategorik yani factor değil de 
#karakter chr yapısında olduğu için hata aldık on uas factor olarak değiştirdim.

#veri türlerini öğrenme oldukça önemli


#yeni ders
View(my_data) 
head(my_data)
tail(my_data)
str(my_data) # kısa özet.feature veri tipleri ve bazı örnekleri

# ***each row is an observation and each column is a variable ***
# dataframe de herhangi bir yere kare parentez ile erişebiliriz
my_data[1,3] #row,column 
my_data[,3] # all observations of column 3
my_data$Eye_colour  # $ accesor ile variableı komple alabiliriz

--------------------------------
#Paketler 
#install.packages("tidyverse")
#library(tidyverse)  veya require(tidyverse) ile paketi (fonksiyonu)çağırabiliriz

#install.packages("tidyverse")
library("tidyverse")

# pipe operatörü and then demek ctrl+shit+m 

my_data %>% 
  select(Name,Age,Height) %>% 
  filter(Age<24 & Height>1.78)

Bu şekilde basit bir data manipülasyonu yaptık
datayı seç and then name age ve heightı seç and then (piped into boru
ağı gibi)yaşı 24 ten küçük yğksekliği 1.78 den büyük olan kişileri filtrele



data() # Bu fonksiyon R da olan verisetlerini içerir
View(starwars)
#Mesela starwars verisetindeki elemanların 
#vücut kitle indekslerine bakalım

Bunun için ilk önce veriseti incelenir ondan sonra 
veriseti işme yapmak için uygun hale getirilir
mesela vücut kitle indeksi için species human seçilmeli


starwars %>% 
  select(gender,mass,height,species) %>% 
  filter(species=="Human") %>% 
  na.omit() %>%
  mutate(height= height/100) %>% #mutate ile height featurundaki cm verisini metreye çevirdik
  mutate(BMI=mass/(height^2)) %>% #yeni BMI columnı oluşturduk ve BMI boddy mass indeks adında
#mutate ile yeni bir sütün oluşturulabilir veya var olan sütun üzerinde işlemler yapılabilir
  group_by(gender) %>% #cinsiyete göre gruplandır veriyi ve sonra
  summarise(Average_BMI=mean(BMI))


  
