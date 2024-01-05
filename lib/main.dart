import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/application/bloc/global_bloc.dart';
import 'package:flutter_bloc_state_management/application/constants/app_strings.dart';
import 'package:flutter_bloc_state_management/presentation/panel/panel_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GlobalBloc>(create: (_) => GlobalBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const PanelScreen(),
    );
  }
}
