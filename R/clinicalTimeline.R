#' Clinical Timeline Widget
#'
#' @param data JSON data (e.g result of jsonlite::toJson(...))
#' @param width width of timeline - default value is 1000
#' @param enableTrackTooltips show tooltips on track titles to manage them - default value is TRUE
#' @param orderAllTooltipTables Order all tooltip tables by given list of row keys.
#' @param plugins - list of plugins where each list has "obj" as a plugin name, "enabled" to indicate whether ebale it or not and some other attributes if necessary 
#' @param sizeByClinicalAttribute Set the size of each timepoint in a track based on the value of an attribute in the tooltip_tables - list of lists
#' @param splitByClinicalAttributes Split a track into multiple tracks based on the value of an attribute in the tooltip_tables - list of lists
#' 
#' @examples orderAllTooltipTables <- list("Source", "Location")
#' @examples plugins <- list(list(obj = "trimClinicalTimeline", enabled = TRUE), list(obj = "clinicalTimelineZoom", enabled = TRUE))
#' @examples sizeByClinicalAttribute <- list(list("PSA", "Result"), list("Phos", "Result"))
#' @examples splitByClinicalAttributes <- list(list("Surgery", "Location"), list("Test", "Type"), list("TreatmentType", list("TREATMENT_TYPE", "AGENT")))

#' @import htmlwidgets
#'
#' @export
clinicalTimeline <- function(data, width = 1000, height = NULL, enableTrackTooltips = TRUE, orderAllTooltipTables = NULL, plugins = list(), sizeByClinicalAttribute = NULL, splitByClinicalAttributes = NULL) {

  # forward options using x
  x = list(
    data = data,
    width = width,
    enableTrackTooltips = enableTrackTooltips,
    orderAllTooltipTables = orderAllTooltipTables,
    plugins = plugins,
    sizeByClinicalAttribute = sizeByClinicalAttribute,
    splitByClinicalAttributes = splitByClinicalAttributes
  )
  
  # create widget
  htmlwidgets::createWidget(
    name = 'clinicalTimeline',
    x,
    width = width,
    height = height,
    package = 'clinicalTimeline'
  )
}

#' Shiny bindings for clinicalTimeline
#'
#' Output and render functions for using clinicalTimeline within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a clinicalTimeline
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name clinicalTimeline-shiny
#'
#' @export
clinicalTimelineOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'clinicalTimeline', width, height, package = 'clinicalTimeline')
}

#' @rdname clinicalTimeline-shiny
#' @export
renderClinicalTimeline <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, clinicalTimelineOutput, env, quoted = TRUE)
}