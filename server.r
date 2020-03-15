# Define server logic required to draw a histogram
server <- function(input, output, session) {
  shinyjs::hide(id = "loader")
  shinyjs::onclick("dicaTipoEntrada",showModal(modalDicas("dica da mizura")))
  shinyjs::hide(id = "boxTablePreview", anim = TRUE)
  
  generalDashboardsPageServer(input, output, session)
  
}