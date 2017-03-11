#' Read csv file.
#'
#' This function will read a csv file into a tibble. It will fail to run
#' if the user provides an invalid filename.
#'
#' @param filename A string containing the filename.
#'
#' @return A tibble object containing data from the corresponding file.
#'
#' @import dplyr
#' @import readr
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
