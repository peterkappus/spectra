class window.Walker
  constructor: () ->
    sol.background("#114")
    
    
    for i in [1..Math.random()*20]
      zaggy_line()
    #console.log("ok")    
  
  zaggy_line = () ->        
    y = sol.rando(sol.height/20,sol.height*19/20) # 1/20th to 19/20ths    
    x = sol.rando(sol.width*2/5,sol.height/2) #first line goes to 2/5ths to 1/2
    old_x = 0 #start on the left
    old_y = y
    directions = [0,-1,1]#,1,0,1,0]
    
    stroke_width = 1#Math.random()*5
    
    #while old_x < sol.width
    for i in [1..Math.random()*20]
      #sol.canvas.line(old_x,old_y,x,y).stroke({width: 2, linecap: 'round',color: '#5af'})
      sol.canvas.line(old_x,old_y,x,y).stroke({width: stroke_width, linecap: 'round',color: '#bef'})
      old_x = x
      old_y = y
      amount = sol.rando(sol.width/8, sol.width/4)
      x += amount * directions[Math.floor(Math.random()*directions.length) | 0]
      y += amount * directions[Math.floor(Math.random()*directions.length) | 0]
      #console.log x