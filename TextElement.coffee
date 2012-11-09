class TextElement extends GObject
    
    constructor: (x, y, @text) ->
        super(x, y)
        # defaults
        @color = "#000000"
        @font = "italic bold 30px sans-serif"
        @baseline = "bottom"
        @fill = true

    draw: (context) ->
        context.fillStyle = @color
        context.font = @font
        context.textBaseline = @baseline
        if(@fill)
            context.fillText(@text, @x, @y)
        else
            context.strokeText(@text, @x, @y)

window.TextElement = TextElement
