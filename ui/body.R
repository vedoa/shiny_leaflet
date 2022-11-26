tabItems(
  
  tabItem(tabName = "welcome",
    welcomeUI(id = "show_readme")
  ),
  
  tabItem(tabName = "example_basic",
          tabBox(id = "tabbox_example_basic", 
                 width = 12,
                 basicExampleUI(id = "example1", type = "click", title = "Get long/lat on click"),
                 basicExampleUI(id = "example2", type = "DT", title = "DT and marker interaction"),
                 basicExampleUI(id = "example3", type = "customMarker", title = "Select custom marker")
          )
  ),
  
  tabItem(tabName = "example_advanced",
          tabBox(id = "tabbox_example_advanced", 
                 width = 12,
                 advancedExample1UI(id = "colorPicker", title = "HTML color picker with custom shape")
          )
          )
)
