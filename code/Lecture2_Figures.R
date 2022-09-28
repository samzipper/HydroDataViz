## Lecture2_Figures.R

source(file.path("code", "paths+packages.R"))

# load data
df <- read_csv(file.path("data", "LarnedSampleData.csv"))
df_dry_periods <- read_csv(file.path("data", "Streamflow_DryPeriods.csv"))

## Comparison 1: ordering axis on bar chart (compare to published Zipper et al. (2022) figure)
df_season_summary <-
  df_dry_periods %>% 
  dplyr::mutate(Month = month(first_noflow_date),
                Season = quarter(first_noflow_date)) %>% 
  dplyr::group_by(Season) %>% 
  dplyr::summarize(n_events = n(),
                   mean_length = mean(total_noflow_days))

df_season_summary$SeasonName <- c("Winter", "Spring", "Summer", "Fall")

ggplot(df_season_summary, aes(x = SeasonName, y = n_events, fill = mean_length)) + 
  geom_col() +
  scale_x_discrete(name = "Season [start of event]") +
  scale_y_continuous(name = "Number of Events", 
                     breaks = seq(0, 12, 4),
                     expand = expansion(mult = c(0, 0.03))) +
  scale_fill_distiller(name = "Mean Event\nDuration [days]", 
                       type = "seq", palette = "YlOrRd", direction = 1,
                       limits = c(0, max(df_season_summary$mean_length))) +
  theme(legend.position = "bottom",
        legend.title = element_text(vjust = 1, hjust = 0.5))

## Show histogram of data with different binning
ggplot(df, aes(x = discharge_cms)) +
  geom_histogram(binwidth = 0.5)

ggplot(df, aes(x = discharge_cms)) +
  geom_histogram(binwidth = 1)

ggplot(df, aes(x = discharge_cms)) +
  geom_histogram(binwidth = 10)

ggplot(df, aes(x = discharge_cms)) +
  geom_histogram(binwidth = 20)

ggplot(df, aes(x = discharge_cms)) +
  geom_histogram(binwidth = 50)


df_mo <-
  df |> 
  mutate(Month = month(date_ghcn)) |> 
  group_by(WaterYear, Month) |> 
  summarize(noflowdays = sum(discharge_cms == 0))

ggplot(df_mo, aes(x = noflowdays)) +
  geom_histogram(breaks = seq(0, 32, 1)) +
  scale_x_continuous(name = "Number of No-Flow Days") +
  scale_y_continuous(name = "Number of Months", expand = expansion(c(0, 0.03))) +
  labs(title = "Bin size: 1 day (= bar chart)")

ggplot(df_mo, aes(x = noflowdays)) +
  geom_histogram(breaks = seq(0, 32, 3)) +
  scale_x_continuous(name = "Number of No-Flow Days") +
  scale_y_continuous(name = "Number of Months", expand = expansion(c(0, 0.03))) +
  labs(title = "Bin size: 3 days")

ggplot(df_mo, aes(x = noflowdays)) +
  geom_histogram(breaks = seq(0, 32, 10)) +
  scale_x_continuous(name = "Number of No-Flow Days") +
  scale_y_continuous(name = "Number of Months", expand = expansion(c(0, 0.03))) +
  labs(title = "Bin size: 10 days")

## density plot
ggplot(df_mo, aes(x = noflowdays)) +
  geom_density(fill = "blue", color = "black", alpha = 0.5, adjust = 1) +
  scale_x_continuous(name = "Number of No-Flow Days", expand = c(0,0)) +
  scale_y_continuous(name = "Density", expand = expansion(c(0, 0.03))) +
  labs(title = "Density plot")

ggplot(df_mo, aes(x = noflowdays)) +
  geom_density(fill = "blue", color = "black", alpha = 0.5, adjust = 1/5) +
  scale_x_continuous(name = "Number of No-Flow Days", expand = c(0,0)) +
  scale_y_continuous(name = "Density", expand = expansion(c(0, 0.03))) +
  labs(title = "Density plot")

ggplot(df_mo, aes(x = noflowdays)) +
  stat_ecdf() +
  scale_x_continuous(name = "Number of No-Flow Days") +
  scale_y_continuous(name = "Cumulative frequency", expand = expansion(c(0.03, 0.03))) +
  labs(title = "eCDF plot")
