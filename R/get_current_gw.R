get_current_gw <- function(){
  get_fixtures() %>%
    subset(finished_provisional == TRUE) %>%
    dplyr::summarise(gw = max(event)) %>%
    as.numeric()
}


