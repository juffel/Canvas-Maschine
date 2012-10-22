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



Alt:

Diese Maschine soll die Generierung von Bildern auf einem canvas-Objekt aus einer Menge von zeichenbaren Objekten umsetzen. Diese Objekte liegen z.B. in Form einer Liste vor. Die Maschine zeichnet (mit einer einstellbaren Framerate) diese Objekte auf den canvas.
Auch der UserInput wird über die Maschine an die Applikation weitergeleitet. Die Applikation kommuniziert also nur noch indirekt über die Maschine mit dem canvas. Die Maschine muss eine Möglichkeit haben um die Events an die Applikation weiterleiten zu können.

Der Maschine soll im Konstruktoraufruf die ID eines Abschnitts im HTML Code übergeben werden, in welchen sie dann selbst einen canvas einfügt und ggf. verändern kann.

Die Maschine soll in etwa folgendermaßen funktionieren: Durch Methodenaufrufe können im Objektarray der Maschine graphische Objekte erzeugt/modifiziert/gelöscht werden; der Canvas soll nur in bestimmten Abständen neu gezeichnet werden um Resourcen zu schonen. Da ich nicht weiß, wie/ob man Threads in JavaScript handlen kann greife ich auf eine unschönere Konstruktion zurück.
Bei jeder Modifikation wird geprüft, wie lange es her ist, dass der Canvas das letzte mal aktualisiert wurde, ein Zeitstempel wird geprüft. Am besten gibt man der zeichnenden Komponente mit entsprechenden Methoden die Möglichkeit offen mit oder ohne eine solche Überprüfung Objekte zu modifzieren.

Was unterwegs so rauspurzelt:
[Fadenkreuz](https://page.mi.fu-berlin.de/juliando/Maschine/Fadenkreuz/Fadenkreuz.htm)
