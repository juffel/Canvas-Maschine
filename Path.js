// Generated by CoffeeScript 1.3.3
(function() {
  var PCircle, Path, radians,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Path = (function() {

    function Path(point) {
      this.point = point;
    }

    Path.prototype.forward = function(steps) {};

    Path.prototype.backward = function(steps) {};

    return Path;

  })();

  PCircle = (function(_super) {

    __extends(PCircle, _super);

    function PCircle(center, radius, movingPoint) {
      this.radius = radius;
      this.movingPoint = movingPoint;
      PCircle.__super__.constructor.call(this, center);
      this.state = 0;
    }

    PCircle.prototype.forward = function(steps) {
      var dings;
      this.state += steps;
      dings = radians(this.state);
      return this._circulate(dings);
    };

    PCircle.prototype._circulate = function(rad_value) {
      var mX, mY;
      mX = this.point.getX() + this.radius * (Math.cos(rad_value));
      mY = this.point.getY() + this.radius * (Math.sin(rad_value));
      return this.movingPoint.moveTo(mX, mY);
    };

    return PCircle;

  })(Path);

  radians = function(degrees) {
    return degrees * (Math.PI / 180);
  };

  window.Path = Path;

  window.PCircle = PCircle;

}).call(this);