## Lecture1_Figure_CompareLinearLogScale.R

source(file.path("code", "paths+packages.R"))

df <- read_csv(file.path("data", "LarnedSampleData.csv"))[1:365*10, ]

p_linear <- 
  ggplot(df, aes(x = date_ghcn, y = discharge_cms)) +
  geom_line(color = col.cat.blu) +
  scale_x_date(name = "Date", expand = c(0,0)) +
  scale_y_continuous(name = "Daily Discharge [cms]") +
  labs(title = "Arkansas River near Larned KS")

p_log <- 
  ggplot(df, aes(x = date_ghcn, y = discharge_cms)) +
  geom_line(color = col.cat.blu) +
  scale_x_date(name = "Date", expand = c(0,0)) +
  scale_y_log10(name = "Daily Discharge [cms]") +
  labs(title = "Arkansas River near Larned KS")
