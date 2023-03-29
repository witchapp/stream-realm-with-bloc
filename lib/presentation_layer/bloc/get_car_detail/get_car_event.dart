part of 'get_car_bloc.dart';

abstract class GetCarEvent extends Equatable {
  const GetCarEvent();

  @override
  List<Object> get props => [];
}

class OnGetCarDetailEvent extends GetCarEvent {
  const OnGetCarDetailEvent();

  @override
  List<Object> get props => [];
}
