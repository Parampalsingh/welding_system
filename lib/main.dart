import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welding_system/Providers/screenIndexProvider.dart';
import 'package:welding_system/Screen/login_page.dart';
import 'package:welding_system/Widgets/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => screenIndexProvider())
      ],
    );
  }
}

