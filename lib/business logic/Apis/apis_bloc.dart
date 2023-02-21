// ignore_for_file: depend_on_referenced_packages

import 'package:api_work/data/models/user_model.dart';
import 'package:api_work/data/repo/user_reop.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apis_event.dart';
part 'apis_state.dart';

class ApisBloc extends Bloc<ApisEvent, ApisState> {
  final UserRepo repo;
  ApisBloc(UserRepo userRepo)
      : repo = userRepo,
        super(ApisInitialState()) {
    on<ApisEvent>((event, emit) async {
      if (event is AddApisEvent) {
        emit(ApisLoadingState());
        try {
          User? user = await repo.getUser();
          if (user == null) {
            emit(ApisfailureState(message: user.toString()));
          } else {
            emit(ApisLoadedState(user: user));
          }
        } catch (e) {
          emit(ApisfailureState(message: e.toString()));
        }
      }
    });
  }
}
