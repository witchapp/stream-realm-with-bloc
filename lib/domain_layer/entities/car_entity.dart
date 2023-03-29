import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final String model;
  final int kilometers;
  final String? carStatus;

  const CarEntity({
    required this.model,
    required this.kilometers,
    this.carStatus
  });

  @override
  List<Object?> get props => [model, kilometers];
}
