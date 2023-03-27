import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';

part 'get_car_event.dart';
part 'get_car_state.dart';

class GetCarBloc extends Bloc<GetCarEvent, GetCarState> {
  Stream<List<CarEntity?>>? _carListStream;
  CarRepository _carRepository;

  GetCarBloc(this._carRepository) : super(GetCarDetailInitial()) {
    on<OnGetCarDetailEvent>(
      (event, emit) async {
        emit(GetCarDetailLoading());
        _carListStream = GetCarDetailUseCase(_carRepository).execute();
        if (_carListStream != null) {
          _carListStream!.listen((event) {
            print('event => $event');
            emit(GetCarDetailSuccess(carList: event));
          });
        } else {
          emit(GetCarDetailNoData());
        }
      },
    );
  }

  _getCarList(GetCarEvent event, Emitter<GetCarState> emit) {
    emit(GetCarDetailLoading());
    _carListStream = GetCarDetailUseCase(_carRepository).execute();
    if (_carListStream != null) {
      _carListStream!.listen((event) {
        print('event => $event');
        emit(GetCarDetailSuccess(carList: event));
        emit.isDone;
      });
    } else {
      emit(GetCarDetailNoData());
    }
  }
}
