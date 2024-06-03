import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubit_states.dart';
import 'package:flutter_travel_test/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {

  AppCubits({
    required this.data,
  }) : super(InitialState()) {

    emit(WelcomeState());
  }

  final DataServices data;

  late final places;

  void getData() async {
    try {
      //update state
      emit(LoadingState());

      //load data here:
      places = await  data.getInfo();

      //update state
      emit(LoadedState(places));
    }
    catch (e) {
      debugPrint(e.toString());
    }
  }

}