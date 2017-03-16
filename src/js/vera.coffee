class window.Vera  
  constructor: () ->
    #sol.background("#eee")    
    cols = rows = sol.round_rando(3,100)
    
    for col in [0..cols-1]
      for row in [0..rows-1]
        box(col * sol.width/cols, row * sol.height/rows,sol.width/cols, sol.height/rows)    
  
  box = (x,y,w,h) ->
    thickness = w/5
    if(Math.random() > 0.5)
      #down to the right
      sol.canvas.line(x,y+h/2, x+w/2, y+h).stroke({color: "#000"; width: thickness; linecap: 'round'})
      sol.canvas.line(x+ w/2, y+0, x+w, y+h/2).stroke({color: "#000"; width: thickness; linecap: 'round'})
    else
      #up to the right
      sol.canvas.line(x,y+h/2, x+w/2, y).stroke({color: "#000"; width: thickness; linecap: 'round'})
      sol.canvas.line(x + w/2, y+h, x+w, y+h/2).stroke({color: "#000"; width: thickness; linecap: 'round'})
      