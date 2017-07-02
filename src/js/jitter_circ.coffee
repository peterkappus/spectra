class window.JitterCirc
  _vary_it: (value, amount) ->
    
  constructor: () ->
    i = Math.floor(Math.random() * sol.palettes.length)
    @foreground_color = sol.palettes[i].fore
    @background_color = sol.palettes[i].back
    
    rad = sol.height/4
    stroke_params = {width: 0.05, color: "#000", linecap: "round"}

    #sol.rando_within(start_x, 
    #rando_within: (current,min_amount,max_amount,lower_bound,upper_bound) ->
    variance = 0.01 

    start_x = sol.width/2
    start_y = sol.height*2/3
    control_1_x = start_x-(rad*2)
    control_1_y = start_y
    control_2_x = start_x-(rad*2)
    control_2_y = start_y-(rad*2)
    control_3_x = start_x+rad
    control_3_y = start_y 
    apex_x = start_x
    apex_y = start_y - (2*rad)
    
    for i in [1..sol.round_rando(20,2500)]
      
      start_x = sol.vary(start_x,variance)
      start_y = sol.vary(start_y,variance)
      control_1_x = sol.vary(control_1_x,variance)
      control_1_y = sol.vary(control_1_y,variance)
      control_2_x = sol.vary(control_2_x,variance)
      control_3_x = sol.vary(control_3_x,variance)
      control_3_y = sol.vary(control_3_y,variance)
      apex_x = sol.vary(apex_x,variance)
      apex_y = sol.vary(apex_y,variance)
      
      
      
      #sol.canvas.path("M10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80").fill("none").stroke(stroke_params)
      sol.canvas.path("M#{start_x} #{start_y} C #{control_1_x} #{control_1_y}, #{control_2_x} #{control_2_y}, #{apex_x} #{apex_y} S #{control_3_x} #{control_3_y}, #{start_x} #{start_y}").fill("none").stroke(stroke_params)
    