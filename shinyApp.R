library(shiny)
library(jsonlite)
library(clinicalTimeline)

# Load or generate the data for clinicalTimeline
data <- fromJSON("./inst/examples/data1.json")
json_data <- toJSON(data, auto_unbox = TRUE)

# Define UI for application
ui <- fluidPage(
  titlePanel("Clinical Timeline App"),

  # Output for the clinicalTimeline widget
  clinicalTimelineOutput("timeline", width = "100%", height = "500px")
)

# Define server logic
server <- function(input, output, session) {
  
  # Render the clinicalTimeline widget
  output$timeline <- renderClinicalTimeline({
    clinicalTimeline(json_data, width = 1000)
  })
}

# Run the application 
options(shiny.autoload.r=FALSE)
shinyApp(ui = ui, server = server)
