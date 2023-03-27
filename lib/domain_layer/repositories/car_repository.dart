import 'dart:async';

import 'package:realm/realm.dart';
import 'package:realm_with_clean_architech/data_layer/data_layer.dart';
import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

abstract class CarRepository {
  Stream<List<CarEntity?>>? getAllCars();
}