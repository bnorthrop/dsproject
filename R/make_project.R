#' Make Project Function
#'
#' The make project function creates a new project for the user to work in.
#' The function also creates a set of sub-folders stored in the same working directory.
#'
#' @param project name of project
#' @param path location project will be created in
#' @param folders names of the folders in the project
#' @param readme name of readme file created in project
#' @param git version control
#'
#' @import usethis
#' @export
#'
#' @examples
#' \dontrun{ make_project(project = myproject)}
#' \dontrun{ make_project(project = myproject2, folders = c("first", "second", "third", "fourth", "R"))}
make_project <- function (project,
                  path = getwd(),
                  folders = c("figures", "documentation",
                              "data", "reports", "R"),
                  readme = "README.md",
                  git = FALSE) {


  # change to path location
  if(!dir.exists(path)) stop("No such path")
  setwd(path)

  # project directory
  if(!missing(project)) {
    dir.create(project)
    setwd(project)
  }

  # create subdirectories
  for (i in folders){
    dir.create(i)
  }


  # create README.md
  today <- Sys.Date()
  user  <- Sys.info()[["user"]]
  project <- basename(getwd())
  cat("# Project: ", project, "\n\n",
      "## Author: ", user, "\n\n",
      "## Date: ",   format(today, format="%B %d %Y"), "\n\n",
      "## Purpose: \n\n",
      "## Data Sources: \n\n",
      "## Stakeholders: \n\n",
      file = readme,
      sep = "")

  # create RStudio project
  usethis::create_project(".", open=FALSE)

  # add git
  if (git){
     usethis::use_git()
  }


  # activate project
  usethis::proj_activate(".")

}
