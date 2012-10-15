getRandomColor = () ->
    letters = '0123456789ABDCEF'.split('')
    color = '#'
    for i in [0..5]
        color += letters[Math.round(Math.random() * 15)]
    color

window.getRandomColor = getRandomColor
