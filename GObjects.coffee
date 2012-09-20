class GObject
    constructor: (@color, @posX, @posY) ->
    
    setPos: (posX, posY) ->
        @posX = posX
        @posY = posY

window.GObject = GObject

class Rectangle extends GObject
    constructor: (color, @dimX, @dimY, posX, posY) ->
        super(color, posX, posY)

window.Rectangle = Rectangle
