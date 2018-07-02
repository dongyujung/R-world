library(gapminder)
library(dplyr)

########### Filter, Arrange, Mutate #####################

# Filter the gapminder dataset for the year 1957
gapminder %>%
  filter(year == 1957)

# Filter for China in 2002
gapminder %>%
  filter(country == 'China', year == 2002)

# You use arrange() to sort observations in ascending or descending order 
# of a particular variable.

# Sort in ascending order of lifeExp
gapminder %>%
  arrange(lifeExp)

# Sort in descending order of lifeExp
gapminder %>%
  arrange(desc(lifeExp))


# Multiple pipe operators (%>%)
# Filter for the year 1957, then arrange in descending order of population
gapminder %>%
  filter(year == 1957) %>%
  arrange(desc(pop))

# You can use the mutate() verb to change this column, 
# or to create a new column that's calculated this way.

# Use mutate to change lifeExp to be in months
gapminder %>%
  mutate(lifeExp = lifeExp * 12)

# Use mutate to create a new column called lifeExpMonths
gapminder %>%
  mutate(lifeExpMonths = lifeExp * 12 )


######## Visualizing with ggplot2 ################
library(ggplot2)

# Create gapminder_1952
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()

# log scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() +
  scale_x_log10()

# Size and color of scatter plot
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size=gdpPercap)) +
  geom_point() +
  scale_x_log10()

# use faceting to divide a graph into subplots 
# based on one of its variables
ggplot(gapminder_1952, aes(x=pop, y=lifeExp))+
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ continent)

######## Summarize, Group_by #######################
# Summarize
gapminder %>%
  summarize(medianLifeExp = median(lifeExp))

# Filter and Summarize
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp))

# Summarizing multiple variables
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Group by
gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Filter and Group by
gapminder %>%
  filter(year == 1957) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Group by two variables
gapminder %>%
  group_by(continent, year) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

######### ggplot with summarize, group_by #############

by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(medianGdpPercap = median(gdpPercap))


ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) +
  geom_point() +
  expand_limits(y=0)


######### ggplot: line plots, bar plots, histograms,  ##############

# Line plot: geom_ilne()
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) +
  geom_line() +
  expand_limits(y=0)


# Bar plots for categoricals: geom_col()
by_continent <- gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_continent, aes(x=continent, y=medianGdpPercap)) +
  geom_col()


# Plotting one dimensional data with histograms: geom_histogram()
# Has only x
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(x=pop)) +
  geom_histogram()

# When distribution is skewed: log-scale
ggplot(gapminder_1952, aes(x=pop)) +
  geom_histogram() +
  scale_x_log10()


# Boxplots: geom_boxplot()
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(x=continent, y=gdpPercap)) +
  geom_boxplot() +
  scale_y_log10()

# Adding title to graph: ggtitle("Title")
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() +
  ggtitle("Comparing GDP per capita across continents")




