class window.Walker
  window.foreground_color = '#eef'
  
  constructor: () ->
    sol.background("#003")    
    
    #window.Walker = '#eef'

    dash_array = []
    if (Math.random() > 0.5)
      for i in [1..Math.random()*3]
        dash_array.push(Math.random()*70)
    
    window.dash_array_string = dash_array.join(",")
    window.thickness = Math.random()*4

    #console.log dash_array_string
    
    for i in [1..Math.random()*10]
      zaggy_line(window.thickness, dash_array_string)
    #console.log("ok")    
    
  
  circ = (@x,@y,@color,@stroke_width) ->
    sol.canvas.circle(sol.rando(sol.width/20,sol.width*2/3)).cx(@x).cy(@y).stroke({width: @stroke_width, color: @color, dasharray: window.dash_array_string}).fill('none')
  
  zaggy_line = (@stroke_width, @dash_array_string) ->        
    #y = sol.rando(sol.height/20,sol.height*19/20) # 1/20th to 19/20ths    
    #x = sol.rando(sol.width*2/5,sol.height/2) #first line goes to 2/5ths to 1/2
    #old_x = 0 #start on the left
    #old_y = y #horizontal    
    margin = sol.width/10
    directions = [0,-1,1]#,1,0,1,0]
    
    #old_x = 
    old_x = sol.rando(margin,sol.width-margin) 
    old_y = sol.rando(margin,sol.height-margin)
    
    amount = sol.rando(sol.width/5, sol.width/5)
    x = old_x + amount * directions[Math.floor(Math.random()*directions.length)]
    y = old_y + amount * directions[Math.floor(Math.random()*directions.length)]

    
    #while old_x < sol.width
    for i in [1..Math.random()*20]
      #sol.canvas.line(old_x,old_y,x,y).stroke({width: 2, linecap: 'round',color: '#5af'})
      #sol.canvas.line(old_x,old_y,x,y).stroke({width: @stroke_width, linecap: 'round',color: '#bef'})
      
      sol.canvas.line(old_x,old_y,x,y).stroke({width: window.thickness, dasharray: window.dash_array_string, linecap: 'round',color: window.foreground_color})
      
      old_x = x
      old_y = y
      
      amount = sol.rando(0,sol.width/3)      
      dx = amount * directions[Math.floor(Math.random()*directions.length)]
      dy = amount * directions[Math.floor(Math.random()*directions.length)]
      
      #stay within our margins... if the target is outside, rethink...
      while y+dy > sol.height-margin || y+dy < margin || x+dx > sol.width-margin || x+dx < margin
        amount = sol.rando(0, sol.width/3)      
        dx = amount * directions[Math.floor(Math.random()*directions.length)]
        dy = amount * directions[Math.floor(Math.random()*directions.length)]
      
      if Math.random() < 0.03
        circ(x,y,window.foreground_color,window.thickness, window.dash_array_string)        
        
      x += dx
      y += dy
      