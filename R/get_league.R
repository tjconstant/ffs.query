get_league <- function(league_id = 125008){

  league_raw <- jsonlite::read_json(paste0("https://fantasy.premierleague.com/drf/leagues-classic-standings/",league_id), simplifyVector = T)

  league_df <- cbind(league_name = league_raw$league$name,
                     league_id = league_id,
                     league_raw$standings$results)

  league_df
}
