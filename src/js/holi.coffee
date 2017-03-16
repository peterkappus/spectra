class window.Holi
  constructor: () ->
    sol.background("#fff")
    
    colors = "#14f #0f7 #f40 #d09 #fc0 #ff0".split(' ')
    
    burst(sol.width/2, sol.height/2,0)
    #for [1..3]
    #burst(sol.rando(0,sol.width), sol.rando(0,sol.height), sol.sample(colors))

    
  burst = (cx,cy, color) ->
    for i in [1..sol.rando(20,1200)]
      angle = Math.PI * 2 * Math.random()
      inner_rad = sol.rando(sol.width/30,sol.width/7)
      outer_rad = inner_rad + sol.rando(20,sol.width)
      x = cx + (Math.cos(angle) * inner_rad)
      y = cy + (Math.sin(angle) * inner_rad)
      
      x2 = cx + (Math.cos(angle) * outer_rad)
      y2 = cy + (Math.sin(angle) * outer_rad)
      
      thickness = sol.rando(sol.width/800,sol.width/90)
      
      sol.canvas.line(x,y,x2,y2).stroke({width: thickness; color: sol.randColor()})
      
