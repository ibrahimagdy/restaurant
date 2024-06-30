import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/core/services/provider.dart';
import 'package:restaurant/routes.dart';
import 'package:restaurant/view/splash_screen/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OrderModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: routes,
    );
  }
}