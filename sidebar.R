#install.packages("pacman")
pacman::p_load(tidyverse,janitor,jsonlite, shiny)

ui <- fluidPage(

  titlePanel("Hello Shiny!"),

  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Dataset", c("iris", "mtcars")),
      actionButton("update", "Update")
    ),

    mainPanel(
      plotOutput("plot")
    )

  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    if (input$dataset == "iris") {
      data <- iris
    } else {
      data <- mtcars
    }
    if (input$update) {
      update <- TRUE
    } else {
      update <- FALSE
    }

    ggplot(data, aes(x = Sepal.Length, y = Sepal.Width)) +
      geom_point()
  })
}

shinyApp(ui, server)


