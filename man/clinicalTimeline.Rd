% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clinicalTimeline.R
\name{clinicalTimeline}
\alias{clinicalTimeline}
\title{Clinical Timeline Widget}
\usage{
clinicalTimeline(
  data,
  width = 1000,
  height = NULL,
  enableTrackTooltips = TRUE,
  orderAllTooltipTables = NULL,
  plugins = list(),
  sizeByClinicalAttribute = NULL,
  splitByClinicalAttributes = NULL
)
}
\arguments{
\item{data}{JSON data (e.g result of jsonlite::toJson(...))}

\item{width}{width of timeline - default value is 1000}

\item{enableTrackTooltips}{show tooltips on track titles to manage them - default value is TRUE}

\item{orderAllTooltipTables}{Order all tooltip tables by given list of row keys.}

\item{plugins}{\itemize{
\item list of plugins where each list has "obj" as a plugin name, "enabled" to indicate whether ebale it or not and some other attributes if necessary
}}

\item{sizeByClinicalAttribute}{Set the size of each timepoint in a track based on the value of an attribute in the tooltip_tables - list of lists}

\item{splitByClinicalAttributes}{Split a track into multiple tracks based on the value of an attribute in the tooltip_tables - list of lists}
}
\description{
Clinical Timeline Widget
}
\examples{
orderAllTooltipTables <- list("Source", "Location")
plugins <- list(list(obj = "trimClinicalTimeline", enabled = TRUE), list(obj = "clinicalTimelineZoom", enabled = TRUE))
sizeByClinicalAttribute <- list(list("PSA", "Result"), list("Phos", "Result"))
splitByClinicalAttributes <- list(list("Surgery", "Location"), list("Test", "Type"), list("TreatmentType", list("TREATMENT_TYPE", "AGENT")))
}
