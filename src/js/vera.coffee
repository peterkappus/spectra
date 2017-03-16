class window.Vera  

  constructor: () ->
    #sol.background("#eee")    
    cols = rows = sol.round_rando(3,100)
    #cols = rows = sol.sample([5,10,20])
    
    #@the_color = sol.randColor()
    @color = "#000"
    if(Math.random() > 0.5)
      @color = "#fff"
    for col in [0..cols-1]
      for row in [0..rows-1]
        @_box(col * sol.width/cols, row * sol.height/rows,sol.width/cols, sol.height/rows)    

  #straight lines
  _box: (x,y,w,h) ->
    thickness = w/5
    if(Math.random() > 0.5)      
      #down to the right
      @_my_line(x, y + h/2, x + w/2, y + h, thickness)
      @_my_line(x + w/2, y + 0, x + w, y + h/2, thickness)
    else
      #up to the right
      @_my_line(x, y + h/2, x + w/2, y, thickness)
      @_my_line(x + w/2, y + h, x + w, y + h/2, thickness)
      
  
  #TODO... 
  #curve_box = (x,y,w,h) ->
    
  _my_line: (x1,y1,x2,y2, thickness) ->    
    #console.log(@color)
    sol.canvas.line(x1,y1,x2,y2).stroke({color: @color; width: thickness; linecap: 'round'})
      

