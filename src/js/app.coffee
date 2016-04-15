
#nah, use native dimensions for my pretty landscape

width = window.innerWidth;
height = window.innerHeight;

#create the SVG object to draw in
d = SVG("svg").size(width,height)

#width = window.innerWidth
background_color = "#000"
foreground_color = "#ddd"
min_count = 3
max_count = 8
max_thickness = width/32

rando = (min,max) ->
  return Math.random() * (max - min) + min

save_svg = () ->
  #$.post('/save_svg',{data: $('#svg').html()})
  $.post('/save_svg',{data: $('#svg').html()}, () -> document.title = "Saved!")

vline = (x,w) ->
    d.rect(w,height).x(x).fill(foreground_color)

hline = (y,h) ->
    d.rect(width,h).y(y).fill(foreground_color)

#rand foreground?
rand_color = () ->
  #sometimes this gives invalid 5-char
  #colors which breaks everything :(
  #'#'+(Math.random()*0xFFFFFF<<0).toString(16)

  #instead, make a string with 6 chars 0..F
  ret = "#"
  for [1..6]
    ret += (Math.random()*0xF<<0).toString(16)
  #return it
  ret

#pass an approximate Y where you'd like the sun
sun = (y) ->
  #rad = rando(width/8,width/3)
  rad = rando(y/3,y*2) #make radius fit the distance from y to the top
  steps = rando(3,12)
  x = rando(rad+width/10,width-(rad+width/10))
  #y = height/2 + rando(-rad/2,rad/2)
  #y -= rad - rando(0,width/4)

  #keep it totally on the page
  y = rad + rando(0,y-rad)

  ###if(Math.random() > 0.5)
    #concentric rings
    while(rad > 1)
      #d.circle(rad).cx(x).cy(y).fill({opacity: 0}).stroke({color: "#f30", width: rad/80})
      d.circle(rad).cx(x).cy(y).fill({opacity: 0}).stroke({color: "#f30", width: height/120})
      rad *= 0.97
  else
    ###
    #opaque disks
  while(rad > 1)
    d.circle(rad).cx(x).cy(y).fill({opacity: 1/steps, color: "#f30"})
    rad *= 1-(1/steps)

background = () ->
  #clear the screen
  d.rect(width,height).fill(background_color)

#pretty mountains
vert_mountains = () ->
  x = 0
  y = height
  dy_crazy = rando(0.25,1) #bigger is crazier
  stroke_width = Math.floor(width/rando(50,500))
  if(stroke_width < 1)
    stroke_width = 1
  dx = stroke_width

  while y > height/4 && stroke_width > 0.005
    color = foreground_color
    while(x < width)
      y = y+rando(-width*dy_crazy/300,width*dy_crazy/300)

      #stay on canvas
      if (y > height)
        y = height
		  #if (y < 0) y = 0

      d.line(x,height,x,y).stroke({width: stroke_width, color: color, linecap: "round" })
      x += dx
    #reset x on the left side
    x = 0
    #move up...
    #y -= width/40+Math.random(width/30)
    y -= rando(height/20,height/5)

    #get skinnier
    stroke_width = stroke_width*0.85
  return(y)


#concentric circly cloud thing
cloud = (x,y,rad) ->
  stroke_width = height/400
  while(rad > 1)
    circle(x,y,rad,stroke_width)
    rad -= stroke_width * 4

mountain_scene = () ->
  background()
  #for i in [1..10]
  #  cloud(Math.random()*width,Math.random()*height,width/(3+(Math.random()*20)))
  sun(vert_mountains()) #mountains passes the last Y coord into the sun so we can keep it above them

circle = (x,y,rad,stroke_width) ->
  d.circle(rad).cx(x).cy(y).fill({opacity: .6, color: background_color}).stroke({color: foreground_color, width: stroke_width})
  #d.circle(rad).cx(x).cy(y).fill({opacity: 1, color: background_color}).stroke({color: foreground_color, width: stroke_width})

#number of circles
margin = height/10

circ_count = 3
size = height
stroke = size/12
show_color = true
background()

time = 200000
hold_time = time
circs = []

make =() ->
  for circ in [1..circ_count]
    circs[circ] = circle(width/2,height/2,size,stroke)

destroy = () ->
  for circ in circs
    circs[circ].remove()
    circs = []

migrate = (time = time) ->
  for circ in [1..circ_count]
    target_x = rando((margin),width-margin)
    target_y = rando((margin),height-margin)
    if(show_color)
      target_color = rand_color()
    else
      target_color = background_color
    circs[circ].animate(time).attr('cx',target_x).attr('cy',target_y).fill({opacity: .6, color: target_color})


make()
migrate(time)
#now do it every X seconds
int = setInterval migrate, hold_time, time

$('body').on "touchstart", (event) ->
  show_color = !show_color
  migrate(time*0.8)
  clearInterval(int)
  int = setInterval migrate, hold_time, time


#mountain_scene()
