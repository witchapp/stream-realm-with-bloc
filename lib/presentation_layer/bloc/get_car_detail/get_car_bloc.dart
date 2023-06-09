import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

part 'get_car_event.dart';
part 'get_car_state.dart';

class GetCarBloc extends Bloc<GetCarEvent, GetCarState> {
  Stream<List<CarEntity?>>? _carListStream;
  CarRepository _carRepository;

  GetCarBloc(this._carRepository) : super(GetCarDetailInitial()) {
    on<OnGetCarDetailEvent>(_getCarList);
  }

  _getCarList(GetCarEvent event, Emitter<GetCarState> emit) async {
    emit(GetCarDetailLoading());
    _carListStream = GetCarDetailUseCase(_carRepository).execute();
    return emit.forEach(
      _carListStream!,
      onData: (data) {
        return GetCarDetailSuccess(carList: data);
      },
      onError: (error, stackTrace) {
        return GetCarDetailNoData();
      },
    );
  }
}
