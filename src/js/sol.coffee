
class window.Sol
  constructor: ->
    @width = window.innerWidth
    @height = window.innerHeight
    #@canvas_id = canvas_id
    @canvas = SVG("svg").size(@width,@height)
    @foreground_color = "#000"
    @background_color = "#fff"

  rando: (min,max) ->
    return(Math.random() * (max - min) + min)

  rando_within: (current,min_amount,max_amount,lower_bound,upper_bound) ->
    #keep us in range...
    if(current + max_amount > upper_bound)
      max_amount = upper_bound - current
    if(current + min_amount < lower_bound)
      min_amount = -(current - lower_bound)
    #now do it
    #console.log("current" + current + " min: " + min_amount + " max: " + max_amount)
    return(current + rando(min_amount,max_amount))

  vline: (x,thickness) ->
      @canvas.rect(thickness,@height).x(x).fill(@foreground_color)

  hline: (y,thickness) ->
      @canvas.rect(@width,thickness).y(y).fill(@foreground_color)

  #rand foreground?
  randColor: ->
    '#'+(0xFFFFFF-Math.random()*0xFFFFFF).toString(16).substr(0, 6)

  background: (color=@background_color) ->
    #clear the screen
    @canvas.rect(@width,@height).fill(color)

window.save_svg = () ->
  console.log "Saving..."
  #$.post('/save_svg',{data: $('#svg').html()})
  $.post('/save_svg',{data: $('#svg').html()}, () -> document.title = "Saved!")

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
#$('body').mousedown (event) ->
#  window.save_svg()
