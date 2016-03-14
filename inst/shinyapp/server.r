library(shiny)
library(hackR)


shinyServer(function(input, output, session){
  localstate <- reactiveValues(text="")
  
  observeEvent(input$button_leetify, {
    leethandle <- leetify(handle=input$inputbox, case.type=input$case.type, sub.type=input$sub.type, leetness=input$leetness, include.unicode=input$include.unicode)
    localstate$text <- capture.output(cat(leethandle))
  })
  
  observeEvent(input$button_random, {
    leethandle <- rleet(case.type=input$case.type, sub.type=input$sub.type, leetness=input$leetness, include.unicode=input$include.unicode)
    localstate$text <- capture.output(cat(leethandle))
  })
  
  output$text <- renderUI({
    localstate$text
  })
})


# shinyServer(function(input, output, session){
#   localstate <- reactiveValues()
#   localstate$ng <- NULL
#   localstate$tb <- capture.output(cat("Input the text you want to process in the box on the left."))
#   
#   observeEvent(input$button_process, {
#     ### Fit
#     localstate$ng <- NULL
#     invisible(gc())
#     
#     localstate$ng <- ngram(str=input$inputbox, n=input$the_n_in_ngram)
#     out <- gsub(x=capture.output(print(localstate$ng)), pattern="\\[1\\]|\"", replacement="")
#     localstate$tb <- capture.output(cat(paste0("PROCESSED:  ", out, ".")))
#   })
#   
#   ### Inspect
#   observeEvent(input$button_inspect, {
#     validate(
#       need(!is.null(localstate$ng), "You must first process some input text.")
#     )
#     
#     localstate$tb <- HTML(paste(capture.output(print(localstate$ng, output="truncated")), collapse="<br/>"))
#   })
#   
#   ### Babble
#   observeEvent(input$button_babble, {
#     validate(
#       need(!is.null(localstate$ng), "You must first process some input text."),
#       need(input$ng_seed == "" || suppressWarnings(!is.na(as.integer(input$ng_seed))), "Seed must be a number or blank.")
#     )
#     
#     seed <- input$ng_seed
#     if (seed == "")
#       seed <- ngram:::getseed()
#     else
#       seed <- as.integer(seed)
#     
#     localstate$tb <- capture.output(cat(babble(ng=localstate$ng, genlen=input$babble_len, seed=seed)))
#   })
#   
#   
#   output$text <- renderUI({
#     localstate$tb
#   })
# })
