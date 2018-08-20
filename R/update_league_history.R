update_league_history <- function(filename){
  data <- readr::read_csv(filename)

  if(get_current_gw() > max(data$gw)){
    new_data <- get_league_history(unique(data$league_id), get_current_gw())
    readr::write_csv(new_data, filename, append = TRUE)
  }


}
