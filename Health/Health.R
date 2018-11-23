countries <- read.csv('../../countries.csv')
total_fertility <- read.csv('../children_per_woman_total_fertility.csv')
gap_countries <- subset(countries, countries$name %in% total_fertility$country)

library(data.table)
setnames(gap_countries, old = c('country', 'name'), new = c('abbr', 'country'))

total_fertility_final <- merge(total_fertility, gap_countries, by = 'country')

library(dplyr)
total_fertility_since_birth <- subset(select(total_fertility_final, country, abbr:longitude, X1990:X2018))
write.csv(total_fertility_since_birth, '../total_fertility_since_birth.csv')
