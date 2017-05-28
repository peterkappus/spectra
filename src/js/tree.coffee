class window.Tree
  constructor: () ->
    sol.background("#fff")
    x = sol.width/2
    y = sol.height*0.8
    @max_depth = 12
    
    @_branch(x,y,0,@)
  
  #is the point inside our target radius from the center of the canvas?
  is_inside_radius = (x,y) ->
    origin_x = sol.width/2
    origin_y = sol.height*2/3
    max_distance = sol.width/2
    #console.log("hi")
    #return Math.sqrt((x - origin_x)^2 + (y - origin_y)^2) < max_distance
        
  _branch: (start_x,start_y, depth, parent) ->
    if(depth >= @max_depth)
      return
    percentage = (@max_depth - depth) / @max_depth
    max_thickness = 2.5
    max_amount = sol.height/6
    margin = sol.width/20
    #amount = sol.rando(sol.height/10,sol.height/4)# * (start_y / sol.height)
    amount = sol.rando(max_amount * 0.3, max_amount) * percentage
    console.log(@max_depth)
    max_angle = Math.PI/2
    angle = -Math.PI/2 + sol.rando(-max_angle,max_angle)
    angle = -Math.PI/2 if depth == 0
    new_x = start_x + (Math.cos(angle) * amount)
    new_y = start_y + (Math.sin(angle) * amount)
    thickness = max_thickness * percentage
    if(new_x > margin && new_x < sol.width - margin && new_y > margin)
    #if(is_inside_radius(new_x, new_y))
      sol.canvas.line(start_x, start_y, new_x, new_y).stroke({color: "#000"; width: thickness; linecap: 'round'})
    
      if(new_y > 0)
        new_depth = depth + 1
        for i in [1..sol.rando(2,3)]
          @_branch(new_x,new_y, new_depth)
  