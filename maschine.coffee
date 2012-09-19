class maschine
    objects = []
    name = ""
    #             |ID der Sektion im HTML-Code, in welcher der Canvas
    #             |platziert werden soll
    #             V
    constructor: (@sectionID, @dimX, @dimY) ->
        name = newID()
        sect = document.getElementById(@sectionID)
        sect.innerHTML="<canvas id="+@name+
                       " width="+@dimX+
                       " height="+@dimY
                       # " onclick='...'"

    registerNewObject: () ->

    removeObject: () ->

    updateObject: () ->

    userInput: () ->


newID = () ->
    Math.random() * 16
