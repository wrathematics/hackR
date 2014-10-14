library(shiny)


about.thisapp <- HTML("
  <p>
  This 
  <a href='http://www.rstudio.com/products/shiny/'>shiny</a> 
  app uses 
  <a href='https://github.com/wrathematics/hackR'>the hackR package</a>, 
  where you can also find the 
  <a href='https://github.com/wrathematics/hackR/tree/master/inst/hackR'>source</a>
  for this shiny app.
  </p>
  
  <p>
  This app is inspired by crappy movies like Hackers, where
  people call themselves things like ne0BuRn.  With this app,
  you're one step closer to hacking the gibson.
  </p>
  
  
  <p>
  Hosting is generously provided by 
  <a href='https://www.shinyapps.io/'>RStudio</a>.
  </p>"
)


type_print <- c("lower", "upper", "unchanged", "random", "alternating")


shinyUI(
  fluidPage(
    titlePanel("2 l33t 4 u"),
    fluidRow(
    sidebarPanel(
      tags$textarea(id="inputbox", rows=2, cols=60, "Put the text in here that you want to l33tify."),
      br(),
      sliderInput("leetness", "Leetness", 0, 1, 0.4, step=0.05, ticks=TRUE),
      selectizeInput("case.type", "Casing Options", type_print, "alternating"),
      radioButtons("sub.type", "Substitution Type", c("simple", "complex"), "simple", inline=TRUE),
      checkboxInput("include.unicode", "Include Unicode?", value=FALSE),
      actionButton("button_leetify", "Leetify"),
      actionButton("button_random", "Random")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Leet Handle", htmlOutput("text")),
        tabPanel("About This App", helpText(about.thisapp))
      )
    )
  ))
)

