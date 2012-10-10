class RandMaschine extends Maschine
    ev_mouse: (event) =>
        @clear()
        for i in [0..10]
            color = "#000000"
            x1 = Math.floor(Math.random() * testMaschine.dimX * 1.5) - testMaschine.dimX/4
            x2 = Math.ceil(Math.random() * testMaschine.dimX) + testMaschine.dimX/4
            y1 = Math.floor(Math.random() * testMaschine.dimY) - testMaschine.dimY/4
            y2 = Math.ceil(Math.random() * testMaschine.dimY) + testMaschine.dimY/4
            tmp = new Rectangle(color, x1, y1, x2, y2)
            @addObject(tmp)

    ev_keydown: (event) =>
        for o in @objects
            o.color = getRandomColor()
        @_refresh()

getRandomColor = () ->
    letters = '0123456789ABDCEF'.split('')
    color = '#'
    for i in [0..5]
        color += letters[Math.round(Math.random() * 15)]
    color

testMaschine = new RandMaschine("canvasArea", window.innerWidth-20, window.innerHeight-20)
document.documentElement.style.overflow = 'hidden'  # firefox, chrome
document.body.scroll = "no" # ie only
