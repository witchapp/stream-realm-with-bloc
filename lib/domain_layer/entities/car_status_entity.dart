import 'package:equatable/equatable.dart';

class CarStatusEntity extends Equatable {
  final String status;

  const CarStatusEntity({
    required this.status
  });

  @override
  List<Object?> get props => [status];
}
