class Path
    constructor: (@point) ->
    forward: (steps) ->
    backward: (steps) ->

class PCircle extends Path
    constructor: (center, @radius,  @movingPoint) ->
        super(center)
        @state = 0 # value in range [0..359]

    forward: (steps) ->
        @state += steps
        dings = radians(@state)
        @_circulate(dings)

    _circulate: (rad_value) ->
        mX = @point.getX() + @radius * (Math.cos(rad_value))
        mY = @point.getY() + @radius * (Math.sin(rad_value))
        @movingPoint.moveTo(mX, mY)

radians = (degrees) ->
    degrees * (Math.PI / 180)

window.Path = Path
window.PCircle = PCircle
