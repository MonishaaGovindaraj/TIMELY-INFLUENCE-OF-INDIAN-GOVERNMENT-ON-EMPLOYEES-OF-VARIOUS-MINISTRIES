
library(shiny)
library(plotly)
# Define UI for application that gives the details about the ministry of India

shinyUI(fluidPage(
  
  # Application title
  titlePanel("TIMELY INFLUENCE OF INDIAN GOVERNMENT ON EMPLOYEES OF VARIOUS MINISTRIES"),

      # Showing various tabs
  mainPanel(
  tabsetPanel( type = "tab",
                 #tabPanel("Home"),
                 
               tabPanel("Productivity",h3("Description"),helpText("Air India is the flag carrier airline of India, headquartered at New Delhi.It is owned by Air India Limited, a government-owned enterprise, and operates a fleet of Airbus and Boeing aircraft serving 94 domestic and international destinations. The airline has its hub at Indira Gandhi International Airport, New Delhi, alongside several focus cities across India. Air India is the largest international carrier out of India with an 18.6% market share. Over 60 international destinations are served by Air India across four continents.
                                                                   TruJet is an Indian regional airline based at Rajiv Gandhi International Airport in Hyderabad.
                                                                   JetLite was a low-cost subsidiary of Jet Airways.It was formerly known as Air Sahara until the buyout by Jet Airways which rebranded the airline as JetLite. On April 17, 2019, JetLite grounded all of its flights and ceased all operations, in tandem with its parent company, Jet Airways."),
                                                        fluidRow(radioButtons("Airplanes", h3("Pick Any One Airplane Industry",align="center"),
                                                                choices = list("Air India" = "air", "Jetlit" = "jet",
                                                                               "Trujet" = "tru")),
                                                                tableOutput("airplanes"),plotOutput("airplanes2"))
                                                        ),
                
               tabPanel("Employment and Empanelled",h3("Description"),helpText("The Ministry of Railways is a ministry in the Government of India, responsible for the country's rail transport. The ministry operates the state-owned Indian Railways, an organisation that operates as a monopoly in rail transport and is headed by the Chairman of Railway Board. The ministry is headed by the Minister of Railways, a cabinet-level minister who used to present the rail budget every year in parliament.
                                                                               The Ministry of Personnel, Public Grievances and Pensions is a ministry of the Government of India in personnel matters specially issues concerning recruitment, training, career development, staff welfare as well as the post-retirement dispensation.The ministry is also concerned with the process of responsive people-oriented modern administration. Allocation of Business Rules defines the work allotted for the ministry."),
                        mainPanel(
                            fluidRow(
                             plotOutput("plot1", width  = "700px",height = "400px"),
                             plotOutput("plot2", width  = "700px",height = "400px"))
                          )
                        ),
                                                              
               tabPanel("Monetry Influence",h3("Description"),helpText("The Ministry of Finance is an important ministry within the Government of India concerned with the economy of India, serving as the Indian Treasury Department. In particular, it concerns itself with taxation, financial legislation, financial institutions, capital markets, centre and state finances, and the Union Budget.The Ministry of Finance is the apex controlling authority of the Indian Revenue Service, Indian Economic Service, Indian Cost Accounts Service and Indian Civil Accounts Service.
                                                                        Ministry of Communications is a union ministerial agency under the Government of India responsible for telecommunications and postal service. It was carved out of Ministry of Communications and Information Technology on 19 July 2016. It consists of two departments viz. Department of Telecommunications and the Department of Posts."), 
                        mainPanel(
                          fluidRow(
                            plotOutput("communication")
                          )
                        )                                      
                  ),
               
               tabPanel("Acts Influence",h3("Description"),helpText("PMRPY:The Pradhan Mantri Rojgar Protsahan Yojana(PMRPY) Plan Scheme has been designed to incentivise employers for generation of new employment, where Government of India will be paying the full employer's contribution towards EPF & EPS both w.e.f 01.04.2018 (earlier benefit was applicable for employer's contribution towards EPS only) for the new employment. This scheme has a dual benefit, where, on the one hand, the employer is incentivised for increasing the employment base of workers in the establishment, and on the other hand, a large number of workers will find jobs in such establishments.
                                                                    PMPRPY:Pradhan Mantri Paridhan Rojgar Protsahan Yojana (PMPRPY) permits employers, registered with EPFO, to obtain a 3.67% EPF contribution paid by the Government in adding up to the 8.33% EPS contribution. This benefit can be obtained by the textile (apparel) sector establishments that deal with the Manufacture of wearing apparel, in particular NIC Codes 1410 and 1430."),
                                                        
                        
                        mainPanel(
                            plotlyOutput("pie2", width  = "700px",height = "400px"),
                            plotlyOutput("pie1", width  = "700px",height = "400px")
                            #splitLayout(plotlyOutput("pie2"),plotlyOutput("pie1"))
                            
                          )
                          ),
                         
                 
               tabPanel("Labour and Employment",h3("Description"),helpText("The Ministry of Labour & Employment is one of the oldest and most important Ministries of the Government of India. The Ministry of Labour and Employment is India's federal ministry which is responsible to protect and safeguard the interest of workers in general and the poor, deprived and disadvantaged sections of the society."),
                                                      (tabsetPanel(type = "tab",
                                                       tabPanel("Less than 18", plotOutput("distPlot")),
                                                       tabPanel("18-21",plotOutput("distPlot2")),
                                                       tabPanel("22-25", plotOutput("distPlot3")),
                                                       tabPanel("26-28", plotOutput("distPlot4")),
                                                       tabPanel("29-35", plotOutput("distPlot5")),
                                                       tabPanel("More than", plotOutput("distPlot6"))
                               
                  ))),
               
                tabPanel("Farmers suicide", h3("Description"),
                          helpText("The Ministry of Agriculture and Farmers' Welfare (formerly Ministry of Agriculture), a branch of the Government of India, is the apex body for formulation and administration of the rules and regulations and laws related to agriculture in India. The three broad areas of scope for the Ministry are agriculture, food processing and co-operation. The agriculture ministry is headed by Minister of Agriculture Narendra Singh Tomar. Abhishek Singh Chauhan, Krishna Raj and Parsottambhai Rupala are the Ministers of State."),
                         mainPanel(
                             plotlyOutput("agri"),
                             plotOutput("agri2")
                           )
                         
                ),
                      
               tabPanel("Vigilence", h3("Description"),
                          helpText("The Ministry of Consumer Affairs, Food and Public Distribution is a government ministry of India. The Ministry is headed by a Cabinet rank minister. The current Minister is Ram Vilas Paswan"),
                        mainPanel(
                          plotlyOutput("lines"),
                          plotOutput("vigi2")
                          
                        ))
  )
    )
  )
)
  
      
  

