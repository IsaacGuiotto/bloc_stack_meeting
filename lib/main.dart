import 'package:bloc_stack_meeting/features/home/bloc/home_bloc.dart';
import 'package:bloc_stack_meeting/features/home/view/home_page.dart';
import 'package:bloc_stack_meeting/features/login/bloc/login_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/login/view/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        "/": (context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginPage(),
            ),
        "/home": (context) => BlocProvider(
              create: (context) => HomeBloc(),
              child: HomePage(),
            ),
      },
    );
  }
}
