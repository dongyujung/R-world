# R-world


```R
compareNA <- function(v1,v2) {
  # This function returns TRUE wherever elements are the same, including NA's,
  # and false everywhere else.
  same <- (v1 == v2)  |  (is.na(v1) & is.na(v2))
  same[is.na(same)] <- FALSE
  return(same)
}
```

### filter_if
```R
# Filter rows where all numeric values are positive using dplyr
library(dplyr)
df %>%
  filter_if(is.numeric, all_vars(. >= 0))
```

