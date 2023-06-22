
import 'package:bloc/bloc.dart';
import 'package:eduon_app/data/model/eduon_model.dart';

import '../data/service/eduon_service.dart';

part 'home_cubit.dart';
abstract class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState(this.error);
}

class HomeCompleteState extends HomeState {
 List<Course> users; 
 HomeCompleteState(this.users);
}
