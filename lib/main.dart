import 'package:flutter/material.dart';
import 'package:flutter_front/models/user.dart';
import 'package:flutter_front/services/routeServices.dart';
import 'package:flutter_front/services/userServices.dart';
import 'package:flutter_front/views/login.dart';
import 'package:flutter_front/views/register.dart';
import 'package:flutter_front/views/first_page.dart';
import 'package:flutter_front/views/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserServices()),
        ChangeNotifierProvider(create: (_) => RouteServices())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}
