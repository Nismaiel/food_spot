part of 'geolocation_bloc.dart';

@immutable
abstract class GeolocationState extends Equatable {
  GeolocationState();
  @override
  List<Object?>get props=>[];
}

class GeolocationInitial extends GeolocationState {}
class GeoLocationLoading extends GeolocationState{}
class GeoLocationLoaded extends GeolocationState{
  final Position? position;
  GeoLocationLoaded({required this.position});

  @override
  List<Object?>get props=>[position];
}
class GeoLocationError extends GeolocationState{}