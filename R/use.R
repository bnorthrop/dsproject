#' Use Function
#'
#' The use function installs and loads a package specified by the user after asking for confirmation.
#'
#' @param pkg package to install and load
#'
#' @export
#'
#' @seealso [install.packages()] [library()] [require()]
#'
#' @examples
#' \dontrun{ use(dplyr)}
#' \dontrun{ use(ggplot2)}
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
