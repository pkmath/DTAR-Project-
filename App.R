# Call all the functions we will need
files.sources = list.files(path = "/cloud/project/scripts/", full.names = T)
sapply(files.sources, source)

# libraries needed (the first time may take some minutes, for the installations needed)
charge_libraries()

# Shiny App
shinyApp(
  ui = tagList(
    shinythemes::themeSelector(),
    navbarPage(
      theme = "cosmo",
      "Accounting Program",
      tabPanel("Data",
               sidebarPanel(
                 fileInput("file", "Import data (.xlsx)"),
                 actionButton("action2", "Import", class = "btn-primary")
               ),
               mainPanel(
                 tabsetPanel(
                   tabPanel("Income & Expenses",
                            DT::dataTableOutput("table"), tags$script(HTML('$(document).on("click", "input", function () {
                       var checkboxes = document.getElementsByName("selected");
                       var checkboxesChecked = [];
                       for (var i=0; i<checkboxes.length; i++) {
                       if (checkboxes[i].checked) {
                       checkboxesChecked.push(checkboxes[i].value);
                      }
                      }
                     Shiny.onInputChange("checked_rows",checkboxesChecked);  })'))
                   ),
                   tabPanel("Budget","This panel is intentionally left blank"),
                   tabPanel("Categories",  DT::dataTableOutput("table2"))
                 )
               )
      ),
      tabPanel("Control", "This panel is intentionally left blank"),
      tabPanel("About",uiOutput("md_file"))
      
    )
  ),
  server = function(input, output) {
    output$table <- DT::renderDataTable({
      data$check <-''
      data$check[2:5]<-'checked=\"checked\"'
      data[["check1"]]<-glue::glue('<input type="checkbox" name="selected" {data$check} value="{1:nrow(data)}"><br>')
      datatable(data, 
                filter = 'top', options = list(scrollX = T, paging = FALSE, escape = FALSE),
                rownames= FALSE,
                class = 'cell-border compact', editable = T,
                selection="none")})
    output$table2 <- DT::renderDataTable({
      datatable(categories, 
                filter = 'top', options = list(scrollX = T),
                rownames= FALSE,
                class = 'cell-border compact', editable = T,
                selection="none")})
    output$md_file <- renderUI({
      file <- "/cloud/project/Quick start Guide.Rmd"
      includeMarkdown(file)
    })
  }
)

