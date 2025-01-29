import 'package:flutter/material.dart';
import 'package:info_tech/provider/page_controller.dart';
import 'package:provider/provider.dart';
import 'my_app/my_app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => PageControllerProvider(),
        child: const MyApp(),
      ),
    ),
  );
}





