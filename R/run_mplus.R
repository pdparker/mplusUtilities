#' Run an open Mplus .inp file
#'
#' @return
#' @export
#'
#' @importFrom MplusAutomation runModels
#' @importFrom rstudioapi getSourceEditorContext navigateToFile
#'
#' @examples
run_mplus <- function(){
  path = rstudioapi::getSourceEditorContext()$path
  if(!grepl(".*\\.inp?$", path, perl=TRUE)) {
    stop("Current file does not appear to be an .inp file.")
  }
  out = gsub("(.*)\\.inp?$","\\1.out",path)
  MplusAutomation::runModels(target = path)
  rstudioapi::navigateToFile(out)
}
