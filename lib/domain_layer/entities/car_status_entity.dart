import 'package:equatable/equatable.dart';

class CarStatusEntity extends Equatable {
  final String status;
  final String carModel;

  const CarStatusEntity({
    required this.status,
    required this.carModel
  });

  @override
  List<Object?> get props => [status, carModel];
}
