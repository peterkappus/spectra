class Islamic
  constructor: () ->
    #sol.background("#eee")    
    @_box(sol.width/2, sol.height/2, sol.height/3)

  #straight lines
  _box: (x,y,w) ->
    #thickness = w/5
    h = w #square!
    stroke = {width: 3, color: "#000"}

    sol.canvas.rect(w,h).cx(x).cy(y).stroke(stroke).fill('none')
    @_circ(x,y,w)
    
    #edges
    @_circ(x-w/2, y-w/2, w)
    @_circ(x+w/2, y-w/2, w)
    @_circ(x-w/2, y+w/2, w)
    @_circ(x+w/2, y+w/2, w)
        

    #distance from center to outer circles:
    #hypotenuse = Math.sqrt(Math.pow(w/2,2) + Math.pow(h/2,2))
    #it's a 45 45 90 triangle...
    hypotenuse = w/2 * Math.sqrt(2)
    #console.log((y-(h/2))^2)
    small_diam = 2 * (hypotenuse - w/2) # w/2 = radius
    #sol.line_segment(x,y,Math.PI*2*3/8,hypotenuse-w/2)
        
    @_circ(x,y,small_diam)    
    
  _circ: (x,y,diam) ->
    stroke = {width: 3, color: "#000"}
    sol.canvas.circle(diam).cx(x).cy(y).stroke(stroke).fill('none')
  
