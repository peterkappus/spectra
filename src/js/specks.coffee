class window.Specks
  constructor: (cx,cy,color) ->
    max_distance = sol.width
    min_distance = 0
    min_size = sol.width/1200
    max_size = sol.width/120
    #color = "#000"
    
    for i in [1..sol.rando(3,200)]
      angle = Math.PI * 2 * Math.random()
      distance = sol.rando(min_distance, max_distance)
      #size = min_size + ((max_distance - distance) / max_distance * (max_size-min_size))
      size = min_size + sol.rando(0,((max_distance - distance) / max_distance * (max_size-min_size)))
      
      x = cx + (Math.cos(angle) * distance)
      y = cy + (Math.sin(angle) * distance)
      
      #thickness = sol.rando(sol.width/800,sol.width/90)
      #console.log(x)
      
      sol.canvas.circle(size).cx(x).cy(y).fill({color: color})
      
