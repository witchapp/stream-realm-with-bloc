import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final String model;
  final int kilometers;

  const CarEntity({
    required this.model,
    required this.kilometers,
  });

  @override
  List<Object?> get props => [
        model,
        kilometers,
      ];
}
