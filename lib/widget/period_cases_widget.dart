import 'package:flutter/material.dart';
import 'package:flutter_multiplier/utils/app_size_utils.dart';
import 'package:flutter_multiplier/utils/app_text_style_utils.dart';
import 'package:flutter_multiplier/widget/line_chart_widget.dart';

class PeriodCasesWidget extends StatefulWidget {
  @override
  State<PeriodCasesWidget> createState() => _PeriodCasesState();
}

class _PeriodCasesState extends State<PeriodCasesWidget> {
  @override
  Widget build(BuildContext context) {
    var widthSizedBox = MediaQuery.of(context).size.width * .05;
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Text(
                'Daily',
                style: AppTextStyleUtils.styleTextPeriod,
              ),
              SizedBox(
                width: widthSizedBox,
              ),
              Text(
                'Weekly',
                style: AppTextStyleUtils.styleTextPeriod,
              ),
              SizedBox(
                width: widthSizedBox,
              ),
              Text(
                'Monthly',
                style: AppTextStyleUtils.styleTextPeriod,
              ),
            ],
          ),
        ),
        Padding(
          padding: AppSizeUtils.paddingPeriodCases,
          child: Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .9,
            child: LineChartWidget(),
          ),
        )
      ],
    );
  }
}
