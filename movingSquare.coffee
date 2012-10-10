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
        if(@charaMouse == undefined)
            @charaMouse = new Rectangle("#0B0B61", event.clientX, event.clientY, 40, 40)
            @addObject(@charaMouse)
            @_refresh()
        else
            @charaMouse.posX = event.clientX
            @charaMouse.posY = event.clientY
            @_refresh()

    ev_keydown: (event) =>
        #alert(event.keyCode)
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
        @_refresh()

inst = new twoWay()
