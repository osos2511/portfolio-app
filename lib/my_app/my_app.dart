import 'package:flutter/material.dart';
import '../core/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}

