part of 'qr_scan_bloc.dart';

abstract class QrScanState extends Equatable {
  const QrScanState();
}

class InitialState extends QrScanState {
  @override
  List<Object> get props => [];
}

class ShowLoadingState extends QrScanState {
  @override
  List<Object> get props => [];
}

class HideLoadingState extends QrScanState {
  @override
  List<Object> get props => [];
}

class ErrorState extends QrScanState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class CameraOpenedState extends QrScanState {
  @override
  List<Object> get props => [];
}

class CameraClosedState extends QrScanState {
  @override
  List<Object> get props => [];
}

class CameraClosedAndGoHomeState extends QrScanState {
  @override
  List<Object> get props => [];
}

class CameraGetDataState extends QrScanState {
  final String data;
  final AnalysisResult analysisResult;

  const CameraGetDataState({required this.data, required this.analysisResult,});

  @override
  List<Object> get props => [data, analysisResult,];
}