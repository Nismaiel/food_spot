import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_spot/bloc/geolocation_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LocationScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const LocationScreen({Key? key}) : super(key: key);

  Widget locationSearch() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.blueGrey[900],
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Enter the address',
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            contentPadding:
                EdgeInsets.only(right: 5, left: 5, bottom: 5, top: 8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (ctx, state) {
                  if (state is GeoLocationLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GeoLocationLoaded) {
                    return const GoogleMap(
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: true,
                      initialCameraPosition:
                          CameraPosition(target: LatLng(10, 10), zoom: 12),
                    );
                  }else {return const Text('Something went wrong!!',style: TextStyle(color: Colors.white),);}
                },
              ),
            ),
            Positioned(top: 0, left: 0, right: 0, child: locationSearch()),
            Positioned(
                bottom: 40,
                left: 20,
                right: 20,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 80, 80, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Go',
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.blueGrey[800]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
