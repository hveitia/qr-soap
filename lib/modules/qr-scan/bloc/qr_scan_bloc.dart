
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rq_soap/configs/environment.dart';
import 'package:rq_soap/shared/configurations/ioc.dart';
import 'package:rq_soap/shared/contracts/storage.dart';
import 'package:rq_soap/shared/contracts/validator.dart';
import 'package:rq_soap/shared/domain/analysis_result.dart';

part 'qr_scan_event.dart';
part 'qr_scan_state.dart';

class QrScanBloc extends Bloc<QrScanEvent, QrScanState> {
  QrScanBloc() : super(InitialState()) {
    on<InitialEvent>(_onInitialEvent);
    on<OpenCameraEvent>(_onOpenCameraEvent);
    on<CloseCameraEvent>(_onCloseCameraEvent);
    on<CameraGetDataEvent>(_onCameraGetDataEvent);
    on<CloseCameraAndGoHomeEvent>(_onCloseCameraAndGoHomeEvent);
  }

  final IStorageService storage = Ioc.get<IStorageService>();
  final IValidatorService validatorService = Ioc.get<IValidatorService>();

  Future<void> _onInitialEvent(InitialEvent event, Emitter<QrScanState> emit) async {

    try {
      var qr = await storage.get(key: EnvironmentConstants.lastQRRead);

      if (qr == null || qr == '') {
        emit(CameraOpenedState());
      } else {
        emit(ShowLoadingState());

        var response = await validatorService.scanUrl(url: qr);

        var finalResult = await validatorService.analyses(id: response);

        emit(CameraGetDataState(data: qr, analysisResult: finalResult));
      }
    } catch (e) {
      emit(HideLoadingState());
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> _onOpenCameraEvent(OpenCameraEvent event, Emitter<QrScanState> emit) async {
    emit(CameraOpenedState());
  }

  Future<void> _onCloseCameraEvent(CloseCameraEvent event, Emitter<QrScanState> emit) async {
    emit(InitialState());
  }

  Future<void> _onCameraGetDataEvent(CameraGetDataEvent event, Emitter<QrScanState> emit) async {
    try {
      if (event.data != '') {
        emit(CameraClosedState());
        await storage.set(
            key: EnvironmentConstants.lastQRRead, value: event.data);

        var qr = event.data;

        emit(ShowLoadingState());

        var response = await validatorService.scanUrl(url: qr);

        var finalResult = await validatorService.analyses(id: response);

        emit(CameraGetDataState(data: qr, analysisResult: finalResult));
      } else {
        emit(CameraOpenedState());
      }
    } catch (e) {
      emit(HideLoadingState());
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> _onCloseCameraAndGoHomeEvent(CloseCameraAndGoHomeEvent event, Emitter<QrScanState> emit) async {
    emit(CameraClosedAndGoHomeState());
  }
}
