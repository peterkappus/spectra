class window.Sol
  constructor: ->
    #Go square! Use the smaller of the two dimensions
    if(window.innerWidth < window.innerHeight)
      @width = @height = window.innerWidth * 0.95
    else
      @width = @height = window.innerHeight * 0.95
      
    #@width = window.innerWidth
    #@height = window.innerHeight
    #@canvas_id = canvas_id
    @canvas = SVG("svg")
    @set_size(@width,@height)
    
    @foreground_color = "#000"
    @background_color = "#fff"
    @palettes = [
      {fore: '#ffe', back: '#443'}, 
      {fore: '#eef', back: '#206ba8'}, 
      {fore: '#300', back: '#ffe'} ]
  
  set_size: (w,h) ->
    @canvas.size(@width,@height)

  line_segment: (x,y,angle,distance) ->
    x2 = x + (Math.cos(angle) * distance)
    y2 = y + (Math.sin(angle) * distance)
      
    sol.canvas.line(x,y,x2,y2).stroke({width: 3; color: "#000"})
    
  #untested...  
  sample: (array) ->
    return(array[Math.floor(Math.random()*array.length)])
    
  rando: (min,max) ->
    return(Math.random() * (max - min) + min)
  
  round_rando: (min,max) ->
    return Math.round(rando(min,max))
  
  vary: (value, amount) ->
    return sol.rando(value * (1-amount),value * (1+amount))
  
  rando_within: (current,min_amount,max_amount,lower_bound,upper_bound) ->
    #keep us in range...
    if(current + max_amount > upper_bound)
      max_amount = upper_bound - current
    if(current + min_amount < lower_bound)
      min_amount = -(current - lower_bound)
    #now do it
    #console.log("current" + current + " min: " + min_amount + " max: " + max_amount)
    return(current + rando(min_amount,max_amount))

  #simplified version of the above takes only 4 arguments
  rando_walk: (current, delta, lower_bound, upper_bound) ->
    return sol.rando_within(current, -delta, delta, lower_bound, upper_bound)
  
  degrees_to_radians: (degrees) ->
    return (degrees * 2 * Math.PI / 360)  

  vline: (x,thickness) ->
      @canvas.rect(thickness,@height).x(x).fill(@foreground_color)

  hline: (y,thickness) ->
      @canvas.rect(@width,thickness).y(y).fill(@foreground_color)

  polygon: (cx,cy,sides,rad, thickness, start_angle) ->
    angle = start_angle
    #alert('ok')
    while angle-start_angle < Math.PI * 2
      x = cx + (Math.sin(angle) * rad)
      y = cy + (Math.cos(angle) * rad)
      
      angle += (Math.PI * 2) / sides
      new_x = cx + (Math.sin(angle) * rad)
      new_y = cy + (Math.cos(angle) * rad)
      
      @canvas.line(x, y, new_x, new_y).stroke({color: sol.foreground_color; width: @thickness; linecap: 'round'})
      
  #rand foreground?
  randColor: ->
    new SVG.Color('#'+(0xFFFFFF-Math.random()*0xFFFFFF).toString(16).substr(0, 6))

  background: (color=@background_color) ->
    #clear the screen
    @canvas.rect(@width,@height).fill(color)
    
  scale: (min, max, percent) ->
    return (min + ((max-min) * percent))

window.background = () ->
  sol.background(sol.randColor())
  
window.save_svg = () ->
  console.log "Saving..."
  #$.post('/save_svg',{data: $('#svg').html()})
  #$.post('/save_svg',{data: $('#svg').html()}, () -> document.title = "Saved!")
  $.post('http://localhost:9393/save_svg',{data: $('#svg').html()}, () -> 
    document.title = "Saved!"
    console.log "Saved!")
#capture <ENTER> key presses
$('body').keypress (event) ->
  if(event.which == 13)
    window.save_svg()

#set these globally for our other scripts to use locally
window.sol = new Sol()
window.rando = sol.rando
window.randColor = sol.randColor
window.width = sol.width
window.height = sol.height
window.d = sol.canvas
window.foreground_color = sol.foreground_color


#save on click
$('#svg').mousedown (event) ->
  window.save_svg()
