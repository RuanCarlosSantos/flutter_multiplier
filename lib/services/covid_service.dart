import 'package:flutter_multiplier/model/covid_case_model.dart';
import 'package:flutter_multiplier/model/covid_history_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidService {
  final String urlCase = 'https://covid-api.mmediagroup.fr/v1/cases';
  final String urlHistory =
      'https://covid-api.mmediagroup.fr/v1//history?status=deaths&country=';

  Future<List<CovidCase>> fetchCases() async {
    final http.Response response = await http.get(Uri.parse(urlCase));
    final countriesMap = json.decode(response.body);
    List<CovidCase> covidCaseList = [];
    countriesMap.forEach((key, value) {
      covidCaseList.add(CovidCase.fromJson(value['All'], key));
    });

    return covidCaseList;
  }

  Future<CovidHistoryModel> fetchHistory(String country) async {
    final http.Response response =
        await http.get(Uri.parse(urlHistory + country));
    final historyMap = json.decode(response.body);

    return CovidHistoryModel.fromJson(historyMap['All'], country);
  }
}
