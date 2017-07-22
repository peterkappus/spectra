class window.Mandala
  constructor: () ->
    rad = sol.width/3

    origin_x = sol.width/2
    origin_y = sol.height/2

    sol.canvas.circle(rad).cx(origin_x).cy(origin_y).stroke({width: 0.1, color: "#000"}).fill('none')

    layers = 80
    rad = 0
    #several rings
    for j in [1..layers]
      rad += sol.width*(j*0.1)/layers
      angle = 0
      sides = 8
      how_many = 3
      thickness = 1

      #do a polygon
      for i in [1..how_many]
        angle += (Math.PI / how_many)
        sol.polygon(origin_x, origin_y, sides, rad,thickness, angle)

      #make some dots...
      a = 0
      while a < Math.PI*2
        a += Math.PI/32
        circ_x = origin_x + (Math.cos(a)*rad)
        circ_y = origin_y + (Math.sin(a)*rad)
        sol.canvas.circle(sol.width*(j*0.1)/200).cx(circ_x).cy(circ_y).stroke({color: "#000", width: sol.width*(j*0.1)/800}).fill('none')
          
    #for i in [0..20]
    #  x = origin_x +
