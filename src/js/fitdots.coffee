class window.FitDots
  constructor: () ->
    sol.background("#fff")
    
    x = y = 0
    
    #diam = 
    while x < sol.width()
      sol.canvas.circle(circ_size).cx(x).cy(y).fill({color: sol.sample(colors)})
      console.log(colors[Math.floor(Math.random(colors.length))])