class Maschine
    # TODO Ebenen einfuehren
    # objects ist erstmal ein Array vom Typ rectangle
    objects = []
    canvasName = ""
    timeStamp = 0
    frameRate = 25
    #             |ID der Sektion im HTML-Code, in welcher der Canvas
    #             |platziert werden soll
    #             V
    constructor: (@sectionID, @dimX, @dimY) ->
        @canvasName = newID()
        @timeStamp = Date::getTime()
        sect = document.getElementById(@sectionID)
        sect.innerHTML="<canvas id="+@canvasName+
                       " width="+@dimX+
                       " height="+@dimY+
                       " style='border:1px solid #000000';>"+
                       # " onclick='...'"
                       "</canvas>"


    registerNewObjectShyly: (gObj) ->
        objects.splice(objects.length, 0, gObj)
    registerNewObject: (gObj) ->
        @registerNewObjectShyly(gObj)
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

    userInput: () ->


    # zeichnet den Canvas komplett neu
    _redrawCanvas: () ->
        context = @getContext()
        # clear
        context.clearRect(0,0, @dimX, @dimY)
        # redraw
        for o in objects
            @_drawRectangle(o, context)
    
    _checkRefresh: () ->
        curTime = Date::getTime()
        if (curTime-timeStamp) > (1000/@frameRate)
            @_redrawCanvas()
            @timeStamp = curTime


    getContext: () ->
        canvas = document.getElementById(@canvasName)
        return canvas.getContext("2d")

newID = () ->
    Math.random() * 16

# um die Klasse global sichtbar zu machen
window.Maschine = Maschine
