#' Use Package Function
#'
#' The use (package) function installs and loads a package specified by the user.
#'
#' @param pkg package to install and load
#'
#' @export
#'
#' @seealso [install.packages()] [library()] [require()]
#'
#' @examples
#' # CHECK_EXAMPLES_HERE
#' \dontrun{
#' use(dplyr)
#' use(ggplot2)
#' }
use <- function(pkg) {
  pkg <- as.character(substitute(pkg))
  if (!suppressWarnings(require(pkg, character.only = TRUE))) {
    msg <- paste("Install package", pkg, "(y/n)? ")
    answer <- readline(msg)
    answer <- substr(tolower(trimws(answer)), 1, 1)
    if (answer == "y") {
      install.packages(pkg)
      require(pkg, character.only = TRUE)
    } else {
      msg <- paste("Package", pkg, "not loaded.")
      message(msg)
    }
  }
}
