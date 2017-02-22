class window.Lotus
  constructor:() ->
    sol.background("#fff")

    angle = new_angle = 0
    steps = sol.rando(8,80) #how many steps around the circle?
    revolutions = sol.rando(2,10) #how many times around the center? e.g. how many layers?

    #default angle increment
    angle_increment = Math.PI*2/steps
    how_many = revolutions * steps

    #landscape or horizontal?
    # Use half the lesser of the two dimensions so it always fits on the screen
    max_radius = if(sol.height < sol.width) then sol.height/2 else sol.width/2

    #rando radius within half the width or height
    radius = max_radius * 0.1

    cx = sol.width/2
    cy = sol.height/2

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

      #draw our polygon
      sol.canvas.polygon("#{cx},#{cy} #{x1},#{y1} #{x2},#{y2}").fill(sol.randColor())

      #set the old "angle" to our "new_angle" so our next triangle lines up with this one
      angle = new_angle
