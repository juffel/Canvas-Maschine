class twoWay extends Maschine
    constructor: ->
        @speed = 10
        width = Math.floor(window.innerWidth-20)
        height = Math.floor(window.innerHeight-20)
        super("canvasArea", width, height)
        mitte = new Point(Math.floor(@dimX/2), Math.floor(@dimY/2))

        @rectKey = new Rectangle("#FF0040", mitte, 40, 40)
        @rectMouse
        @addObject(@rectKey)
        recPoints = @rectKey.getPoints()
        a = new PCircle(recPoints[0], 10, mitte)
        setInterval ( => a.forward(5) ), 100
        b = new PCircle(recPoints[2], 30, mitte)
        setInterval ( => b.forward(5) ), 100

    ev_mouse: (event) =>
        if(overlap(@rectKey, event.clientX, event.clientY))
            return

        if(@rectMouse == undefined)
            @rectMouse = new Rectangle("#0B0B61", new Point(event.clientX, event.clientY), 40, 40)
            @addObject(@rectMouse)
        else
            @rectMouse.moveTo(event.clientX, event.clientY)

        @_refresh()

    ev_keydown: (event) =>
        oldX = @rectKey.getX()
        oldY = @rectKey.getY()
        # links
        if(event.keyCode == 37)
            @rectKey.move(-@speed, 0)
        # hoch
        else if(event.keyCode == 38)
            @rectKey.move(0, -@speed)
        # rechts
        else if(event.keyCode == 39)
            @rectKey.move(@speed, 0)
        # runter
        else if(event.keyCode == 40)
            @rectKey.move(0, @speed)

        if(overlappy(@rectKey, @rectMouse))
            @rectKey.set(oldX, oldY)
        else
            @_refresh()

# only works for squares of the same size^^
overlappy = (sq1, sq2) ->
    left1 = sq1.getX()
    left2 = sq2.getX()
    right1 = sq1.getX() + sq2.dimX
    right2 = sq2.getX() + sq2.dimX
    top1 = sq1.getY()
    top2 = sq2.getY()
    bottom1 = sq1.getY() + sq1.dimY
    bottom2 = sq2.getY() + sq2.dimY
    #return overlap(sq1, sq2.getX(), sq2.getY())
    return collide(left1, right1, top1, bottom1, left2, right2, top2, bottom2)

overlap = (sq1, x2, y2) ->
    return (x2 >= sq1.getX()-sq1.dimX && x2 <= sq1.getX()+sq1.dimX && y2 >= sq1.getY()-sq1.dimY && y2 <= sq1.getY()+sq1.dimY)

collide = (left1, right1, top1, bottom1, left2, right2, top2, bottom2) ->
    if left1 > right2
        return false
    else if right1 < left2
        return false
    else if top1 > bottom2
        return false
    else if bottom1 < top2
        return false
    else
        return true

inst = new twoWay()
