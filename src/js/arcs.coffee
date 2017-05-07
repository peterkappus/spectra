window.do_arcs = () ->
  #arc: (cx,cy,rad,start_degrees, end_degrees, clockwise_flag, stroke_params) ->
  ###
  arcs = new Arcs()
  arcs.arc(sol.width/2, sol.height/2, sol.width/5, 100, 260, 1, {width: 10, color: "#000", linecap: "round"})
  arcs.arc(sol.width/2, sol.height/2, sol.width/5, -80, 80, 1, {width: 10, color: "#000", linecap: "round"})
  #arcs.arc(sol.width/2, sol.height/2, sol.width/5, 0, 90, 1, {width: 5, color: "#000"})
  ###
  arcs = new Arcs()
  #arcs.broken_ring(sol.width/2,sol.height/2, sol.height/5, sol.width/50, 0)
  for i in [1..40]
    magic_multiplier = 80
    thickness = i * sol.height/(magic_multiplier*20)
    rad = i * sol.height/magic_multiplier
    arcs.split_ring(sol.width/2,sol.height/2, i * thickness*1.1, thickness, Math.random()*360, sol.randColor())
  
  
class window.Arcs
  #simpler method using a dashed stroke
  split_ring: (cx, cy, rad, thickness, rotation,color) ->
    circumference = 2 * Math.PI * rad
    gap_percent = 0.12
    sol.canvas.circle(rad*2).stroke({width: thickness, color: color, linecap: 'round', dasharray: "#{circumference * (0.5-gap_percent)},#{circumference * gap_percent}" }).fill('none').cx(cx).cy(cy).rotate(rotation)
  
  broken_ring: (cx, cy, rad, thickness, rotation) ->
    @arc(cx, cy, rad, 100, 260, 1, {width: thickness, color: "#000", linecap: "round"})
    @arc(cx, cy, rad, -80, 80, 1, {width: thickness, color: "#000", linecap: "round"})

  arc: (cx,cy,rad, start_degrees, end_degrees, clockwise_flag, stroke_params) ->
    #make our 0 degree mark start at the 12 o'clock position (subtract 90)
    start_degrees -= 90
    end_degrees -= 90
    
    start_x = cx + (rad * Math.cos(sol.degrees_to_radians(start_degrees)))
    start_y = cy + (rad * Math.sin(sol.degrees_to_radians(start_degrees)))
    
    finish_x = cx + (rad * Math.cos(sol.degrees_to_radians(end_degrees)))
    finish_y = cy + (rad * Math.sin(sol.degrees_to_radians(end_degrees)))
    
    #indicator dot
    #sol.canvas.circle(20).cx(start_x).cy(start_y).fill({color: "#f00"})
    
    sol.canvas.path("M#{start_x} #{start_y} A#{rad} #{rad} 0 0 #{clockwise_flag} #{finish_x} #{finish_y}").stroke(stroke_params).fill("none")
