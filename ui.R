dashboardPage(
    dashboardHeader(title='K-Nearest Neighbor Classification',titleWidth=350),
    dashboardSidebar(
        width=350,
        sidebarMenu(
          menuItem('Euclidean Distance',tabName='euclidean'),
          menuItem('Manhattan Distance',tabName='manhattan'),
          menuItem('n-Dimensions',tabName='nDim')
        )#end of sidebarMenu
    ),#end of Sidebar
    dashboardBody(
        tags$head(
        tags$link(rel="stylesheet",href="style.css")
        ),
        tabItems(
            tabItem(tabName='euclidean',
                HTML('<h1>Euclidean Distance</h1>'),
                HTML(
                    '<p>
                        Given a point (x<sub>1</sub>,y<sub>1</sub>) and 
                        (x<sub>2</sub>,y<sub>2</sub>), the Euclidean Distance
                        between the points is given by
                        the formula
                      </p>'
                ),
                HTML(
                    '<blockquote>
                        ((x<sub>2</sub>-x<sub>1</sub>)<sup>2</sup>+
                        (y<sub>2</sub>-y<sub>1</sub>)<sup>2</sup>)<sup>1/2</sup>
                      </blockquote>'
                ),
                HTML(
                    '<p>
                        Let\'s plot some points and calculate the Euclidean distance between them.
                      </p>'
                ),
                #-----------------------------------------------------------------------
                HTML('<div id="left">'),
                HTML('<h2>Pick Point #1</h2>'),
                sliderInput('x1Euc','select the x-coordinate',min=0,max=10,value=1),
                sliderInput('y1Euc','select the y-coordinate',min=0,max=10,value=1),
                #---------------------------------------------------------------------
                HTML('<h2>Pick Point #2</h2>'),
                sliderInput('x2Euc','select the x-coordinate',min=0,max=10,value=9),
                sliderInput('y2Euc','select the y-coordinate',min=0,max=10,value=9),
                HTML('</div>'),
                #-------------------------------------------------------------------
                HTML('<div id="right">'),
                plotOutput('plotEuc'),
                uiOutput('calcEuc'),
                HTML('</div>')
            ),#end of tabItem
            tabItem(tabName='manhattan',
                HTML('<h1>Manhattan Distance</h1>'),
                HTML(
                    '<p>
                        Given a point (x<sub>1</sub>,y<sub>1</sub>) and 
                        (x<sub>2</sub>,y<sub>2</sub>), the Manhattan Distance
                        between the points is given by
                        the formula
                      </p>'
                ),
                HTML(
                    '<blockquote>
                        |x<sub>2</sub>-x<sub>1</sub>|+
                        |y<sub>2</sub>-y<sub>1</sub>|
                      </blockquote>'
                ),
                HTML(
                    '<p>
                        Let\'s plot some points and calculate the Manhattan distance between them.
                      </p>'
                ),

                HTML('<div id="left">'),
                HTML('<h2>Pick Point #1</h2>'),
                sliderInput('x1Man','select the x-coordinate',min=0,max=10,value=1),
                sliderInput('y1Man','select the y-coordinate',min=0,max=10,value=1),

                HTML('<h2>Pick Point #2</h2>'),
                sliderInput('x2Man','select the x-coordinate',min=0,max=10,value=9),
                sliderInput('y2Man','select the y-coordinate',min=0,max=10,value=9),
                HTML('</div>'),

                HTML('<div id="right">'),
                plotOutput('plotMan'),
                uiOutput('calcMan'),
                HTML('</div>')
            ),#end of tabItem
            tabItem(tabName='nDim',
                HTML('<h1>Distance in n-Dimensions</h1'),
                HTML(
                    '<p>
                        The notion of distance can be easily extended to more
                        than two dimensions.  For instance, if one has two
                        points (x<sub>1</sub>,y<sub>1</sub>,z<sub>1</sub>)
                        and (x<sub>2</sub>,y<sub>2</sub>,z<sub>2</sub>) in three dimensions,
                        then the Euclidean distance between the two points is
                        given by:
                    </p>'
                ),
                HTML(
                    '<blockquote>
                        ((x<sub>1</sub>-x<sub>2</sub>)<sup>2</sup>+
                        (y<sub>1</sub>-y<sub>2</sub>)<sup>2</sup>+
                        (z<sub>1</sub>-z<sub>2</sub>)<sup>2</sup>)<sup>1/2</sup>
                    </blockquote>'
                ),
                HTML(
                    '<p>
                        Below, select two points in three dimensions and then
                        calculate either the Euclidean distance or the Manhattan
                        distance between them.
                    </p>'
                ),
                fluidRow(
                    column(
                        4,
                        HTML('<h2>Pick Point #1</h2>'),
                        sliderInput('x1nDim','select the x-coordinate',min=0,max=10,val=1),
                        sliderInput('y1nDim','select the y-coordinate',min=0,max=10,val=1),
                        sliderInput('z1nDim','select the z-coordinate',min=0,max=10,val=1) 
                    ),
                    column(
                        4,
                        HTML('<h2>Pick Point #2</h2>'),
                        sliderInput('x2nDim','select the x-coordinate',min=0,max=10,val=9),
                        sliderInput('y2nDim','select the y-coordinate',min=0,max=10,val=9),
                        sliderInput('z2nDim','select the z-coordinate',min=0,max=10,val=9)                        
                    ),
                    column(
                        4,
                        HTML('<h2>Select Metric</h2>'),
                        radioButtons('metric','',choices=c('Euclidean','Manhattan')),
                        actionButton('calculate','calculate'),
                        uiOutput('calculation')                        
                    )
                )
            )#end of tabItem
        )#end of tabItems
    )#end of Body
)#end of Dashboard