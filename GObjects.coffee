class GObject
    constructor: (@color, @posX, @posY) ->
    
    setPos: (posX, posY) ->
        @posX = posX
        @posY = posY

window.GObject = GObject

class Rectangle extends GObject
    constructor: (color, posX, posY, @dimX, @dimY) ->
        super(color, posX, posY)
    
    draw: (context) ->
        context.fillStyle = @color
        context.fillRect(@posX, @posY, @dimX, @dimY)

window.Rectangle = Rectangle

class Circle extends GObject
    constructor: (color, posX, posY, @radius) ->
        super(color, posX, posY)

class Vector extends GObject
    constructor: (color, posX, posY, @dimX, @dimY) ->
        super(color, posX, posY)
