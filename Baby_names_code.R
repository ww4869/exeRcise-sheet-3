baby_name_2022<-read.csv('open_data_portal_2022.csv')
baby_name_2023<-read.csv('vornamen-muenchen-2023.csv')

print(typeof(baby_name_2022$Anzahl))
print(typeof(baby_name_2023$Anzahl))


baby_name_2022$Anzahl <- as.numeric(gsub("4 oder weniger", "4", baby_name_2022$Anzahl))
baby_name_2023$Anzahl <- as.numeric(gsub("4 oder weniger", "4", baby_name_2023$Anzahl))


cat('the total number of babies born in Munich in 2022 is',sum(baby_name_2022$Anzahl),
    '\nthe total number of babies born in Munich in 2023 is',sum(baby_name_2023$Anzahl))

baby_name_2022$year <- 2022
baby_name_2023$year <- 2023

combined_data <- dplyr::bind_rows(baby_name_2022, baby_name_2023)


popular_names <- combined_data %>%
  group_by(Vorname, Geschlecht) %>%
  summarise(Total = sum(Anzahl, na.rm = TRUE)) %>%
  arrange(desc(Total))

top_names <- head(popular_names, 10)



