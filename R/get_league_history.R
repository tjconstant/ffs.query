get_league_history <- function(league_id, start_gw = 1){

  league_details <- lapply(league_id, get_league) %>% dplyr::bind_rows()

  history <- tibble::tibble()

  for(player_id in league_details$entry){
    history <- dplyr::bind_rows(history,
                                get_manager_history(player_id, start_gw))
  }

  dplyr::bind_cols(league_name = rep(league_details$league_name,length(history$id)/length(league_details$league_name)),
                   league_id = rep(league_details$league_id,length(history$id)/length(league_details$league_name)),
                   history)

}

#get_league_history(125008) %>% print()

