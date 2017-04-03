shinyServer(function(input,output){

	#Euclidean
	output$plotEuc<-renderPlot({
	    x1<-input$x1Euc
	    y1<-input$y1Euc
	    x2<-input$x2Euc
	    y2<-input$y2Euc
	    label1<-paste('(',x1,',',y1,')',sep='')
	    label2<-paste('(',x2,',',y2,')',sep='')
	    
	    if(y1>y2){
	      yOffset1<-.5
	      yOffset2<--.5
	    }else{
	      yOffset1<--.5
	      yOffset2<-.5
	    }
	    
	    points<-data.frame(x=c(x1,x2),y=c(y1,y2),label=c(label1,label2),yOffset=c(yOffset1,yOffset2))
	    
	    ggplot()+
	      geom_point(data=points,aes(x=x,y=y))+
	      geom_line(data=points,aes(x=x,y=y))+
	      geom_text(data=points,aes(x=x,y=y+yOffset,label=label))+
	      scale_x_continuous(breaks=seq(0,10),limits=c(-1,11))+
	      scale_y_continuous(breaks=seq(0,10),limits=c(-1,11))+
	      coord_equal()
	})#end of renderPlot

	#---------------------------------------------------------------
  
	output$calcEuc<-renderUI({
	    x1<-input$x1Euc
	    y1<-input$y1Euc
	    x2<-input$x2Euc
	    y2<-input$y2Euc
	    d<-round(sqrt((x1-x2)^2+(y1-y2)^2),4)
	    html_string<-paste('<p>Euclidean Distance:  ((',x1,'-',x2,')<sup>2</sup>+(',y1,'-',y2,')<sup>2</sup>)<sup>1/2</sup> = ',d,'</p>',sep='')
	    HTML(html_string)
	})#end of renderUI

	

	#Manhattan
	output$plotMan<-renderPlot({
	    x1<-input$x1Man
	    y1<-input$y1Man
	    x2<-input$x2Man
	    y2<-input$y2Man
	    x3<-x2
	    y3<-y1
	    label1<-paste('(',x1,',',y1,')',sep='')
	    label2<-paste('(',x2,',',y2,')',sep='')
	    label3<-paste('(',x3,',',y3,')',sep='')
	    
	    if(y1>y2){
	      yOffset1<-.5
	      yOffset2<--.5
	      yOffset3<-.5
	    }else{
	      yOffset1<--.5
	      yOffset2<-.5
	      yOffset3<--.5
	    }
	    
	    points<-data.frame(x=c(x1,x3,x2),y=c(y1,y3,y2),label=c(label1,label3,label2),yOffset=c(yOffset1,yOffset3,yOffset2))
	    
	    ggplot()+
	      geom_point(data=points,aes(x=x,y=y))+
	      geom_path(data=points,aes(x=x,y=y))+
	      geom_text(data=points,aes(x=x,y=y+yOffset,label=label))+
	      scale_x_continuous(breaks=seq(0,10),limits=c(-1,11))+
	      scale_y_continuous(breaks=seq(0,10),limits=c(-1,11))+
	      coord_equal()
	})

	#---------------------------------------------------------------
	  
  	output$calcMan<-renderUI({
	    x1<-input$x1Man
	    y1<-input$y1Man
	    x2<-input$x2Man
	    y2<-input$y2Man
	    d<-abs(x1-x2)+abs(y1-y2)
	    html_string<-paste('<p>Manhattan Distance:  |',x1,'-',x2,'|+|',y1,'-',y2,'| = ',d,'</p>',sep='')
	    HTML(html_string)
  	})

  	#n-Dimensions
  	message<-eventReactive(input$calculate,{
  		x1<-input$x1nDim
  		y1<-input$y1nDim
  		z1<-input$z1nDim
  		x2<-input$x2nDim
  		y2<-input$y2nDim
  		z2<-input$z2nDim
  		if(input$metric == 'Euclidean'){
  			d = round(sqrt((x1-x2)^2 + (y1-y2)^2 +(z1-z2)^2),2)
  		}else{
  			d = round(abs(x1-x2) + abs(y1-y2) + abs(z1-z2),2)
  		}
  		return(as.character(d))
  	})

  	output$calculation<-renderUI(message())

	})#end of shinyServer