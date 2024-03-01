part of 'qr_scan_bloc.dart';

abstract class QrScanEvent extends Equatable {
  const QrScanEvent();
}

class InitialEvent extends QrScanEvent {
  @override
  List<Object> get props => [];
}

class OpenCameraEvent extends QrScanEvent {
  @override
  List<Object> get props => [];
}

class CloseCameraEvent extends QrScanEvent {
  @override
  List<Object> get props => [];
}

class CloseCameraAndGoHomeEvent extends QrScanEvent {
  @override
  List<Object> get props => [];
}

class CameraGetDataEvent extends QrScanEvent {
  final String data;

  const CameraGetDataEvent({required this.data});

  @override
  List<Object> get props => [data];
}