class window.Stalagtites
  constructor: () ->
    #sol.background "#222"
    margin = sol.width/10
    console.log "here I am"
    
    for i in [1..10]
      new Stalag(sol.rando(margin,sol.width-margin), sol.rando(margin*5,sol.height-margin), sol.rando(sol.width/20, sol.width/2))
      
class window.Stalag
  constructor: (start_x,start_y,start_width) ->
    w = start_width
    x = start_x
    y = start_y
    @thickness = 0.09
    shade_of_gray = sol.rando(0,60)

    while w > start_width/100
      #sol.canvas.line(x-(w/2), y, x+(w/2), y).stroke({color: new SVG.Color(sol.rando(20,150),sol.rando(20,150),sol.rando(20,250)); width: @thickness; linecap: 'round'})
      shade_of_gray = Math.round(sol.rando_walk(shade_of_gray,sol.rando(5,30),0,100))
      #console.log shade_of_gray
      sol.canvas.line(x-(w/2), y, x+(w/2), y).stroke({color: new SVG.Color({r:shade_of_gray; g:shade_of_gray; b:shade_of_gray}); width: @thickness; linecap: 'round'})
      y -= @thickness *0.95
      w *= sol.rando(0.92,1.07)
