#' Number of accidents per year and month.
#'
#' This function will summarize the number of accidents for each month in each year of \code{years}.
#' If the user provides an invalid year, an error message will be printed.
#'
#' @param years A vector with the years of interest.
#'
#' @return A tibble with the number of accidents for the whole country, for each month per year in \code{years}.
#'
#' @import dplyr
#' @import tidyr
#'
#' @export
fars_summarize_years <- function(years) {
  year=MONTH=NULL
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
