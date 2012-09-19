Diese Maschine soll die Generierung von Bildern auf einem canvas-Objekt aus einer Menge von zeichenbaren Objekten umsetzen. Diese Objekte liegen z.B. in Form einer Liste vor. Die Maschine zeichnet (mit einer einstellbaren Framerate) diese Objekte auf den canvas.
Auch der UserInput wird über die Maschine an die Applikation weitergeleitet. Die Applikation kommuniziert also nur noch indirekt über die Maschine mit dem canvas. Die Maschine muss eine Möglichkeit haben um die Events an die Applikation weiterleiten zu können.


Zur Anwendungsseite hin sollen folgende Methoden enthalten sein:
- registerNewObject
- removeObject
- updateObject

Zur Canvasseite hin:
- userInput (um z.B. Mausklicks an die Applikation weiterleiten zu können)

Der Maschine soll im Konstruktoraufruf die ID eines Abschnitts im HTML Code übergeben werden, in welchen sie dann selbst einen canvas einfügt und ggf. verändern kann.
