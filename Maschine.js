// Generated by CoffeeScript 1.3.3
(function() {
  var Maschine, newID;

  Maschine = (function() {
    var canvasName, frameRate, objects;

    objects = [];

    canvasName = "";

    frameRate = 25;

    function Maschine(sectionID, dimX, dimY) {
      var sect;
      this.sectionID = sectionID;
      this.dimX = dimX;
      this.dimY = dimY;
      this.canvasName = newID();
      this.date = new Date();
      this.timeS = this.date.getSeconds();
      this.timeMS = this.date.getMilliseconds();
      this.objects = [];
      sect = document.getElementById(this.sectionID);
      sect.innerHTML = "<canvas id=" + this.canvasName + " width=" + this.dimX + " height=" + this.dimY + " style='border:1px solid #000000';>" + "</canvas>";
      document.getElementById(this.canvasName).addEventListener('mousemove', this.ev_mouse, false);
      document.getElementById(this.canvasName).addEventListener('click', this.ev_mouse, false);
      document.addEventListener('keypress', this.ev_keydown, false);
    }

    Maschine.prototype.ev_mouse = function(event) {};

    Maschine.prototype.ev_click = function(event) {};

    Maschine.prototype.ev_keydown = function(event) {};

    Maschine.prototype.addObjectShyly = function(gObj) {
      return this.objects.splice(objects.length, 0, gObj);
    };

    Maschine.prototype.addObject = function(gObj) {
      this.addObjectShyly(gObj);
      return this._refresh();
    };

    Maschine.prototype.removeObjectShyly = function(gObj) {
      var ind;
      ind = objects.indexOf(gObj);
      return this.objects.splice(ind, 1);
    };

    Maschine.prototype.removeObject = function(gObj) {
      this.removeObjectShyly(gObj);
      return this._refresh();
    };

    Maschine.prototype.clear = function() {
      this.objects = [];
      return this._refresh();
    };

    Maschine.prototype.updateObjectShyly = function(gObj, new_gObj) {
      var ind;
      ind = objects.indexOf(gObj);
      return this.objects[ind] = new_gObj;
    };

    Maschine.prototype.updateObject = function(gObj, new_gObj) {
      this.updateObjectShyly(gObj, new_gObj);
      return this._refresh();
    };

    Maschine.prototype._redrawCanvas = function() {
      var context, o, _i, _len, _ref, _results;
      context = this.getContext();
      context.clearRect(0, 0, this.dimX, this.dimY);
      _ref = this.objects;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        o = _ref[_i];
        _results.push(o.draw(context));
      }
      return _results;
    };

    Maschine.prototype._checkRefresh = function() {
      var curMS, curS;
      this.date = new Date();
      curMS = this.date.getMilliseconds();
      curS = this.date.getSeconds();
      if ((curMS - this.timeMS) > (1000 / this.frameRate)) {
        this._redrawCanvas();
        this.timeMS = curMS;
        return this.timeS = curS;
      } else {
        curS = this.date.getSeconds();
        if ((curS - this.timeS) > 1) {
          this._redrawCanvas();
          this.timeMS = curMS;
          return this.timeS = curS;
        }
      }
    };

    Maschine.prototype._refresh = function() {
      return this._redrawCanvas();
    };

    Maschine.prototype.getContext = function() {
      var canvas;
      canvas = document.getElementById(this.canvasName);
      return canvas.getContext("2d");
    };

    return Maschine;

  })();

  newID = function() {
    return Math.floor(Math.random() * 10000);
  };

  window.Maschine = Maschine;

}).call(this);
