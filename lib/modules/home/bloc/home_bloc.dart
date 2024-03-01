import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rq_soap/configs/environment.dart';
import 'package:rq_soap/shared/configurations/ioc.dart';
import 'package:rq_soap/shared/contracts/storage.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState()) {
    on<InitialEvent>(_onInitialEvent);
    on<OpenCameraEvent>(_onOpenCameraEvent);
    on<CloseCameraEvent>(_onCloseCameraEvent);
    on<CameraGetDataEvent>(_onCameraGetDataEvent);
  }

  final IStorageService storage = Ioc.get<IStorageService>();

  Future<void> _onInitialEvent(InitialEvent event, Emitter<HomeState> emit) async {
    await storage.set(key: EnvironmentConstants.lastQRRead, value: '');
    emit(InitialState());
  }

  Future<void> _onOpenCameraEvent(OpenCameraEvent event, Emitter<HomeState> emit) async {
    emit(CameraOpenedState());
  }

  Future<void> _onCloseCameraEvent(CloseCameraEvent event, Emitter<HomeState> emit) async {
    emit(InitialState());
  }

  Future<void> _onCameraGetDataEvent(CameraGetDataEvent event, Emitter<HomeState> emit) async {

    if(event.data != ''){
      await storage.set(key: EnvironmentConstants.lastQRRead, value: event.data);
    }

    emit(CameraGetDataState(data: event.data));
  }

}
