class window.Lotus
  constructor:() ->
    sol.background("#fff")

    angle = 0
    steps = sol.rando(4,50) #how many steps around the circle?
    revolutions = sol.rando(1,8) #how many times around the center? e.g. how many layers?

    angle_increment = Math.PI*2/steps
    new_angle = angle_increment * sol.rando(0.2,1.2)

    radius = sol.height/4
    cx = sol.width/2
    cy = sol.height/2

    #counter = 1

    for counter in [0..steps*revolutions]

      #radius = sol.rando(sol.height/12,sol.height/3)

      x1 = cx + (Math.sin(angle) * radius)
      y1 = cy + (Math.cos(angle) * radius)

      #rando radius within half the width or height
      radius = sol.height/2 * sol.rando(0.2,0.9*(1-(counter/(steps*revolutions))))

      # console.log(counter)
      x2 = cx + (Math.sin(new_angle) * radius)
      y2 = cy + (Math.cos(new_angle) * radius)

      sol.canvas.polygon("#{cx},#{cy} #{x1},#{y1} #{x2},#{y2}").fill(sol.randColor())

      angle = new_angle

      #randomise our angle a bit around our "angle_increment"
      new_angle += angle_increment * sol.rando(0.2,1.2)
