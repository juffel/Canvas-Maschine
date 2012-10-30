Ein bisschen Doku
-----------------
###Membervariablen
> objects
> In diesem Array sind die graphischen Objekte, welche auf den Canvas gezeichnet werden sollen gespeichert. Sie sind vom Typ GObject.
>
> canvasName
> Name des Canvas, so wie er im DOM identifiziert werden kann.
>
> sectionID
> Die sectionID wird beim Konstruktoraufruf einer Maschine übergeben und bezeichnet den Node im DOM, in welchen der Canvas eingefügt werden soll.
>
> dimX/dimY
> Relativ selbsterklärend, Ausmaße des Canvas.

###Konstruktor
TODO

###Benutzung
Um mit einer Maschine auf den Canvas zeichnen zu können müssen ihr nach ihrer Instanziierung graphische Objekte mithilfe der *addObject()*-Methoden übergeben werden.

Um der Maschine Leben einzuhauchen müssen ihre Event-Methoden überschrieben werden. Bisher werden bei der Erstellung des Objektes Handler für *mousemove*, *click*, *keydown*, *keypress* und *keyup* hinzugefügt. Die bei Empfang eines solchen Events aufgerufenen Methoden heißen *ev_<event>*, also z.B. *ev_click(eventObject)*.


Was unterwegs so rauspurzelt:

[Fadenkreuz](https://page.mi.fu-berlin.de/juliando/Maschine/Spielplatz/Fadenkreuz.htm)

[KlickPolygon](https://page.mi.fu-berlin.de/juliando/Maschine/Spielplatz/KlickPolygon.htm)