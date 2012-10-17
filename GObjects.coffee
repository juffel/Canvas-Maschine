class GObject
    constructor: (@color, @x, @y) ->
    
    getX: () =>
        @x
    getY: () =>
        @y
    setX: (x) =>
        @x = x
    setY: (y) =>
        @y = y
    getColor: () =>
        @color
    setColor: (color) =>
        @color = color
    
    move: (x, y) ->
        @x += x
        @y += y
    moveTo: (x, y) ->
        @x = x
        @y = y

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

    move: (x, y) ->
    moveTo: (x, y) ->

    draw: (context) ->
        context.beginPath()
        context.fillStyle = @color
        context.moveTo(@getX, @getY)
        context.lineTo(@toX, @toY)
        context.stroke()
        context.closePath()

class Point
    constructor: (@x, @y, @z = undefined) ->

class Polygon extends GObject
    constructor: (color, @points) ->
        super(color, @points[0].x, @points[0].y)

    move: (x, y) =>
        for p in @points
            p.x += x
            p.y += y
        @x = @getX()
        @y = @getY()

    moveTo: (x, y) =>
        moveX = x - @x
        moveY = y - @y
        @move(moveX, moveY)

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
