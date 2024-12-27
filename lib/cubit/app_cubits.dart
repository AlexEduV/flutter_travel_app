import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubit_states.dart';
import 'package:flutter_travel_test/models/data_model.dart';
import 'package:flutter_travel_test/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {

  AppCubits({
    required this.data,
  }) : super(InitialState()) {

    emit(WelcomeState());
  }

  final DataServices data;

  List<DataModel>? places;

  void getData() async {

    try {

      if (places == null) {

        //update state
        emit(LoadingState());

        //load data here:
        places = await data.getInfo();
      }

      //update state
      emit(LoadedState(places!));
    }
    catch (e) {
      debugPrint(e.toString());
    }
  }

  void showDetails(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(places!));
  }

  void goToWelcomePage() {
   emit(WelcomeState());
  }

}