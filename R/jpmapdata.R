#' Locate jpmapdata Boundary Files
#'
#' @return Path to the installed `extdata` directory.
#' @export
#'
#' @examples
#' jpmapdata_dir()
jpmapdata_dir <- function() {
  system.file("extdata", package = "jpmapdata", mustWork = TRUE)
}

#' List Boundary Files Shipped with jpmapdata
#'
#' @return A data frame with `year`, `pref_code`, `prefecture`, and `path`.
#' @export
#'
#' @examples
#' available_jpmapdata()
available_jpmapdata <- function() {
  path <- jpmapdata_dir()
  files <- list.files(
    path,
    pattern = "^jpmap_boundaries_[0-9]{4}(_[0-9]{2})?[.]gpkg$",
    full.names = TRUE
  )

  if (length(files) == 0) {
    return(data.frame(
      year = integer(),
      pref_code = character(),
      prefecture = character(),
      path = character()
    ))
  }

  file_names <- basename(files)
  years <- as.integer(sub("^jpmap_boundaries_([0-9]{4})(_[0-9]{2})?[.]gpkg$", "\\1", file_names))
  pref_code <- rep(NA_character_, length(file_names))
  has_pref_code <- grepl("^jpmap_boundaries_[0-9]{4}_[0-9]{2}[.]gpkg$", file_names)
  pref_code[has_pref_code] <- sub(
    "^jpmap_boundaries_[0-9]{4}_([0-9]{2})[.]gpkg$",
    "\\1",
    file_names[has_pref_code]
  )

  data.frame(
    year = years,
    pref_code = pref_code,
    prefecture = prefecture_name_from_code(pref_code),
    path = normalizePath(files, mustWork = FALSE)
  )
}

prefecture_name_from_code <- function(code) {
  out <- rep(NA_character_, length(code))
  match_idx <- match(code, jp_prefectures$pref_code)
  hit <- !is.na(match_idx)
  out[hit] <- jp_prefectures$prefecture[match_idx[hit]]
  out
}
