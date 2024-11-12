import 'package:cim/core/constants/app_colors.dart';
import 'package:cim/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer & Inventory Management App',
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: const HomePage(),
    );
  }
}
