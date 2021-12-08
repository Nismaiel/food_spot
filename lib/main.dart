import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_spot/bloc/geolocation_bloc.dart';
import 'package:food_spot/config/app_router.dart';
import 'package:food_spot/repositories/geolocation_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeoLocationRepo>(create: (_) => GeoLocationRepo())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geoLocationRepo: context.read<GeoLocationRepo>())
                ..add(LoadGeoLocation()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          onGenerateRoute: AppRouter.OnGenerateRoute,
        ),
      ),
    );
  }
}
