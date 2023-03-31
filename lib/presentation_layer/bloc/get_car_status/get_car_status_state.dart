part of 'get_car_status_bloc.dart';

abstract class GetCarStatusState extends Equatable {
  final carStatus;
  const GetCarStatusState({this.carStatus});
  
  @override
  List<Object> get props => [];
}

class GetCarStatusInitial extends GetCarStatusState {}

class GetCarStatusSuccess extends GetCarStatusState {
  final List<CarStatusEntity?> carStatus;

  const GetCarStatusSuccess({required this.carStatus});

  @override
  List<Object> get props => [carStatus];
}

class GetCarStatusNoData extends GetCarStatusState {
  @override
  List<Object> get props => ['No Status Data'];
}
