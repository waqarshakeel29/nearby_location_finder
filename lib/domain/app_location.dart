import 'package:equatable/equatable.dart';

class AppLocation extends Equatable {
  final double latitude;
  final double longitude;

  const AppLocation(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}
