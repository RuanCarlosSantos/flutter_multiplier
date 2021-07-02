import 'package:intl/intl.dart';

class CovidCase {
  int confirmed;
  int recovered;
  int deaths;
  String country;
  DateTime updated;

  CovidCase({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.country,
    this.updated,
  });

  CovidCase.fromJson(Map<String, dynamic> allJson, String key) {
    confirmed = allJson['confirmed'];
    recovered = allJson['recovered'];
    deaths = allJson['deaths'];
    country = key;

    if (allJson['updated'] != null)
      updated = DateFormat('yyyy/MM/dd HH:mm:ss').parse(allJson['updated']);
  }
}
