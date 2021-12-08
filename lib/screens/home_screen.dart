import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName='/';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>const HomeScreen(),settings:const RouteSettings(name: routeName));
  }
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text('Home'),
      ),
      body: ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, '/location');
      },child: Text('Location')),
    );
  }
}
