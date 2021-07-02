import 'package:flutter/material.dart';
import 'package:flutter_multiplier/model/covid_case_model.dart';
import 'package:flutter_multiplier/utils/app_colors_utils.dart';
import 'package:flutter_multiplier/utils/app_text_style_utils.dart';
import 'package:intl/intl.dart';

class DateNowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String dateNowWidget = DateFormat('EEE, d MMM yy').format(now);

    return Text(
      dateNowWidget,
      style: AppTextStyleUtils.styleTextDateNow,
    );
  }
}

class FormatedLastUpdate extends StatelessWidget {
  final CovidCase covidCase;

  FormatedLastUpdate({this.covidCase}) : super();

  @override
  Widget build(BuildContext context) {
    DateTime formatedLastUpdate =
        covidCase.updated != null ? covidCase.updated : DateTime.now();
    String formatedLastUpdateString =
        DateFormat('yyyy/MM/dd HH:mm:ss EEE').format(formatedLastUpdate);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          formatedLastUpdateString,
          style: AppTextStyleUtils.styleTextLastUpdate,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .020,
            bottom: MediaQuery.of(context).size.height * .020,
          ),
          child: Icon(
            Icons.refresh_outlined,
            color: AppColorsUtils.colorRefreshIcon,
          ),
        ),
      ],
    );
  }
}
