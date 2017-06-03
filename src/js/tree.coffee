class window.Tree  
  constructor: () ->
    max_depth = 10
    
    t = new Trunk
    #console.log(this.max_depth)
    sol.background(t.background_color)
    #eea
    #console.log(t.amount)
    x = sol.rando(t.margin, sol.width - t.margin)
    #console.log(x)
    #console.log(t.length)
    new Branch(x, sol.height, 0, t, t)

class window.Trunk
  constructor: () ->
    @x = sol.width/2
    @y = sol.height
    @branches =  Math.random() > 0.3
    @max_thickness = 5
    @min_thickness = 0.01
    @max_depth = sol.rando(6,14) #recursion
    @angle = -Math.PI/2
    @min_length = sol.height/15
    @length = sol.rando(sol.height/5, sol.height/2)
    
    
    @margin = @min_length

    palettes = [
      {fore: '#ffe', back: '#443'}, 
      {fore: '#eef', back: '#206ba8'}, 
      {fore: '#300', back: '#ffe'} ]
          
    i = Math.floor(Math.random() * palettes.length)
    @foreground_color = palettes[i].fore
    @background_color = palettes[i].back

    #@branches = false
    #@max_depth = 12
    #@joints = true
    if(@branches)
      @joints = Math.random() > 0.5
    else
      @joints = true
    
    @min_length = sol.height/20
    @min_joint_radius = sol.width/170
    @max_joint_radius = sol.width/40
    
    
class window.Branch    
  constructor: (start_x,start_y, depth, parent, trunk) ->
    #console.log("hello")
    #console.log(trunk.max_depth)# if parent != null
    
    if(depth >= trunk.max_depth)
      return
                
    max_depth = trunk.max_depth
    percentage = (max_depth - depth) / max_depth
    
    #branch can be no loner than parent
    margin = trunk.margin
    #amount = sol.rando(sol.height/10,sol.height/4)# * (start_y / sol.height)
    
    @length = trunk.min_length + (sol.rando((parent.length-trunk.min_length) * 0.2, parent.length-trunk.min_length) * percentage)
    
    max_angle = Math.PI/3
    @angle = parent.angle + sol.rando(-max_angle,max_angle)
    
    #first branch goes straight up...
    @angle = -Math.PI/2 if depth == 0
    
    new_x = start_x + (Math.cos(@angle) * @length)
    new_y = start_y + (Math.sin(@angle) * @length)
    
    @thickness = trunk.min_thickness + (percentage * (trunk.max_thickness - trunk.min_thickness))
    
    if(new_x > margin && new_x < sol.width - margin && new_y > margin && new_y < sol.height-margin)
    #if(is_inside_radius(new_x, new_y))
      if(trunk.branches)
        sol.canvas.line(start_x, start_y, new_x, new_y).stroke({color: trunk.foreground_color; width: @thickness; linecap: 'round'})
      
      if(trunk.joints)
        sol.canvas.circle(sol.scale(trunk.min_joint_radius, trunk.max_joint_radius, percentage)).cx(new_x).cy(new_y).stroke({color: trunk.foreground_color; width: @thickness}).fill({color: trunk.foreground_color})
      
      if(new_y > 0)
        new_depth = depth + 1
        for i in [1..sol.rando(1,4)]
          new Branch(new_x,new_y, new_depth, @, trunk)
  