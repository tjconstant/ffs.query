get_manager_details <- function(id){

  manager_raw <- jsonlite::read_json(paste0("https://fantasy.premierleague.com/drf/entry/",id), simplifyVector = T)

  first_name <- manager_raw$entry$player_first_name
  last_name <- manager_raw$entry$player_last_name
  full_name <- paste(first_name, last_name)
  total_transfers <- manager_raw$entry$total_transfers
  team_name <- manager_raw$entry$name
  start_week <- manager_raw$entry$started_event

  tibble::tibble(id,
                 full_name,
                 first_name,
                 last_name,
                 team_name,
                 total_transfers,
                 start_week)

}
