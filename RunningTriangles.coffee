class TestMaschine extends Maschine
    pols = []
    constructor: (canvasName, width, height) ->
        super(canvasName, width, height)
        @pols = []

        points = []
        points[0] = new Point(0, 100)
        points[1] = new Point(200, 100)
        points[2] = new Point(100, 200)

        # die ganze Breite des Bildschirms mit Dreiecken füllen
        xValue = Math.floor(window.innerWidth/200)+1
        for i in [0..xValue]
            @pols[i] = new Polygon("#000000", points)
            points = (new Point(p.x + 200, p.y) for p in points)

        for pol in @pols
            @addObject(pol)

        setInterval ( => @shift() ), 100

    shift: () ->
        for pol in @pols # verschieben
            pol.move(5, 0)

        for i in [0..@pols.length-1] # prüfen, ob ein Dreieck rausgeschoben wurde
            if @pols[i].points[0].x > window.innerWidth
                thisPol = @pols[i]
                nextPol = @pols[(i+1)%@pols.length]
                thisPol.moveTo(nextPol.getX(), nextPol.getY()) # 200:width of triangle

    ev_keydown: (event) =>
        oldX = @poly.points[0].x
        oldY = @poly.points[0].y
        speed = 4
        # links
        if(event.keyCode == 37)
            for p in @poly.points
                p.x -= speed
        else if(event.keyCode == 38)
            for p in @poly.points
                p.y -= speed
        else if(event.keyCode == 39)
            for p in @poly.points
                p.x += speed
        else if(event.keyCode == 40)
            for p in @poly.points
                p.y += speed
        @_refresh()

    ev_mouse: (event) =>
        @_refresh()

testMaschine = new TestMaschine("canvasArea", window.innerWidth-20, window.innerHeight-20)
document.documentElement.style.overflow = 'hidden'
