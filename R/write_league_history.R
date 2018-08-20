write_league_history <- function(league_ids, filename = "data-raw/master.csv"){

  history <- tibble::tibble()

  for(leage_id in league_ids){
    history <- dplyr::bind_rows(history, get_league_history(leage_id))
  }

  readr::write_csv(x = history, path = filename)

}
