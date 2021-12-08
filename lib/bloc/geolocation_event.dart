part of 'geolocation_bloc.dart';

abstract class GeolocationEvent {
  const GeolocationEvent();
  @override
  List<Object?>get props=>[];
}
class LoadGeoLocation extends GeolocationEvent{}
class UpdateGeoLocation extends GeolocationEvent{
  final Position? position;
  UpdateGeoLocation({required this.position});
  @override
  List<Object?>get props=>[position];
}
