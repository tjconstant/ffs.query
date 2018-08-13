get_all_players <- function(){
  jsonlite::read_json("https://fantasy.premierleague.com/drf/bootstrap-static", simplifyVector = T)$elements
}