class window.Arcs
  
  #simpler method using a dashed stroke
  split_ring: (cx, cy, rad, thickness, rotation) ->
    circumference = 2 * Math.PI * rad
    gap_percent = 0.05
    sol.canvas.circle(rad*2).stroke({width: thickness, color: "#000", linecap: 'round', dasharray: "#{circumference * (0.5-gap_percent)},#{circumference * gap_percent}" }).fill('none').cx(cx).cy(cy).rotate(rotation)
  
  broken_ring: (cx, cy, rad, thickness, rotation) ->
    @arc(cx, cy, rad, 100, 260, 1, {width: thickness, color: "#000", linecap: "round"})
    @arc(cx, cy, rad, -80, 80, 1, {width: thickness, color: "#000", linecap: "round"})

  arc: (cx,cy,rad, start_degrees, end_degrees, clockwise_flag, stroke_params) ->
    start_degrees -= 90
    end_degrees -= 90
    
    start_x = cx + (rad * Math.cos(sol.degrees_to_radians(start_degrees)))
    start_y = cy + (rad * Math.sin(sol.degrees_to_radians(start_degrees)))
    
    finish_x = cx + (rad * Math.cos(sol.degrees_to_radians(end_degrees)))
    finish_y = cy + (rad * Math.sin(sol.degrees_to_radians(end_degrees)))
    
    #indicator dot
    #sol.canvas.circle(20).cx(start_x).cy(start_y).fill({color: "#f00"})
    
    sol.canvas.path("M#{start_x} #{start_y} A#{rad} #{rad} 0 0 #{clockwise_flag} #{finish_x} #{finish_y}").stroke(stroke_params).fill("none")
