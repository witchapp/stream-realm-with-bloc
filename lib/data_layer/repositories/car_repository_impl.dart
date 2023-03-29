import 'dart:async';

import 'package:realm/realm.dart';
import 'package:realm_with_clean_architech/data_layer/data_layer.dart';
import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

class CarRepositoryImpl implements CarRepository {
  final LocalDataSource localDataSource;

  CarRepositoryImpl({required this.localDataSource});

  @override
  Stream<List<CarEntity?>>? getAllCars() {
    RealmResults<Car?> cars = localDataSource.getAllCars();
    if (cars.isNotEmpty) {
      return cars.changes.asyncMap<List<CarEntity?>>((event) {
        List<CarEntity> carList = [];
        for (Car? car in event.results) {
          carList
              .add(CarEntity(model: car!.model, kilometers: car.kilometers!));
        }
        return carList;
      });
    }
    return null;
  }

  @override
  Stream<List<CarStatusEntity?>>? getCarStatusByModel(String carModel) {
    RealmResults<Status?> carStatusResult =
        localDataSource.getCarStatusByCarModel(carModel);

    if (carStatusResult.isNotEmpty) {
      return carStatusResult.changes.asyncMap<List<CarStatusEntity?>>((event) {
        List<CarStatusEntity> carStatusList = [];

        for (Status? queriedStatus in event.results) {
          carStatusList.add(CarStatusEntity(
              status: queriedStatus!.status, carModel: queriedStatus.carModel));
        }
        return carStatusList;
      });
    }
    return null;
  }
}
