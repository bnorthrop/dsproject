#' Import Function
#'
#' Import function takes a file specified by the user and imports it into R as a data frame.
#'
#' @param file a file containing data the user wants to import into R
#' @param ... an argument passed to the import function
#'
#' @import tools haven readxl vroom
#' @export
#'
#' @seealso [read.csv()] [readxl::read_excel()]
#'
#' @return a data frame
#' @examples
#' \dontrun{
#' mydata <- import(datafile.dta)
#' }
import <- function(file, ...){

  # if no file specified, prompt user

  if(missing(file))
    file <- file.choose()


  # get file info

  file <- tolower(file)
  basename <- basename(file)
  extension <- tools::file_ext(file)


  # import dataset

  df <- switch(extension,
           "sas7bdat" = haven::read_sas(file, ...),
           "dta" = haven::read_stata(file, ...),
           "sav" = haven::read_spss(file, ...),
           "xlsx" = readxl::read_excel(file, ...),
           "xls" = readxl::read_excel(file, ...),
           vroom::vroom(file, ...)
           )

  # return data frame
  return(df)
}

