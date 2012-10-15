class TestMaschine extends Maschine
    pols: []
    constructor: (canvasName, width, height) ->
        super(canvasName, width, height)

        points = []
        points[0] = new Point(100, 100)
        points[1] = new Point(300, 100)
        points[2] = new Point(200, 200)

        for i in [0..8]
            @pols[i] = new Polygon("#000000", points)
            points = (new Point(p.x + 200, p.y) for p in points)

        for pol in @pols
            @addObject(pol)

        setInterval ( => @shift() ), 100

    shift: () ->
        for pol in @pols
            pol.color = getRandomColor()
            for p in pol.points
                p.x += 5
            if pol.points[0].x > @dimX
                for p in pol.points
                    p.x -= @dimX
        @_refresh()

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
