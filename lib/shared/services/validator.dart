import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rq_soap/configs/configs.dart';
import 'package:rq_soap/configs/environment.dart';
import 'package:rq_soap/shared/configurations/ioc.dart';
import 'package:rq_soap/shared/contracts/validator.dart';
import 'package:rq_soap/shared/contracts/web_client.dart';
import 'package:rq_soap/shared/domain/analysis_result.dart';

class ValidatorService extends IValidatorService {

  final IWebClient _webClient;

  ValidatorService([
    IWebClient? webClient,
  ])
      : _webClient = webClient ?? Ioc.get<IWebClient>();

  @override
  Future<AnalysisResult> analyses({required String id}) async {
    try{
      var options = Options(
        headers: {
          'x-apikey': Config.virusTotalApiKey,
        },
      );
      var response = await _webClient.get('${EnvironmentConstants.API_URL}${EnvironmentConstants.analyses}/$id', options: options);

      if (response['data'] != null) {

        var malicious = response['data']['attributes']['stats']['malicious'];
        var suspicious = response['data']['attributes']['stats']['suspicious'];

        return AnalysisResult.fromJson(malicious: malicious != 0, suspicious: suspicious != 0);

      } else {
        return Future.error('Error');
      }

    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> scanUrl({required String url}) async {
    try {
      Map<String, String> headers = {
        "x-apikey": Config.virusTotalApiKey,
      };

      var postUri = Uri.parse(
          '${EnvironmentConstants.API_URL}${EnvironmentConstants.urls}');
      var request = http.MultipartRequest("POST", postUri);

      request.fields['url'] = url;
      request.headers.addAll(headers);

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        var result = json.decode(responseData.body);

        return result['data']['id'];
      } else {
        return Future.error('Error');
      }
    } catch (e) {
      rethrow;
    }
  }
}