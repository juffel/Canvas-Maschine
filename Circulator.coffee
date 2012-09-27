# Das Circulator-Objekt dient dazu eine Tätigkeit in gewissen Abständen
# wiederholt auszuführen. Konkret soll das Objekt das Refreshen eines
# HTML-Canvas übernehmen. Dazu muss es über Änderungen in Kenntnis gesetzt
# werden und Zugriff auf den Canvas haben.
# TODO Würde das gerne generisch formulieren, finde aber gerade keine Möglichkeit
# Methoden dynamisch zu erstellen, das Objekt macht daher nicht viel Sinn...
class Circulator

    constructor: (@Maschine) ->

    circulate: ->
        @Maschine.circulate()

window.Circulator = Circulator
