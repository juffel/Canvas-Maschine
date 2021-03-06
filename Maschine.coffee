class Maschine
    # TODO Ebenen einfuehren
    objects = []
    canvasName = ""
    frameRate = 25
    #             |ID der Sektion im HTML-Code, in welcher der Canvas
    #             |platziert werden soll
    #             V
    constructor: (@sectionID, @dimX, @dimY) ->
        @canvasName = newID()
        @objects = []
        sect = document.getElementById(@sectionID)
        sect.innerHTML="<canvas id="+@canvasName+
                       " width="+@dimX+
                       " height="+@dimY+
                       " style='border:1px solid #000000';>"+
                       "</canvas>"
        document.getElementById(@canvasName).addEventListener('mousemove', @ev_mouse, false)
        document.getElementById(@canvasName).addEventListener('click', @ev_click, false)
        document.addEventListener('keydown', @ev_keydown, false)
        document.addEventListener('keypress', @ev_keypress, false)
        document.addEventListener('keyup', @ev_keyup, false)
        
        setInterval ( => @_refresh() ), 100

    ev_mouse: (event) ->
    ev_click: (event) ->
    ev_keydown: (event) ->
    ev_keypress: (event) ->
    ev_keyup: (event) ->

    addObjectShyly: (gObj) ->
        @objects.splice(objects.length, 0, gObj)
    addObject: (gObj) ->
        @addObjectShyly(gObj)
        @_refresh()

    removeObjectShyly: (gObj) ->
        ind = objects.indexOf(gObj)
        @objects.splice(ind, 1)
    removeObject: (gObj) ->
        @removeObjectShyly(gObj)
        @_refresh()

    clear: () ->
        @objects = []
        @_refresh()

    updateObjectShyly: (gObj, new_gObj) ->
        ind = objects.indexOf(gObj)
        @objects[ind] = new_gObj
    updateObject: (gObj, new_gObj) ->
        @updateObjectShyly(gObj, new_gObj)
        @_refresh()

    # zeichnet den Canvas komplett neu
    _redrawCanvas: () ->
        context = @getContext()
        # clear
        context.clearRect(0,0, @dimX, @dimY)
        # redraw
        for o in @objects
            o.draw(context)
    
    _refresh: () ->
        @_redrawCanvas()

    getContext: () ->
        canvas = document.getElementById(@canvasName)
        return canvas.getContext("2d")


newID = () ->
    Math.floor(Math.random() * 10000)

# um die Klasse global sichtbar zu machen
window.Maschine = Maschine
