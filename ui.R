# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(dplyr)
library(lubridate)


Event_Study <- read.table("evts.csv",sep = ",",header = TRUE)
Event_Study$Date <- as.Date(Event_Study$Date)
T_sequence <- seq(from = 0 , to=max(abs(Event_Study$T)),by=.1  )

fluidPage(
  titlePanel("Event Study Timeline"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("Date1",
                       "Date Range Lower Bound",
                       c("All",
                         unique(as.character(Event_Study$Date))))
    ),
    column(4,
           selectInput("Date2",
                       "Date Range Upper Bound",
                       c("All",
                         unique(as.character(Event_Study$Date))))
    )
  ),
  

  
  fluidRow(
    column(4,sliderInput(inputId="T1",label="T-Stat Lower Bound", min  = 0,max= max(abs(Event_Study$T)),value = 0,step = .1  )
          ),
    column(4,sliderInput(inputId="T2",label="T-Stat Upper Bound", min  = 0,max= max(abs(Event_Study$T)),value = 10,step = .1  )
    )
    
  ),
  
  
  
  fluidRow(    DT::dataTableOutput("table"))  

)