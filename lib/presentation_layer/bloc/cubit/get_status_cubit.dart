import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm_with_clean_architech/domain_layer/entities/car_status_entity.dart';

import '../../../domain_layer/repositories/car_repository.dart';
import '../../../domain_layer/usecases/get_car_status.usecase.dart';

part 'get_status_state.dart';

class GetStatusCubit extends Cubit<GetStatusState> {
Stream<List<CarStatusEntity?>>? _carStatusStream;
CarRepository _carRepository;

  GetStatusCubit(this._carRepository) : super(GetStatusInitial());

  getCarStatus(carModel){
     _carStatusStream = GetCarStatusUseCase(_carRepository).execute(carModel);
      if(_carStatusStream != null){
        return _carStatusStream!.listen((event) {
          emit(StatusHasData(event.toList() ));
        });
      }
  }

}
