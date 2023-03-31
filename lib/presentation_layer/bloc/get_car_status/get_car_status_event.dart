part of 'get_car_status_bloc.dart';

abstract class GetCarStatusEvent extends Equatable {
  const GetCarStatusEvent();

  @override
  List<Object> get props => [];
}

class OnGetCarStatusEvent extends GetCarStatusEvent {
  final Set<String> carModel;
  const OnGetCarStatusEvent(this.carModel);

  @override
  List<Object> get props => [carModel];
}
