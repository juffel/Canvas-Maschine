class GObject
    constructor: (@color, posX, posY) ->
        @pos = new Point(posX, posY)
    
    setPos: (posX, posY) =>
        @pos.x = posX
        @pos.y = posY

window.GObject = GObject

class Rectangle extends GObject
    constructor: (color, posX, posY, @dimX, @dimY) ->
        super(color, posX, posY)
    
    draw: (context) ->
        context.fillStyle = @color
        context.fillRect(@posX, @posY, @dimX, @dimY)

class Line extends GObject
    constructor: (color, x1, y1, @toX, @toY) ->
        super(color, x1, y1)

    draw: (context) ->
        context.beginPath()
        context.fillStyle = @color
        context.moveTo(@pos.x, @pos.y)
        context.lineTo(@toX, @toY)
        context.stroke()
        context.closePath()

class Point
    constructor: (@x, @y, @z = undefined) ->

class Polygon extends GObject
    constructor: (color, @points) ->
        super(color, @points[0].x, @points[0].y)

    draw: (context) ->
        context.beginPath()
        context.fillStyle = @color
        context.moveTo(@points[0].x, @points[0].y)
        for p in @points
            context.lineTo(p.x, p.y)

        context.lineTo(@points[0].x, @points[0].y)
        context.fill()
        context.closePath()

window.Rectangle = Rectangle
window.Point = Point
window.Line = Line
window.Polygon = Polygon

# class Circle extends GObject
#    constructor: (color, posX, posY, @radius) ->
#        super(color, posX, posY)
#
#class Vector extends GObject
#    constructor: (color, posX, posY, @dimX, @dimY) ->
#        super(color, posX, posY)
