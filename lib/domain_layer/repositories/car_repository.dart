import 'dart:async';

import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

abstract class CarRepository {
  Stream<List<CarEntity?>>? getAllCars();
  Stream<List<CarStatusEntity?>>? getCarStatusByModel(Set<String> carModel);
}