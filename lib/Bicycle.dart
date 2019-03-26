class Bicycle {

  Bicycle({this.cadence = 1, this.gear = 2});

  int cadence;

  int _speed = 0;
  int gear;

  int get speed => _speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => "Bicycle : ${speed}speed mph cadence=$cadence gear=$gear";
}

void main() {
  var bike1 = new Bicycle(cadence: 10);
  bike1.speedUp(10);
  var bike2 = new Bicycle(gear: 10);
  bike2.speedUp(20);

  print(bike1);
  print(bike2);
}