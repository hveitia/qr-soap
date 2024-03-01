
class AnalysisResult {
  final bool isMalicious;
  final bool isSuspicious;


  AnalysisResult({
    required this.isMalicious,
    required this.isSuspicious,
  });

  factory AnalysisResult.fromJson({required bool malicious, required bool suspicious}) => AnalysisResult(
    isMalicious: malicious,
    isSuspicious: suspicious,

  );


}