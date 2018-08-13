get_manager_history <- function(id){

  manager_details <- get_manager_details(id)

  current_gw <- get_current_gw()
  start_gw <- as.numeric(manager_details$start_week)
  history <- tibble::tibble()


  for(gw_itr in seq(start_gw,current_gw)){

    gw_raw <- get_manager_gw(id, gw_itr)

    gw <- gw_raw$entry_history$event
    transfers <- gw_raw$entry_history$event_transfers
    transfer_cost <- gw_raw$entry_history$event_transfers_cost
    points <- gw_raw$entry_history$points
    total_points <- gw_raw$entry_history$total_points
    points_on_bench <- gw_raw$entry_history$points_on_bench
    team_value <- gw_raw$entry_history$value

    history <- dplyr::bind_rows(history,
                         tibble::tibble(
                           id,
                           gw,
                           points,
                           total_points,
                           transfers,
                           transfer_cost,
                           points_on_bench,
                           team_value
                         ))

  }


  manager_details %>%
    dplyr::left_join(history, by = c("id" = "id"))


}
