class window.Beads
  constructor: () ->
    @foreground_color = "#000"
    y = 0
    while y < sol.height
      sol.canvas.line(0, y, sol.width, y).stroke({color: @foreground_color; width: @thickness; linecap: 'round'}) 
      
      y += sol.height/50 + (Math.random()* sol.height/100)
      x = 0
      while x < sol.width
        sol.canvas.circle(sol.rando(sol.width/90,sol.width/50)).cx(x).cy(y).stroke({color: @foreground_color; width: sol.rando(sol.width/400,sol.width/100)}).fill('none')
        x += sol.height/50 + (Math.random()* sol.height/50)

  