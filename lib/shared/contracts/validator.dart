
import 'package:rq_soap/shared/domain/analysis_result.dart';

abstract class IValidatorService {
  Future<String> scanUrl({required String url,});
  Future<AnalysisResult> analyses({required String id,});
}