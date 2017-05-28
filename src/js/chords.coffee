class window.Chords
  constructor: () ->
    sol.background("#fff")
    
    PHI = 1.61803399
    radius = sol.height*0.3
    #thickness = 0.5
    #thickness = 0.08
    thickness = sol.rando(0.05,0.3)
    #thickness = 0.3
    color = "#000"
    
    #thickness = 0.025
    
    hard_edge = Math.random() > 0.4
    
    cx = sol.width/2
    cy = sol.height/2
    
    count= sol.rando(30,15000)
    
    for i in [1..count]
      rad = radius * sol.rando(0.8,1.2)
      if(hard_edge)
        rad = radius
      else
        rad = radius * sol.rando(0.8,1.2)
        
      angle1 = Math.random()*2*Math.PI
      x1 = cx + (Math.cos(angle1) * rad)
      y1 = cy + (Math.sin(angle1) * rad)
        
      angle2 = Math.random()*2*Math.PI
      
      x2 = cx + (Math.cos(angle2) * rad)
      y2 = cy + (Math.sin(angle2) * rad)
      
      #make sure we're not going too close to the centre
      #angle between points must be > than Math.PI/2/PHI 
      #TODO: refactor and make this simpler/more readable
      while (Math.abs(Math.PI - Math.abs(angle2 - angle1))) < Math.PI/2/PHI
        angle2 = Math.random()*2*Math.PI
      
        x2 = cx + (Math.cos(angle2) * rad)
        y2 = cy + (Math.sin(angle2) * rad)
      
      #color = sol.randColor()
      sol.canvas.line(x1,y1,x2,y2).stroke({color: color; width: thickness; linecap: 'round'})
