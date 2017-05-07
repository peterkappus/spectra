#$ ->
  #console.log("DOM is ready")
  #$('#vera').click -> 
    #console.log("Click!")
  #  new Vera

go_lotus = () ->
  for i in [1..sol.rando(1,5)]
    x = sol.rando(sol.width/4,sol.width*3/4)
    y = sol.rando(sol.height/4,sol.height*3/4)
    #use smaller dimension to keep it on screen
    max_rad = if(sol.height < sol.width) then sol.height/2 else sol.width/2
    new Lotus(x,y,max_rad*0.5)

splatter = () ->
  #white
  new Specks(sol.rando(0,sol.width),sol.rando(0,sol.height),"#fff")
  #black
  new Specks(sol.rando(0,sol.width),sol.rando(0,sol.height),"#000")
  
class Point
  constructor: (x,y) ->
    @x = x
    @y = y
    
line_segment = (x,y,angle,distance) ->
  x2 = x + (Math.cos(angle) * distance)
  y2 = y + (Math.sin(angle) * distance)
    
  sol.canvas.line(x,y,x2,y2).stroke({width: 3; color: "#000"})
  
  #return our end point so we can carry on drawing
  return new Point(x2,y2)


window.init = () ->
  #sol = window.sol
  #sol.background("#fff")
    
  #new ColorByNumber
  ###
  #starting point
  p = new Point(Math.random()*sol.width, Math.random() * sol.height)
  
  for i in [1..20]
    p = line_segment(p.x,p.y,Math.random()*2*Math.PI,sol.width/10)  
    console.log(p.x)
  ###
  
  #clearTimeout(window.myTimeout)
  #window.myTimeout = setTimeout(init, 5000);
  
  #new Islamic()
  
  #console.log sol.rando(sol.width, 900)
  #new GradientStudy()
  ###sol.background("#fff")
  for i in [1..sol.rando(1,5)]
    x = sol.rando(sol.width/4,sol.width*3/4)
    y = sol.rando(sol.height/4,sol.height*3/4)
    #use smaller dimension to keep it on screen
    max_rad = if(sol.height < sol.width) then sol.height/2 else sol.width/2
    new Lotus(x,y,max_rad*0.5)

    #sol.canvas.circle(5).cx(x).cy(y).fill("#000")
  ###
  
  #new Walker
  #new WomensDay
  #new Squigs
  #new Holi
  ###
  sol.background("#000")
  sol.canvas.rect(sol.width*3/5,sol.height*3/5).cx(sol.width/2).cy(sol.height/2).fill({color: "#fff"})
  new Specks(sol.width/2, sol.height/2,"#000")
    
  new Specks(sol.rando(0,sol.width),sol.rando(0,sol.height),"#fff")
  #new Specks(sol.rando(0,sol.width),sol.rando(0,sol.height),"#fff")
  ###
  
  #new Vera
  #new Lotus(10,50,50)
  
init()
