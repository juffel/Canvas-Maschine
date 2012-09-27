class Bla
    constructor: (@name) ->
    blubb: () ->
        alert @name

blubb = new Bla("hollereidullioe")
blubb.blubb()

Bla::blubb = () ->
    alert ("modified"+@name)

blubb.blubb()
