# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
library(dplyr)
library(lubridate)

Event_Study <- read.table("evts.csv",sep = ",",header = TRUE)
Event_Study$Date <- as.Date(Event_Study$Date)

function(input, output) {

                         
output$table <- DT::renderDataTable(DT::datatable({



        data <- Event_Study
    if (input$Date1 != "All") {
      data <- data[data$Date >= input$Date1,]
    }
    if (input$Date2 != "All") {
      data <- data[data$Date <= input$Date2,]
    }

    if (input$T1 != "All") {
      data <- data[abs(data$T) >= input$T1,]
    }
    if (input$T2 != "All") {
      data <- data[abs(data$T) <= input$T2,]
    }
      data
  }))
  }


