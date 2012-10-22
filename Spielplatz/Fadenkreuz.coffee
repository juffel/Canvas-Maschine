class TestMaschine extends Maschine
    constructor: (canvasName, width, height) ->
        super(canvasName, width, height)

        centerX = Math.floor(@dimX/2)
        centerY = Math.floor(@dimY/2)
        @fadenkreuz = new Point(centerX, centerY)

        @l1 = new Line("#000000", new Point(0,0), @fadenkreuz)
        @l2 = new Line("#000000", new Point(@dimX, 0), @fadenkreuz)
        @l3 = new Line("#000000", new Point(@dimX, @dimY), @fadenkreuz)
        @l4 = new Line("#000000", new Point(0, @dimY), @fadenkreuz)

        @rec_l = new Point(100, 100)
        @rec_r = new Point(300, 100)
        @rec_u = new Point(200, 200)

        @l5 = new Line("#000000", @rec_l, @fadenkreuz)
        @l6 = new Line("#000000", @rec_r, @fadenkreuz)
        @l7 = new Line("#000000", @rec_u, @fadenkreuz)

        @poly = new Polygon("#000000", [ @rec_l, @rec_r, @rec_u ])
        @polly = new Polygon("#00AA00", [ @rec_l, @rec_r, @fadenkreuz ] )

        @addObjectShyly(@l1)
        @addObjectShyly(@l2)
        @addObjectShyly(@l3)
        @addObjectShyly(@l4)
        @addObjectShyly(@l5)
        @addObjectShyly(@l6)
        @addObjectShyly(@l7)
        @addObjectShyly(@poly)
        @addObject(@polly)

    ev_keydown: (event) =>
        speed = 4
        # links
        if(event.keyCode == 37)
            @poly.move(-speed, 0)
        # hoch
        else if(event.keyCode == 38)
            @poly.move(0, -speed)
        # rechts
        else if(event.keyCode == 39)
            @poly.move(speed, 0)
        # runter
        else if(event.keyCode == 40)
            @poly.move(0, speed)
  
        @_refresh()

    ev_click: (event) =>
        @poly.moveTo(event.clientX, event.clientY)

    ev_mouse: (event) =>
        @l1.setTo(event.clientX, event.clientY)
        @l2.setTo(event.clientX, event.clientY)
        @l3.setTo(event.clientX, event.clientY)
        @l4.setTo(event.clientX, event.clientY)
        @l5.setTo(event.clientX, event.clientY)
        @l6.setTo(event.clientX, event.clientY)
        @l7.setTo(event.clientX, event.clientY)
        
        @polly.getPoint(2).moveTo(event.clientX, event.clientY)
        @_refresh()

testMaschine = new TestMaschine("canvasArea", window.innerWidth-20, window.innerHeight-20)
document.documentElement.style.overflow = 'hidden'
