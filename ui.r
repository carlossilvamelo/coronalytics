

useShinyjs()#Utilizar javascript 

fluidPage(
  tags$head(
    useShinyjs(),useSweetAlert(),
    HTML('<meta charset="UTF-8">'),
    tags$link(rel = "stylesheet", type = "text/css", href = "estilo.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "fontewesome.css")
  ),
  dashboardPage(
    dashboardHeader(title = "CoronaLytics"),
    dashboardSidebar(
      
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard"
                 , icon = icon("database", class = NULL, lib = "font-awesome"))
      )
    ),
    dashboardBody(class="containerIngestData",
                  tags$div(id="loader",class="loader"),
      tabItems(
        tabItem(class="","dashboard",
                 generalDashboardsPage()
        )
      )
    )
  )


)

