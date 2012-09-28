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
        x1 = @posX
        x2 = @posX + rect.dimX
        y1 = @posY
        y2 = @posY + rect.dimY
        context.fill(x1, y1, x2, y2)

window.Rectangle = Rectangle

class Circle extends GObject
    constructor: (color, posX, posY, @radius) ->
        super(color, posX, posY)

class Vector extends GObject
    constructor: (color, posX, posY, @dimX, @dimY) ->
        super(color, posX, posY)
