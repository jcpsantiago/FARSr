#' Plot accidents on a map.
#'
#' This function will plot accidents on a map, for a given state and year. Each dot represents a single accident.
#' It will fail if the user provides an invalid \code{state.num} or \code{year}.
#'
#' @param state.num An integer identifying the state.
#' @param year The year of interest.
#'
#' @return A plot with the state outline and individual points representing accidents.
#'
#' @import maps
#' @import graphics
#'
#' @export
fars_map_state <- function(state.num, year) {
  STATE=NULL
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
