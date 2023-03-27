part of 'get_car_bloc.dart';

abstract class GetCarState extends Equatable {
  const GetCarState();
  
  @override
  List<Object> get props => [];
}

class GetCarDetailInitial extends GetCarState {}

class GetCarDetailLoading extends GetCarState {}

class GetCarDetailSuccess extends GetCarState {
  final List<CarEntity?> carList;

  const GetCarDetailSuccess({required this.carList});

  @override
  List<Object> get props => [carList];
}

class GetCarDetailNoData extends GetCarState {}
