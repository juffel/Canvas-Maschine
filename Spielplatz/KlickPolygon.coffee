class KlickPolygon extends Maschine
    
    constructor: (secId) ->
        super(secId, window.innerWidth-20, window.innerHeight-20)
        @objects.push new Polygon("#000000", [new Point(100, 100)])

    ev_click: (event) =>
        @objects[0].points.push(new Point(event.clientX, event.clientY))

klick = new KlickPolygon("canvasArea")
