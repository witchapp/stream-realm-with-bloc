import 'package:realm/realm.dart';

part 'car_status.g.dart';

@RealmModel()
class _Status {
  @PrimaryKey()
  late String carModel;
  late String status;
}