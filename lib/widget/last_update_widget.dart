import 'package:flutter/material.dart';
import 'package:flutter_multiplier/model/covid_case_model.dart';
import 'package:flutter_multiplier/utils/app_text_style_utils.dart';
import 'package:flutter_multiplier/utils/app_texts_utils.dart';
import 'package:flutter_multiplier/widget/date_formatting_widget.dart';

class LastUpdateWidget extends StatefulWidget {
  final String date;
  final CovidCase covidCase;

  LastUpdateWidget({this.date, this.covidCase}) : super();
  @override
  _LastUpdateWidgetState createState() => _LastUpdateWidgetState();
}

class _LastUpdateWidgetState extends State<LastUpdateWidget> {
  String get formatedLastUpdateString => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          AppTextsUtils.lastUpdateText,
          style: AppTextStyleUtils.styleTextLastUpdate,
        ),
        FormatedLastUpdate(covidCase: widget.covidCase),
        Text(
          AppTextsUtils.detailsLastUpdateText,
          style: AppTextStyleUtils.styleTextLastUpdatedDetails,
        ),
      ],
    );
  }
}
