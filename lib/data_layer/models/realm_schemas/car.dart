import 'package:realm/realm.dart';

part 'car.g.dart';

@RealmModel()
class _Car {
  late String make;
  late String model;
  int? kilometers = 500;
}