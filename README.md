# R world


```R
compareNA <- function(v1,v2) {
  # This function returns TRUE whenever the two inputs are the same, 
  # including the case when they are both NA's,
  # and false otherwise.
  same <- (v1 == v2)  |  (is.na(v1) & is.na(v2))
  same[is.na(same)] <- FALSE
  return(same)
}
```

### filter_if
Filter rows where all numeric values are positive using dplyr
```R
# Filter rows where all numeric values are positive using dplyr
library(dplyr)
df %>%
  filter_if(is.numeric, all_vars(. >= 0))
```

Group by and filter out the row with the highest sum of numeric variables in each group using dplyr.
```R
# Group by and filter out the row with the highest sum of numeric variables in each group using dplyr
library(dplyr)
df %>%
  group_by(a) %>%
  filter_if(is.numeric, all_vars(sum(.)==max(sum(.))
```


