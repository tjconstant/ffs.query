get_fixtures <- function(){
  fixtures <- jsonlite::read_json(paste0("https://fantasy.premierleague.com/drf/fixtures/", 1), simplifyVector = T)

  fixtures
}
