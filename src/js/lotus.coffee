class window.Lotus
  constructor: (@cx, @cy,@max_rad) ->
    #sol.background("#fff")
    cx = @cx #sol.width/2
    cy = @cy #sol.height/2
    #console.log(@cx)

    angle = new_angle = 0
    steps = sol.rando(8,80) #how many steps around the circle?
    revolutions = sol.rando(2,10) #how many times around the center? e.g. how many layers?

    #default angle increment
    angle_increment = Math.PI*2/steps
    how_many = revolutions * steps
    #how_many = 5
    
    #landscape or horizontal?
    # Use half the lesser of the two dimensions so it always fits on the screen
    max_radius = @max_rad #if(sol.height < sol.width) then sol.height/2 else sol.width/2

    #rando radius within half the width or height
    radius = max_radius * 0.1

    #cx = sol.width/2
    #cy = sol.height/2

    palettes = ["#F0D8A8,#3D1C00,#86B8B1,#F2D694,#FA2A00,#F0D8A8,#3D1C00,#86B8B1", "#00A0B0,#6A4A3C,#CC333F,#EB6841,#EDC951,#00A0B0,#6A4A3C,#CC333F", "#5E412F,#FCEBB6,#78C0A8,#F07818,#F0A830,#5E412F,#FCEBB6,#78C0A8", "#A3A948,#EDB92E,#F85931,#CE1836,#009989,#A3A948,#EDB92E,#F85931"]

    palettes_string = palettes[Math.round(Math.random()*palettes.length)]
    colors = palettes_string.split(",")
          

    #do this a bunch of times... revolutions won't be exact because angles won't add up to 360 on each revolution (because of randomisation)
    for counter in [1..how_many]
      #first side of triangle
      x1 = cx + (Math.sin(angle) * radius)
      y1 = cy + (-Math.cos(angle) * radius)

      #now shorten the next side
      #randomise but get slightly shorter as we go round so we have longer "petals" in the back
      radius = max_radius * sol.rando(0.2,0.9*(1-(counter/how_many)))

      #calculate our next angle, randomise around our "angle increment"
      new_angle += angle_increment * sol.rando(0.2,1.2)

      #second side using the new angle
      x2 = cx + (Math.sin(new_angle) * radius)
      y2 = cy + (-Math.cos(new_angle) * radius)
      
          
      
      #baseColor = new SVG.Color({r: Math.round(sol.rando(100,220)), g: Math.round(sol.rando(5,150)), b: Math.round(sol.rando(18,25))})
      #otherColor = new SVG.Color({r: Math.round(sol.rando(100,220)), g: Math.round(sol.rando(5,150)), b: Math.round(sol.rando(18,25))})
      
      #console.log otherColor
      
      #baseColor = sol.randColor()
      
      baseColor = new SVG.Color(colors[colors.length * Math.random() | 0])
      #10% darker      
      #otherColor = baseColor.morph("#000").at(0.1)
      otherColor = new SVG.Color(colors[colors.length * Math.random() | 0])
      
      #totally random other color
      #otherColor = sol.randColor()
      
      
      #how about a gradient? yeah!
      gradient = sol.canvas.gradient('linear', (stop) ->
        stop.at(0, baseColor)
        stop.at(1, otherColor)).from(0.2,0.2).to(0.9,0.9) #diagonal from bottom left

      fill = gradient
      #fill = sol.randColor()
      
      #draw our polygon
      sol.canvas.polygon("#{cx},#{cy} #{x1},#{y1} #{x2},#{y2}").fill(fill)

      #set the old "angle" to our "new_angle" so our next triangle lines up with this one
      angle = new_angle
