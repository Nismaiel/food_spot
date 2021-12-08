import 'package:food_spot/repositories/base_geolocation_repo.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocationRepo extends BaseGeoLocationRepository{
  GeoLocationRepo();

  @override
  Future<Position?>getCurrentLocation()async{
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}