import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubit_states.dart';

class AppCubits extends Cubit {

  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }

}