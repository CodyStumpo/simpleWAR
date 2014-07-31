library(shiny)

# Define UI for slider demo application
shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Simple WAR calculator"),
  
  # Sidebar with sliders that demonstrate various available options
  sidebarLayout(
    sidebarPanel(
   h4("Batting, Fielding & Baserunning WAR"),
      # Decimal interval 
    sliderInput("OBP", "OBP:", 
                  min = 0, max = .5, value = 0.32, step=.001),

      # Decimal interval 
      sliderInput("SLG", "SLG:", 
                  min = 0, max = .8, value = 0.4, step=.001),
      
      # Simple integer interval
      sliderInput("PA", "Plate Appearances:", 
                  min=0, max=750, value=0, step=1),
      
      # Copy the line below to make a select box 
      selectInput("Pos", label = "Position:", 
                  choices = list("C","1B","2B","3B","SS", "LF","CF","RF","DH","P"), 
                  selected = "C"),
      
      # Simple integer interval
      sliderInput("UZR", "Defense (relative to position):", 
                  min=20, max=80, value=50, step=5),
      # Simple integer interval
      sliderInput("BSR", "Baserunning:", 
                  min=20, max=80, value=50, step=5),
    
    tags$hr(),
    h4("Pitching WAR"),
    # Copy the line below to make a radioButton
 
   radioButtons("LG", label = "League:", 
                choices = list("NL","AL"), 
                selected = "NL"), #inline=TRUE is supposed to make horizontal
    # Copy the line below to make a select box 
    selectInput("Role", label = "Role:", 
                choices = list("Starter","Closer","Setup","Mopup","Relief"), 
                selected = "Starter"),
    # Simple integer interval
    sliderInput("IP", "Innings Pitched:", 
                min=0, max=400, value=0,step=1), 
    # Simple integer interval
    sliderInput("ERA", "ERA:", 
                min=0, max=6, value=0, step=.01)
    
    ),
    
    # Show a text for the computed answer
    mainPanel(
      br(),br(),br(),br(),br(),br(),
      p(em("Estimate OBP & SLG in a park-neutral environment.")),
      br(),br(),
      h4("Total WAR:", align="center"),
      h1(textOutput("answer"), align="center"),
      p(strong("Over a full season, an average player gets about 2 WAR,"), align="center"),
      p(strong("a good player 4, and a great player 6 or more."), align="center"),
      
      br(),br(),br(),
      
      p(em("Rate Defense (relative to position) & Baserunning on 20-80 scouting scale.")),
      p("50 is major league average & each grade up or down (10 points) is about a standard deviation."),
      p("A grade over a full season equates to about 3 runs for baserunning & 6 runs for defense."),
      
      tags$hr(),
      br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
      p(em("Estimate ERA in a park-neutral environment with average luck & supporting defense.")),
      br(),p("This tool is calibrated to the environment of recent Major League Baseball"),
      p("© Cody Stumpo, 2014")
    )
  )

))
