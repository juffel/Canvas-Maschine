// Generated by CoffeeScript 1.3.3
(function() {
  var color, i, testMaschine, tmp, x1, x2, y1, y2, _i, _j;

  testMaschine = new Maschine("canvasArea", 400, 300);

  for (i = _i = 0; _i <= 4; i = ++_i) {
    color = "#000000";
    x1 = Math.floor(Math.random() * testMaschine.dimX);
    x2 = Math.floor((x1 + Math.random() * testMaschine.dimX) % testMaschine.dimX);
    y1 = Math.floor(Math.random() * testMaschine.dimY);
    y2 = Math.floor((y1 + Math.random() * testMaschine.dimY) % testMaschine.dimY);
    tmp = new Rectangle(color, x1, y1, x2, y2);
    testMaschine.addObject(tmp);
  }

  alert("blubb");

  for (i = _j = 0; _j <= 4; i = ++_j) {
    color = "#000000";
    x1 = Math.floor(Math.random() * testMaschine.dimX);
    x2 = Math.floor((x1 + Math.random() * testMaschine.dimX) % testMaschine.dimX);
    y1 = Math.floor(Math.random() * testMaschine.dimY);
    y2 = Math.floor((y1 + Math.random() * testMaschine.dimY) % testMaschine.dimY);
    tmp = new Rectangle(color, x1, y1, x2, y2);
    testMaschine.addObject(tmp);
  }

}).call(this);
