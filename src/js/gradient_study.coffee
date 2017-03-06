class window.GradientStudy
  constructor:() ->
    #sol.background("#fff")

    #baseColor = sol.randColor()
    baseColor = new SVG.Color("#FF0000")
    
    #10% darker      
    darkerColor = baseColor.morph("#000").at(0.8)

    #how about a gradient? yeah!
    gradient = sol.canvas.gradient('linear', (stop) ->
      stop.at(0, baseColor)
      #stop.at(0.7, sol.randColor())      
      stop.at(1, darkerColor)).from(0,0).to(0,1) #oriented towards the tip
    
    color_string = "#F0D8A8,#3D1C00,#86B8B1,#F2D694,#FA2A00,#F0D8A8,#3D1C00,#86B8B1"
    color_string = "#00A0B0,#6A4A3C,#CC333F,#EB6841,#EDC951,#00A0B0,#6A4A3C,#CC333F"
    color_string = "#5E412F,#FCEBB6,#78C0A8,#F07818,#F0A830,#5E412F,#FCEBB6,#78C0A8"
    #color_string = "#A3A948,#EDB92E,#F85931,#CE1836,#009989,#A3A948,#EDB92E,#F85931"
    colors = color_string.split(",")

    #make a gradient based on an array of colors
    gradient = sol.canvas.gradient('linear', (stop) ->
      i = 0
      for color in colors
        stop.at(i / colors.length, color)
        i++
      ).from(0,0).to(0,1) #oriented towards the tip


    #random mega gradient...
    gradient = sol.canvas.gradient('linear', (stop) ->
      how_many = sol.rando(5,200)
      for i in [0..how_many]
        stop.at(i / how_many, sol.randColor())
        i++
      ).from(0,0).to(1,1) #oriented towards the tip

    
    sol.canvas.rect(sol.width,sol.height).fill(gradient)