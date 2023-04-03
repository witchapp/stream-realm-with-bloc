part of 'get_status_cubit.dart';

abstract class GetStatusState extends Equatable {
  const GetStatusState();

  @override
  List<Object> get props => [];
}

class StatusHasData extends GetStatusState {
  late List<CarStatusEntity?> carStatus;
  StatusHasData(this.carStatus);
  @override
  List<Object> get props => [carStatus];
}
class GetStatusInitial extends GetStatusState {}
