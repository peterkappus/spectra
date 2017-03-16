class window.Squigs  
  constructor: () ->
    #sol.background("#eee")    
    #modern_loop()
    #big_squigs()
    
  @big_squigs: () ->
    delta = sol.width
    count = 1#sol.rando(1,10)
    thickness = sol.rando(10,30)
    is_closed = false
    Squigs.MARKER_RAD = 0#sol.rando(0, sol.width/2)
    
    for i in [1..30]#sol.rando(9,12)]
      solo_squig(count,thickness,new SVG.Color({r: sol.round_rando(0,255), g: sol.round_rando(0,80), b: sol.round_rando(0,75)}), delta, is_closed)
      
    #for i in [1..sol.rando(1,20)]
    #  solo_squig(sol.rando(5,50), sol.randColor())
    
  #modern art looking loopy thing with marker discs
  @modern_loop: () ->
    #sol.background("#fff")
    delta = sol.width / sol.rando(3,10)
    count = sol.rando(1,5)
    thickness = sol.rando(0.2,sol.width/80)
    is_closed = true
    Squigs.MARKER_RAD = sol.rando(0, sol.width/2)
    
    #override
    #count = 30
    #thickness = 2
    delta = sol.width 
    
    solo_squig(count,thickness,new SVG.Color({r: 0, g: 0, b: sol.round_rando(0,150)}), delta, is_closed)
    #solo_squig(50,0.2,'#003')
    
    
  
  #TODO: simple squig like we had last time
  # path..."M C random random random random" 
  #simple_squig...
  
  solo_squig = (point_count, stroke_width, color, delta, is_closed) ->
    sol.canvas.path(get_walking_points_string(point_count,delta,is_closed)).stroke({width: stroke_width; linecap: 'round'; color: color}).fill('none')
    
  animate_squig  = (@squig, point_count, duration_ms) ->
    @squig.animate(duration_ms).plot(get_walking_points_string(point_count,delta,is_closed))
    morph_timer = window.setInterval((->
      @squig.animate(duration_ms).plot(get_walking_points_string(point_count,delta,is_closed))),8000)

  #move a little bit each time...
  get_walking_points_string = (count, delta, is_closed) ->
    first_x = old_x = sol.rando(20,sol.width-20)
    first_y = old_y = sol.rando(20,sol.height-20)
    
    #first point
    path_string = "M #{old_x} #{old_y} "
    marker_circle(first_x,first_y)
    #sol.canvas.circle(20).cx(first_x).cy(first_y)
    
    #while i <= count
    for i in [0..count-1]
      #console.log(i)
      #you could just make these random if you want points all over the place
      #x = sol.rando(0, sol.width)
      #y = sol.rando(0, sol.height)
      
      path_string += " C " 
      
      #usually, we want three points: Control1xy, control2xy and targetxy  
      stop_at = 3
      
      #but if it's the last one (and we're closing the loop) we only need 2 (cuz the last one is the starting point
      if (i == count-1 && is_closed)
        stop_at = 2
        
      for j in [1..stop_at]
        x = sol.rando_walk(old_x, delta, 20, sol.width-20)
        y = sol.rando_walk(old_y, delta, 20, sol.height-20)
        old_x = x
        old_y = y
        path_string += " #{x}, #{y} "
      marker_circle(x,y,Squigs.MARKER_RAD)
      i++
    
    #close the loop...
    if(is_closed)
      console.log("OK!")
      path_string += " #{first_x}, #{first_y}"
    
    return path_string
  
  marker_circle = (x,y,rad) ->
    sol.canvas.circle(rad).cx(x).cy(y).fill({color:'#f00'})
    #sol.canvas.circle(rad).cx(x).cy(y).fill({color:sol.randColor()})
    #new Specks(x,y,"#f00")
    