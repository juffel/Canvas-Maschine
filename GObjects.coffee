class GObject
    constructor: (@x, @y) ->
    getX: () =>
        @x
    getY: () =>
        @y
    setX: (x) =>
        @x = x
    setY: (y) =>
        @y = y
    set: (x, y) =>
        @setX(x)
        @setY(y)
    move: (x, y) =>
        @x += x
        @y += y
    moveTo: (x, y) =>
        @x = x
        @y = y
    # TODO draw: () ->
    #   throw (new Error(...))

class Point extends GObject

class Shape extends GObject
    constructor: (@color, x, y) ->
        super(x, y)
    getColor: () =>
        @color
    setColor: (color) =>
        @color = color

class Polygon extends Shape
    constructor: (color, @points) ->
        super(color, @points[0].getX(), @points[0].getY())
        @fill = true
    
    getX: () =>
        @points[0].getX()
    getY: () =>
        @points[0].getY()
    setX: (x) =>
        @points[0].setX(x)
    setY: (y) =>
        @points[0].setY(y)
    fill: () =>
        @fill = true
    stroke: () =>
        @fill = false
        
    move: (x, y) =>
        for p in @points
            p.move(x, y)

    moveTo: (x, y) =>
        moveX = x - @getX()
        moveY = y - @getY()
        @move(moveX, moveY)

    getPoint: (ind) =>
        @points[ind]

    getPoints: () =>
        @points

    draw: (context) ->
        context.beginPath()
        context.fillStyle = @color
        context.moveTo(@getX(), @getY())
        for p in @points
            context.lineTo(p.getX(), p.getY())

        context.lineTo(@getX(), @getY())
        if(@fill)
            context.fill()
        else
            context.stroke()
        context.closePath()

class Rectangle extends Polygon
    constructor: (color, @point, @dimX, @dimY) ->
        super(color, [ @point,
                       new Point(@point.getX()+@dimX, @point.getY()),
                       new Point(@point.getX()+@dimX, @point.getY()+@dimY),
                       new Point(@point.getX(), @point.getY()+@dimY) ] )

class Line extends Polygon
    constructor: (color, p1, @p2) ->
        super(color, [ p1, @p2 ])
        @stroke()

    getToX: () =>
        @getPoint(1).getX()
    getToY: () =>
        @getPoint(1).getY()

    setTo: (toX, toY) =>
        @getPoint(1).setX(toX)
        @getPoint(1).setY(toY)

window.GObject = GObject
window.Point = Point
window.Polygon = Polygon
window.Rectangle = Rectangle
window.Line = Line

# class Circle extends GObject
#    constructor: (color, posX, posY, @radius) ->
#        super(color, posX, posY)
#
#class Vector extends GObject
#    constructor: (color, posX, posY, @dimX, @dimY) ->
#        super(color, posX, posY)
