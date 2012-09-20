class Maschine
    # TODO Ebenen einfuehren
    # objects ist erstmal ein Array vom Typ rectangle
    objects = []
    canvasName = ""
    #             |ID der Sektion im HTML-Code, in welcher der Canvas
    #             |platziert werden soll
    #             V
    constructor: (@sectionID, @dimX, @dimY) ->
        @canvasName = newID()
        sect = document.getElementById(@sectionID)
        sect.innerHTML="<canvas id="+@canvasName+
                       " width="+@dimX+
                       " height="+@dimY+
                       " style='border:1px solid #000000';>"+
                       # " onclick='...'"
                       "</canvas>"


    registerNewObject: () ->


    removeObject: () ->


    updateObject: () ->


    userInput: () ->


    # zeichnet den Canvas komplett neu
    _redrawCanvas: () ->
        context = getContext()
        for o in objects
            _draw(o, context)
    
    # zeichnet ein einzelnes Objekt auf den Canvas
    _drawRectangle: (rect) ->
        context = getContext()
        _drawRectangle(rect, context)
    _drawRectangle: (rect, context) ->
        context.fillStyle = rect.color
        x1 = rect.posX
        x2 = rect.posX + rect.dimX
        y1 = rect.posY
        y2 = rect.posY + rect.dimY
        context.fillRect(x1, y1, x2, y2)
    
    getContext: () ->
        canvas = document.getElementById(@canvasName)
        return canvas.getContext("2d")

newID = () ->
    Math.random() * 16

# um die Klasse global sichtbar zu machen
window.Maschine = Maschine
