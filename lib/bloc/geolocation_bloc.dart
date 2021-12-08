import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_spot/repositories/geolocation_repo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeoLocationRepo geoLocationRepo;
  StreamSubscription? geoLocationSub;
  GeolocationBloc({required this.geoLocationRepo}) : super(GeoLocationLoading()) ;

  @override
  Stream<GeolocationState>mapEventToState(GeolocationEvent event)async*{
    if(event is LoadGeoLocation){
      yield* _mapGeoLocationToState();
    }else if(event is UpdateGeoLocation){
      yield* _mapUpdateGeoLocationToState(event);
    }
  }
  Stream<GeolocationState>_mapGeoLocationToState()async*{
    geoLocationSub?.cancel();
    final Position? position=await geoLocationRepo.getCurrentLocation();
    add(UpdateGeoLocation(position: position));
  }
  Stream<GeolocationState>_mapUpdateGeoLocationToState(UpdateGeoLocation event)async*{
    yield GeoLocationLoaded(position: event.position);
  }

  @override
  Future<void>close(){
    geoLocationSub?.cancel();
    return super.close();
  }
  }

