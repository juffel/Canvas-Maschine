class gObject
    constructor: (@color, @posX, @posY) ->
    
    setPos: (posX, posY) ->
        @posX = posX
        @posY = posY

class rectangle extends gObject
    constructor: (color, @dimX, @dimY, posX, posY) ->
        super(color, posX, posY)
