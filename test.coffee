class TestMaschine extends Maschine
    constructor: (canvasName, width, height) ->
        super(canvasName, width, height)
        centerX = Math.floor(@dimX/2)
        centerY = Math.floor(@dimY/2)
        @l1 = new Line("#000000", 0, 0, centerX, centerY)
        @l2 = new Line("#000000", @dimX, 0, centerX, centerY)
        @l3 = new Line("#000000", @dimX, @dimY, centerX, centerY)
        @l4 = new Line("#000000", 0, @dimY, centerX, centerY)
        @addObjectShyly(@l1)
        @addObjectShyly(@l2)
        @addObjectShyly(@l3)
        @addObject(@l4)

    ev_mouse: (event) =>
        @l1.toX = event.clientX
        @l1.toY = event.clientY
        @l2.toX = event.clientX
        @l2.toY = event.clientY
        @l3.toX = event.clientX
        @l3.toY = event.clientY
        @l4.toX = event.clientX
        @l4.toY = event.clientY
        @_refresh()

testMaschine = new TestMaschine("canvasArea", window.innerWidth-20, window.innerHeight-20)
