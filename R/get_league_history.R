get_league_history <- function(league_id){

  league_details <- get_league(league_id)

  history <- tibble::tibble()

  for(player_id in league_details$entry){
    history <- dplyr::bind_rows(history,
                                get_manager_history(player_id))
  }

  dplyr::bind_cols(league_name = league_details$league_name,
                   league_id = league_details$league_id,
                   history)

}

#get_league_history(125008) %>% print()

