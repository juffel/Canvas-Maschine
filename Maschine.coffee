class Maschine
    # TODO Ebenen einfuehren
    objects = []
    canvasName = ""
    timeMS = 0
    timeS = 0
    frameRate = 25
    #             |ID der Sektion im HTML-Code, in welcher der Canvas
    #             |platziert werden soll
    #             V
    constructor: (@sectionID, @dimX, @dimY) ->
        @canvasName = newID()
        @timeS = Date::getSeconds()
        @timeMS = Date::getMilliseconds()
        sect = document.getElementById(@sectionID)
        sect.innerHTML="<canvas id="+@canvasName+
                       " width="+@dimX+
                       " height="+@dimY+
                       " style='border:1px solid #000000';>"+
                       # " onclick='...'"
                       "</canvas>"

    addObjectShyly: (gObj) ->
        objects.splice(objects.length, 0, gObj)
    addObject: (gObj) ->
        @addObjectShyly(gObj)
        @_checkRefresh()

    removeObjectShyly: (gObj) ->
        ind = objects.indexOf(gObj)
        objects.splice(ind, 1)
    removeObject: (gObj) ->
        @removeObjectShyly(gObj)
        @_checkRefresh()

    updateObjectShyly: (gObj, new_gObj) ->
        ind = objects.indexOf(gObj)
        objects[ind] = new_gObj
    updateObject: (gObj, new_gObj) ->
        @updateObjectShyly(gObj, new_gObj)
        @_checkRefresh()

    # zeichnet den Canvas komplett neu
    _redrawCanvas: () ->
        context = @getContext()
        # clear
        context.clearRect(0,0, @dimX, @dimY)
        # redraw
        for o in objects
            o.draw(context)
    
    # hier wird geprüft, ob bereits genug Zeit vergangen ist, um den canvas
    # zu refreshen. Erst wird auf die Millisekunden geprüft, wenn das nicht
    # zu einem Refresh führt, dann werden noch die vergangenen Sekunden ge-
    # prüft.
    _checkRefresh: () ->
        curMS = Date::getMilliseconds()
        if (cur-@timeMS) > (1000/@frameRate)
            @_redrawCanvas()
            @timeMS = curMS
            @timeS = Date::getSeconds()
        else
            curS = Date::getSeconds()
            if (curS - @timeS) > 1
                @_redrawCanvas()
                @timeS = curS
                @timeMS = Date::getMilliseconds()

    getContext: () ->
        canvas = document.getElementById(@canvasName)
        return canvas.getContext("2d")


newID = () ->
    Math.random() * 16

# um die Klasse global sichtbar zu machen
window.Maschine = Maschine
