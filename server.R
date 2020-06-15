
library(shiny)
library(plotly)

shinyServer(function(input, output) {
  
 
# Labour and Employment
  
  output$distPlot =reactive({
        dat=read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/lab.csv")
    
    output$distPlot1 = renderPlot(
      plot(dat$month,dat$Less.than.18)
      )
    output$distPlot2 = renderPlot(
      plot(dat$month,dat$X18.21)
    ) 
    output$distPlot3 = renderPlot(
      plot(dat$month,dat$X22.25)
    )
    output$distPlot4 = renderPlot(
      plot(dat$month,dat$X26.28)
    )
    output$distPlot5 = renderPlot(
      plot(dat$month,dat$X29.35)
    )
    output$distPlot6 = renderPlot(
      plot(dat$month,dat$More.than)
    )
})

## Productivity
    datasetInput <- reactive({
    switch(input$Airplanes,
           "tru" = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Trujet.csv"),
           "jet" = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Jetlite.csv"),
           "air" = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/AirIndia.csv")
           )
  })
  
  output$airplanes = renderTable({
    datasetInput()
})
  #output$airplanes2 = renderPlot({
  #da=read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/AirIndia.csv")
  #attach(da)
  #regr=lm(da$AVAILABLE_TONNE~da$TONNE_PERFORMED)
   # plot(regr$residuals,col="red")
    #plot(regr$coefficients,col="red")
    #plot(regr$effects,col="blue")
    #plot(regr$fitted.values,col="orange")
  #})
#Employment and empanelled
  
  dt1=read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Railways.csv")
  dt2=read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Civilian.csv")
  attach(dt1)
  attach(dt2)
  
  output$plot1 <- renderPlot({
      test<-cbind(Retired,Empanelled)
      cols <- c('red','blue');
      ylim <- c(0,max(dt1[c('Retired','Empanelled')])*1.8);
      par(lwd=6);
      barplot(
         t(dt1[c('Retired','Empanelled')]),
         beside=T,
         ylim=ylim,
         border=cols,
         col='white',
         names.arg=dt1$Year,
         main = 'Railways',
         xlab='Year',
         ylab='Count',
         legend.text=c('Retired','Empanelled'),
         args.legend=list(text.col=cols,col=cols,border=cols,bty='n')
      )
  })
      
      output$plot2 <- renderPlot({
        test<-cbind(More.than.5.Years.of.Service.in.PHL,More.than.10.Years.of.Service.in.PHL,More.than.15.Years.of.Service.in.PHL)
        cols <- c('red','blue','green');
        ylim <- c(0,max(dt2[c('More.than.5.Years.of.Service.in.PHL','More.than.10.Years.of.Service.in.PHL','More.than.15.Years.of.Service.in.PHL')])*1.8);
        par(lwd=6);
        barplot(
          t(dt2[c('More.than.5.Years.of.Service.in.PHL','More.than.10.Years.of.Service.in.PHL','More.than.15.Years.of.Service.in.PHL')]),
          beside=T,
          ylim=ylim,
          border=cols,
          col='white',
          names.arg=dt2$Region,
          main = 'Civilian',
          xlab='Region',
          ylab='Count',
          legend.text=c('More.than.5.Years.of.Service.in.PHL','More.than.10.Years.of.Service.in.PHL','More.than.15.Years.of.Service.in.PHL'),
          args.legend=list(text.col=cols,col=cols,border=cols,bty='n')
        )
        }
      )
      
#Monetary influence
      
com = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Communications.csv")
attach(com)
  
  output$communication = renderPlot({
    c = cbind(Revenue.in.Crores,Expenditure.in.Crores,Total.Employee.Cost.in.Crores)
    barplot(c,beside = T,main ="Salary and allowance of MTNL",ylab = "Crores rate", xlab = "Communication")  
  })
  
  
#Acts Influence
pmrpy = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/PMRPY.csv")
attach(pmrpy)
a = pmrpy[ which(pmrpy$No..of.Employees.Benefited>0), ]
pmprpy = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/PMPRPY.csv")
attach(pmprpy)
b = pmprpy[ which(pmprpy$Registered.Employees>0), ]


  output$pie1 = renderPlotly({
    #pie(pmrpy$No..of.Employees.Benefited)
    x =plot_ly(a, labels = a$State.UT, values = a$No..of.Employees.Benefited, type = "pie", title = "PMRPY")
  })
  
  output$pie2 = renderPlotly({
    #pie(pmprpy$Registered.Employees)
     y = plot_ly(b, labels = b$State.UT, values = b$Registered.Employees, type = "pie", title = "PMPRPY")
  })
  

#Farmenr's suicide
  
agri = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Agriculture.csv")
attach(agri)
ag = data.frame(agri$State, agri$X2014_Total, agri$X2015_Total)

output$agri = renderPlotly({
  plot_ly(ag, x = agri$State, y = agri$X2014_Total, type = 'bar',name = "2014") %>%
  add_trace(y = agri$X2015_Total, name = "2015") %>%
  layout(title = "Farmer's Suicide",
         xaxis = list(title = 'Count'), barmode = 'group')
})

output$agri2 = renderPlot({
  agr = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Agri2.csv")
  attach(agr)
  regr=lm(agr$State.ID~agr$X2014_Total + agr$X2015_Total)
    plot(regr$residuals,col="blue")
  #plot(regr$coefficients,col="re
  #plot(regr$effects,col="blue")
  #plot(regr$fitted.values,col="orange")
  
})

#Vigilence

vigi = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Vigilence.csv")
attach(vigi)
vi = data.frame(vigi$Year,vigi$Downgradation.Damage.of.stocks...Major, vigi$Downgradation.Damage.of.stocks...Minor)

output$lines = renderPlotly({
  plot_ly(vi, x = vigi$Year, y = vigi$Downgradation.Damage.of.stocks...Major, name = 'MAjor', type = 'scatter', mode = 'lines',
             line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y =vigi$Downgradation.Damage.of.stocks...Minor, name = 'Minor', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  layout(title = "Vigilence",
         xaxis = list(title = "Year"),
         yaxis = list (title = "Stocks"))

})

output$vigi2 = renderPlot({
  vig = read.csv("D:/8th semester books/Data Visualization lab/R Shiny/Govt__ministry/Data/Vigilence2.csv")
  attach(vig)
  regr2=lm(vig$Year~vig$Downgradation.Damage.of.stocks...Major + vig$Downgradation.Damage.of.stocks...Minor)
  plot(regr2$residuals,col="green")
})  
  
  
  
})