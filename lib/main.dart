import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/ecomerApp1/logic/theme_cubit.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/auth/splach_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubitt(),
      child: BlocBuilder<ThemeCubitt, ThemeData>(
        builder: (context, Theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Theme,
            home: SplachScreen(),
          );
        },
      ),
    );
  }
}
