// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'apis_bloc.dart';

abstract class ApisState extends Equatable {
  const ApisState();

  @override
  List<Object> get props => [];
}

class ApisInitialState extends ApisState {
  @override
  List<Object> get props => [];
}

class ApisLoadingState extends ApisState {
  @override
  List<Object> get props => [];
}

class ApisLoadedState extends ApisState {
  User user;
  ApisLoadedState({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class ApisfailureState extends ApisState {
  String message;
  ApisfailureState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
