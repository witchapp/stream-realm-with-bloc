part of 'get_car_status_bloc.dart';

abstract class GetCarStatusState extends Equatable {
  final carStatus;
  const GetCarStatusState({this.carStatus});
  
  @override
  List<Object> get props => [];
}

class GetCarStatusInitial extends GetCarStatusState {}

class GetCarStatusSuccess extends GetCarStatusState {
  final List<CarStatusEntity?> carStatusList;

  const GetCarStatusSuccess({required this.carStatusList});

  @override
  List<Object> get props => [carStatusList];
}

class GetCarStatusNoData extends GetCarStatusState {
  @override
  List<Object> get props => ['No Status Data'];
}
