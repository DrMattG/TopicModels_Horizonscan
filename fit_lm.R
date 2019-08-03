###fit lm function
fit_lm <- function(df) {
  lm(cntyr ~ year, data = df)
}