import 'package:flutter/material.dart';
import 'package:youtube_play/screen/home_screen.dart';


void main() {
  runApp(
    HomeApp(),
  );
}

class HomeApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
