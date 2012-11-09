class KlickPolygon extends Maschine
    
    constructor: (secId) ->
        super(secId, window.innerWidth-20, window.innerHeight-20)
        @objects.push new Polygon("#000000", [new Point(100, 100)])
        @counter = 1
        anleitung = new TextElement(0, window.innerHeight-20, "Mit Linksklick neue Punkte hinzufuegen, mit Mittlerer Maustaste neues Polygon beginnen")
        @addObject(anleitung)

    ev_click: (event) =>
        x = event.clientX
        y = event.clientY

        # bei einem Linksclick wird dem aktuellen Polygon ein Punkt hinzugefügt
        if event.button == 0
            @objects[@counter].points.push(new Point(x, y))
        # bei einem Mittelclick wird ein neues Polygon erstellt
        else if event.button == 1
            @counter += 1
            @objects.push new Polygon(getRandomColor(), [new Point(x, y)])

klick = new KlickPolygon("canvasArea")
