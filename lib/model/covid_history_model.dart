import 'dart:convert';

class CovidHistoryModel {
  String country;
  int confirmed;
  int recovered;
  int deaths;
  Map<String, dynamic> dates;

  CovidHistoryModel({
    this.country,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.dates,
  });

  CovidHistoryModel.fromJson(Map<String, dynamic> allJson, String key) {
    country = key;
    confirmed = allJson['confirmed'];
    recovered = allJson['recovered'];
    deaths = allJson['deaths'];
    dates = allJson['dates'];
  }
}
