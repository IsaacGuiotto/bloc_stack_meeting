import 'package:bloc_stack_meeting/features/home/bloc/home_bloc.dart';
import 'package:bloc_stack_meeting/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/login/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, Widget Function(BuildContext)>{
        "/": (context) => LoginPage(),
        "/home": (context) => BlocProvider(
              create: (context) => HomeBloc(),
              child: HomePage(),
            ),
      },
    );
  }
}
