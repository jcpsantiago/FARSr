#' Number of accidents from multiple years.
#'
#' This function will read in data from multiple years and save it in a list,
#' in which each element is a tibble for each year and month, where each row is
#' an accident. It will print an error message, if the user provides an invalid year.
#'
#' @param years A vector containing the years of interest.
#'
#' @return A list of tibbles.
#'
#' @import dplyr
#'
#' @export
fars_read_years <- function(years) {
  year=MONTH=NULL
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
