class window.CrossLines  
  constructor: () ->    
    @foreground_color = "#000"
    @thickness = 5
    @margin = 0 #sol.width/10
    @max_delta = sol.width/10
    sol.background("#eed")
    
    for i in [0..sol.rando(10,2500)]
      x = sol.rando(0,@margin)
      new_x = sol.width - sol.rando(0,@margin)
      y = sol.rando(0,sol.height)
      next_y = y + sol.rando(-@max_delta/2,@max_delta/2)
      @thickness = sol.rando(0.001, sol.width/200)
      sol.canvas.line(x,y,new_x,next_y).stroke({color: @foreground_color; width: @thickness; linecap: 'round'})
      #console.log(next_y)
