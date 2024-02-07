import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logincubit/cubit/validlogin_cubit.dart';
import 'package:logincubit/ui/Home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidloginCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: LoginPage(),
      ),
    );
  }
}
