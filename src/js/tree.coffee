class window.Tree  
  constructor: () ->
    max_depth = 10
    
    #console.log(this.max_depth)
    sol.background("#fff")
    t = new Trunk
    #console.log(t.amount)
    new Branch(sol.width/2, sol.height, 0, t, t)

class window.Trunk
  constructor: () ->
    @x = sol.width/2
    @y = sol.height
    @max_thickness = 5
    @min_thickness = 0.01
    @max_depth = 10
    @angle = -Math.PI/2
    @min_length = sol.height/10
    @joints = Math.random() > 0.6
    @length = sol.rando(sol.height/7, sol.height/4)
    
class window.Branch    
  constructor: (start_x,start_y, depth, parent, trunk) ->
    #console.log("hello")
    #console.log(trunk.max_depth)# if parent != null
    
    if(depth >= trunk.max_depth)
      return
                
    max_depth = trunk.max_depth
    percentage = (max_depth - depth) / max_depth
    
    #branch can be no loner than parent
    margin = sol.width/20
    #amount = sol.rando(sol.height/10,sol.height/4)# * (start_y / sol.height)
    
    @length = trunk.min_length + (sol.rando((parent.length-trunk.min_length) * 0.8, parent.length-trunk.min_length) * percentage)
    
    max_angle = Math.PI/3
    @angle = parent.angle + sol.rando(-max_angle,max_angle)
    
    #first branch goes straight up...
    @angle = -Math.PI/2 if depth == 0
    
    new_x = start_x + (Math.cos(@angle) * @length)
    new_y = start_y + (Math.sin(@angle) * @length)
    @thickness = trunk.min_thickness + (percentage * (trunk.max_thickness - trunk.min_thickness))
    
    if(new_x > margin && new_x < sol.width - margin && new_y > margin && new_y < sol.height-margin)
    #if(is_inside_radius(new_x, new_y))
      sol.canvas.line(start_x, start_y, new_x, new_y).stroke({color: "#000"; width: @thickness; linecap: 'round'})
      
      if(trunk.joints)
        sol.canvas.circle(@thickness*5).cx(start_x).cy(start_y).stroke({color: "#000"; width: @thickness})#.fill('none')
      
      if(new_y > 0)
        new_depth = depth + 1
        for i in [1..sol.rando(2,3)]
          new Branch(new_x,new_y, new_depth, @, trunk)
  