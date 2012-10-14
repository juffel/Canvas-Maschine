class TestMaschine extends Maschine
    constructor: (canvasName, width, height) ->
        super(canvasName, width, height)
        centerX = Math.floor(@dimX/2)
        centerY = Math.floor(@dimY/2)
        @l1 = new Line("#000000", 0, 0, centerX, centerY)
        @l2 = new Line("#000000", @dimX, 0, centerX, centerY)
        @l3 = new Line("#000000", @dimX, @dimY, centerX, centerY)
        @l4 = new Line("#000000", 0, @dimY, centerX, centerY)
        @l5 = new Line("#000000", 100, 100, centerX, centerY)
        @l6 = new Line("#000000", 300, 100, centerX, centerY)
        @l7 = new Line("#000000", 200, 200, centerX, centerY)
        @addObjectShyly(@l1)
        @addObjectShyly(@l2)
        @addObjectShyly(@l3)
        @addObjectShyly(@l4)
        @addObjectShyly(@l5)
        @addObjectShyly(@l6)
        @addObject(@l7)

        # add a polygon for testing
        p = []
        p[0] = new Point(100, 100)
        p[1] = new Point(300, 100)
        p[2] = new Point(200, 200)
        @poly = new Polygon("#000000", p)
        @polly = new Polygon("#00AA00", [ p[0], p[1], new Point(centerX, centerY) ] )
        @addObject(@poly)
        @addObject(@polly)

    ev_keydown: (event) =>
        oldX = @poly.points[0].x
        oldY = @poly.points[0].y
        speed = 4
        # links
        if(event.keyCode == 37)
            for p in @poly.points
                p.x -= speed
            @l5.pos.x -= speed
            @l6.pos.x -= speed
            @l7.pos.x -= speed
        # hoch
        else if(event.keyCode == 38)
            for p in @poly.points
                p.y -= speed
            @l5.pos.y -= speed
            @l6.pos.y -= speed
            @l7.pos.y -= speed
        # rechts
        else if(event.keyCode == 39)
            for p in @poly.points
                p.x += speed
            @l5.pos.x += speed
            @l6.pos.x += speed
            @l7.pos.x += speed
        # runter
        else if(event.keyCode == 40)
            for p in @poly.points
                p.y += speed
            @l5.pos.y += speed
            @l6.pos.y += speed
            @l7.pos.y += speed
  
        @_refresh()

    ev_mouse: (event) =>
        @l1.toX = event.clientX
        @l1.toY = event.clientY
        @l2.toX = event.clientX
        @l2.toY = event.clientY
        @l3.toX = event.clientX
        @l3.toY = event.clientY
        @l4.toX = event.clientX
        @l4.toY = event.clientY
        
        @l5.toX = event.clientX
        @l5.toY = event.clientY
        @l6.toX = event.clientX
        @l6.toY = event.clientY
        @l7.toX = event.clientX
        @l7.toY = event.clientY
        @polly.points[2].x = event.clientX
        @polly.points[2].y = event.clientY
        @_refresh()

testMaschine = new TestMaschine("canvasArea", window.innerWidth-20, window.innerHeight-20)
document.documentElement.style.overflow = 'hidden'
