class twoWay extends Maschine
    constructor: ->
        @speed = 10
        width = Math.floor(window.innerWidth-20)
        height = Math.floor(window.innerHeight-20)
        super("canvasArea", width, height)
        ch_x = Math.floor(@dimX/2)
        ch_y = Math.floor(@dimY/2)
        @charaKey = new Rectangle("#FF0040", ch_x-20, ch_y-20, 40, 40)
        @charaMouse
        @addObject(@charaKey)

    ev_mouse: (event) =>
        if(overlap(@charaKey, event.clientX, event.clientY))
            return

        if(@charaMouse == undefined)
            @charaMouse = new Rectangle("#0B0B61", event.clientX, event.clientY, 40, 40)
            @addObject(@charaMouse)
        else
            @charaMouse.posX = event.clientX
            @charaMouse.posY = event.clientY

        @_refresh()

    ev_keydown: (event) =>
        oldX = @charaKey.posX
        oldY = @charaKey.posY
        # links
        if(event.keyCode == 37)
            @charaKey.posX -= @speed
        # hoch
        else if(event.keyCode == 38)
            @charaKey.posY -= @speed
        # rechts
        else if(event.keyCode == 39)
            @charaKey.posX += @speed
        # runter
        else if(event.keyCode == 40)
            @charaKey.posY += @speed

        if(overlappy(@charaKey, @charaMouse))
            @charaKey.posX = oldX
            @charaKey.posY = oldY
        else
            @_refresh()

# only works for squares of the same size^^
overlappy = (sq1, sq2) ->
    left1 = sq1.posX
    left2 = sq2.posX
    right1 = sq1.posX + sq2.dimX
    right2 = sq2.posX + sq2.dimX
    top1 = sq1.posY
    top2 = sq2.posY
    bottom1 = sq1.posY + sq1.dimY
    bottom2 = sq2.posY + sq2.dimY
    #return overlap(sq1, sq2.posX, sq2.posY)
    return collide(left1, right1, top1, bottom1, left2, right2, top2, bottom2)

overlap = (sq1, x2, y2) ->
    return (x2 >= sq1.posX-sq1.dimX && x2 <= sq1.posX+sq1.dimX && y2 >= sq1.posY-sq1.dimY && y2 <= sq1.posY+sq1.dimY)

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
