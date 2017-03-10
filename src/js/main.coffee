window.init = () ->
  #sol = window.sol
  #sol.background("#fff")
  
  #new Walker
  #new WomensDay
  new Squigs
  
  #clearTimeout(window.myTimeout)
  #window.myTimeout = setTimeout(init, 5000);
  
  #console.log sol.rando(sol.width, 900)
  #new GradientStudy()
  ###
    for i in [1..5]
      x = sol.rando(sol.width/4,sol.width*3/4)
      y = sol.rando(sol.height/4,sol.height*3/4)
      #use smaller dimension to keep it on screen
      max_rad = if(sol.height < sol.width) then sol.height/2 else sol.width/2
      new Lotus(x,y,max_rad*0.5)
  ### 
  
    #sol.canvas.circle(5).cx(x).cy(y).fill("#000")
  
  #new Lotus(10,50,50)
  
init()
