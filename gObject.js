// Generated by CoffeeScript 1.3.3
(function() {
  var GObject, Rectangle,
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

  Rectangle = (function(_super) {

    __extends(Rectangle, _super);

    function Rectangle(color, dimX, dimY, posX, posY) {
      this.dimX = dimX;
      this.dimY = dimY;
      Rectangle.__super__.constructor.call(this, color, posX, posY);
    }

    return Rectangle;

  })(GObject);

}).call(this);
