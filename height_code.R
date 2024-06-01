library(dplyr)
options (warn = -1)
height_data<-read.csv('Human_Height.csv')

male_mean_height<- height_data %>%
  group_by(Entity) %>%
  summarise(mean_male_height = mean(Mean_male_height)) %>%
  arrange(desc(mean_male_height))

female_mean_height<-height_data %>%
  group_by(Entity) %>%
  summarise(mean_female_height = mean(Mean_female_height)) %>%
  arrange(desc(mean_female_height))

top10_male_height_country<-head(male_mean_height,10)
top10_female_height_country<-head(female_mean_height,10)




ggplot(height_data, aes(x = Country, y = Average_Height)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Country", y = "Average Height", title = "Average Height by Country") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip()  # 旋转x轴标签，以便更好地显示



