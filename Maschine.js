// Generated by CoffeeScript 1.3.3
(function() {
  var Maschine, newID;

  Maschine = (function() {
    var canvasName, objects;

    objects = [];

    canvasName = "";

    function Maschine(sectionID, dimX, dimY) {
      var sect;
      this.sectionID = sectionID;
      this.dimX = dimX;
      this.dimY = dimY;
      this.canvasName = newID();
      sect = document.getElementById(this.sectionID);
      sect.innerHTML = "<canvas id=" + this.canvasName + " width=" + this.dimX + " height=" + this.dimY + " style='border:1px solid #000000';>" + "</canvas>";
    }

    Maschine.prototype.registerNewObject = function() {};

    Maschine.prototype.removeObject = function() {};

    Maschine.prototype.updateObject = function() {};

    Maschine.prototype.userInput = function() {};

    Maschine.prototype._redrawCanvas = function() {
      var o, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = objects.length; _i < _len; _i++) {
        o = objects[_i];
        _results.push(_draw(o));
      }
      return _results;
    };

    Maschine.prototype._drawRectangle = function(rect) {
      var canvas, context, x1, x2, y1, y2;
      canvas = document.getElementById(this.canvasName);
      context = canvas.getContext("2d");
      context.fillStyle = rect.color;
      x1 = rect.posX;
      x2 = rect.posX + rect.dimX;
      y1 = rect.posY;
      y2 = rect.posY + rect.dimY;
      return context.fillRect(x1, y1, x2, y2);
    };

    return Maschine;

  })();

  newID = function() {
    return Math.random() * 16;
  };

  window.Maschine = Maschine;

}).call(this);
