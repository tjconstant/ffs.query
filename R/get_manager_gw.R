get_manager_gw <- function(id, gw){

  manager_gw_raw <- jsonlite::read_json(paste0("https://fantasy.premierleague.com/drf/entry/",id,"/event/",gw,"/picks"), simplifyVector = T)

  manager_gw_raw$picks <-
  all_players %>%
    dplyr::select(id, web_name) %>%
    dplyr::right_join(manager_gw_raw$picks, by = c("id" = "element"))

  manager_gw_raw

}

#get_manager_gw(586440,1)
