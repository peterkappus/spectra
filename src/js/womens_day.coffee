class window.WomensDay
  constructor: () ->
    sol.background("#f0a")
    #sol.canvas.circle(sol.rando(sol.width/20,sol.width*2/3)).cx(@x).cy(@y).stroke({width: @stroke_width, color: @color, dasharray: window.dash_array_string}).fill('none')
    fem_sym(sol.width/2,-sol.height/8,sol.height/2)
  
  fem_sym = (@cx,@cy,@rad) ->
    rad = @rad
    cx = @cx
    cy = @cy
    stroke_width = rad/10
    sol.canvas.circle(rad).cx(cx).cy(cy).stroke({width: stroke_width, color:'#000'}).fill('none')
    #s = {width: sol.width/50, color: '#000'}
    sol.canvas.line(cx,cy+rad/2,cx,cy+@rad+rad/2).stroke({width: stroke_width, color: '#000'})
    left_x = cx-rad/2
    left_y = cy+rad
    right_x = cx+rad/2
    right_y = cy+rad
    sol.canvas.line(left_x,left_y,right_x,right_y).stroke({width: stroke_width, color: '#000'})
    
    if(rad > 10)
      fem_sym(left_x,left_y,rad/2)
      fem_sym(right_x,right_y,rad/2)
      fem_sym(cx,cy+rad+rad/2,rad/2)
      