testMaschine = new Maschine("canvasArea", 400, 300)
for i in [0..4]
    color = "#000000"
    x1 = Math.floor(Math.random() * testMaschine.dimX)
    x2 = Math.floor((x1 + Math.random() * testMaschine.dimX) % testMaschine.dimX)
    y1 = Math.floor(Math.random() * testMaschine.dimY)
    y2 = Math.floor((y1 + Math.random() * testMaschine.dimY) % testMaschine.dimY)
    tmp = new Rectangle(color, x1, y1, x2, y2)
    testMaschine.addObject(tmp)

