part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class CameraOpenedState extends HomeState {
  @override
  List<Object> get props => [];
}

class CameraClosedState extends HomeState {
  @override
  List<Object> get props => [];
}

class CameraGetDataState extends HomeState {
  final String data;

  const CameraGetDataState({required this.data});

  @override
  List<Object> get props => [data];
}