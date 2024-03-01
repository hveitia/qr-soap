part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitialEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class OpenCameraEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class CloseCameraEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class CameraGetDataEvent extends HomeEvent {
  final String data;

  const CameraGetDataEvent({required this.data});

  @override
  List<Object> get props => [data];
}