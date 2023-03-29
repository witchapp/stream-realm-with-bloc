import 'package:realm/realm.dart';
import 'package:realm_with_clean_architech/data_layer/models/models.dart';

abstract class LocalDataSource {
  RealmResults<Car?> getAllCars();
  RealmResults<Status> getCarStatusByCarModel(String carModel);
}

class LocalDataSourceImpl implements LocalDataSource {
  final Realm _realm;
  LocalDataSourceImpl(this._realm);
  @override
  RealmResults<Car?> getAllCars() {
    return _realm.all<Car>();
  }
  
  @override
  RealmResults<Status> getCarStatusByCarModel(String carModel) {
    print('car model to query => $carModel');
    var result = _realm.query<Status>("carModel == '$carModel'");
    return result;
  }
}
