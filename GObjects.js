// Generated by CoffeeScript 1.3.3
(function() {
  var Circle, GObject, Rectangle, Vector,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  GObject = (function() {

    function GObject(color, posX, posY) {
      this.color = color;
      this.posX = posX;
      this.posY = posY;
    }

    GObject.prototype.setPos = function(posX, posY) {
      this.posX = posX;
      return this.posY = posY;
    };

    return GObject;

  })();

  window.GObject = GObject;

  Rectangle = (function(_super) {

    __extends(Rectangle, _super);

    function Rectangle(color, posX, posY, dimX, dimY) {
      this.dimX = dimX;
      this.dimY = dimY;
      Rectangle.__super__.constructor.call(this, color, posX, posY);
    }

    Rectangle.prototype.draw = function(context) {
      var x1, x2, y1, y2;
      context.fillStyle = this.color;
      x1 = this.posX;
      x2 = this.posX + this.dimX;
      y1 = this.posY;
      y2 = this.posY + this.dimY;
      return context.fillRect(x1, y1, x2, y2);
    };

    return Rectangle;

  })(GObject);

  window.Rectangle = Rectangle;

  Circle = (function(_super) {

    __extends(Circle, _super);

    function Circle(color, posX, posY, radius) {
      this.radius = radius;
      Circle.__super__.constructor.call(this, color, posX, posY);
    }

    return Circle;

  })(GObject);

  Vector = (function(_super) {

    __extends(Vector, _super);

    function Vector(color, posX, posY, dimX, dimY) {
      this.dimX = dimX;
      this.dimY = dimY;
      Vector.__super__.constructor.call(this, color, posX, posY);
    }

    return Vector;

  })(GObject);

}).call(this);
