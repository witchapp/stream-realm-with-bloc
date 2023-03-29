import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

class GetCarStatusUseCase {
  final CarRepository _repository;

  GetCarStatusUseCase(this._repository);

  Stream<List<CarStatusEntity?>>? execute(String carModel) {
    return _repository.getCarStatusByModel(carModel);
  }
}
