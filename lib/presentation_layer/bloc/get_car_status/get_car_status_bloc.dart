import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

part 'get_car_status_event.dart';
part 'get_car_status_state.dart';

class GetCarStatusBloc extends Bloc<GetCarStatusEvent, GetCarStatusState> {
  Stream<List<CarStatusEntity?>>? _carStatusStream;
  CarRepository _carRepository;
  GetCarStatusBloc(this._carRepository) : super(GetCarStatusInitial()) {
    on<OnGetCarStatusEvent>(_getCarStatusByModel);
  }

  _getCarStatusByModel(
      OnGetCarStatusEvent event, Emitter<GetCarStatusState> emit) async {
    _carStatusStream =
        GetCarStatusUseCase(_carRepository).execute(event.carModel);
    return emit.forEach(
      _carStatusStream!,
      onData: (data) => GetCarStatusSuccess(carStatusList: data),
      onError: (error, stackTrace) => GetCarStatusNoData(),
    );
  }
}
