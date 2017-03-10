class window.Squigs
  window.foreground_color = '#eef'
  
  constructor: () ->
    sol.background("#eee")
    bg_width = sol.rando(0.05,1)
    #for i in [1..sol.rando(10,200)]
      #solo_squig(bg_width,'#000')
    solo_squig(0.2,'#003')
      
    #for i in [1..sol.rando(1,20)]
    #  solo_squig(sol.rando(5,50), sol.randColor())
    
  solo_squig = (@stroke_width,@color) ->
    cx = sol.rando(0,sol.width)
    cy = sol.rando(0,sol.height)
    
    stroke_width = @stroke_width
    color = @color
    point_count = 800
    path_string = "M #{cx} #{cy} C " + get_rand_points(point_count).join(", ")
    
    path = sol.canvas.path(path_string).stroke({width: stroke_width; linecap: 'round'; color: color}).fill('none').animate(8000).plot("M #{cx} #{cy} C " + get_rand_points(point_count).join(", "))

    morph_timer = window.setInterval((->
      path.animate(8000).plot("M #{cx} #{cy} C " + get_rand_points(point_count).join(", "))),8000)
    
  get_rand_points = (@count) ->
    points = []
    for i in [1..@count]
      x = Math.random() * sol.width
      y = Math.random() * sol.height
      #sol.canvas.circle(2).cx(x).cy(y).stroke({width: 5, color: '#00f'})      
      points.push(" #{x} #{y}")
    return(points)
    