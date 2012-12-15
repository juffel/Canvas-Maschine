Ein bisschen Doku
-----------------
Die Canvas-Maschine soll es erlauben einfache auf Vektorgrafiken basierende Spiele basteln zu können.
Bisher existiert die Möglichkeit Pfad-Objekte per Hand zu erstellen, diese auf den canvas zu klatschen und zur Laufzeit zu modifizieren; beispielsweise ist das Reagieren auf Ereignisse wie Tastatureingaben oder Mausklicks möglich, aber noch relativ umständlich handzuhaben.

###Usage
Um eine Maschine in eine Seite einzubinden, muss lediglich dem html-header die Maschine.js und GOBjects.js(Graphical Objects) hinzugefügt werden und im html-body eine Sektion mit der id "canvasArea" erzeugt werden. Um eine Maschine zu erzeugen bindet man ein weiteres Skript ein (hier init.js). In diesem wird die Maschine erweitert und erzeugt.

    <html>
    <head>
    <script src="Maschine.js"></script>
    <script src="GObjects.js"></script>
    </head>
    
    <body>
    <section id="canvasArea"> Hier soll mal der Canvas rein! </section>
    
    <script src="init.js"></script>

    </body>
    </html>

Die *init.js* Datei enthält dann alles Weitere.

###TODOs
- Möglichkeit schaffen um nicht für jedes neue Kleinprojekt (z.B. bestehend aus nur einem .coffee file) eine eigene .htm Datei anlegen zu müssen
- Kollisionsabfrage
- Unterstützung für .svg Dateien

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

Was unterwegs so rauspurzelt:
[Fadenkreuz](https://page.mi.fu-berlin.de/juliando/Maschine/Fadenkreuz/Fadenkreuz.htm)
