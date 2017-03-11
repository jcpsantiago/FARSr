#' Make filename for specific \code{year}.
#'
#' This function will create a string with the appropriate filename,
#' in order to import from a given year. It will fail to run if the
#' user provides a string instead of a number.
#'
#' @param year The year from which you want data.
#'
#' @return A string with the filename.
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
