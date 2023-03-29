import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

class GetCarDetailUseCase {
  final CarRepository _repository;

  GetCarDetailUseCase(this._repository);

  Stream<List<CarEntity?>>? execute() {
    return _repository.getAllCars();
  }
}
