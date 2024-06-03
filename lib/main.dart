import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubit_logics.dart';
import 'package:flutter_travel_test/cubit/app_cubits.dart';
import 'package:flutter_travel_test/pages/detail_page.dart';
import 'package:flutter_travel_test/pages/main_page.dart';
import 'package:flutter_travel_test/pages/welcome_page.dart';
import 'package:flutter_travel_test/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: const AppCubitLogics(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
