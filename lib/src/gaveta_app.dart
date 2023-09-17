import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route/app_pages.dart';

class GavetaApp extends StatelessWidget {
  const GavetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.green[300],
        primaryColor: Colors.green[900],
      ),
      title: 'Gaveta',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: PagesRoutes.splashRoute,
    );
  }
}
