tm = new Maschine("canvasArea", 400, 300)

objects = [ new Rectangle("#FF00FF", 20, 80, 30, 30),
            new Rectangle("#00FFFF", 40, 60, 30, 30),
            new Rectangle("#FF0000", 60, 40, 30, 30),
            new Rectangle("#0000FF", 80, 20, 30, 30) ]

for o in objects
    tm.registerNewObject(o)
    
tm._redrawCanvas()

newObj = objects[1]
newObj.color="0099EE"
newObj.posX=100
newObj.posY=50
tm.updateObject(objects[1], newObj)

tm._redrawCanvas()

tm.removeObject(newObj)

tm._redrawCanvas()
