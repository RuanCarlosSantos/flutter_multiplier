import 'package:flutter/material.dart';
import 'package:flutter_multiplier/utils/app_text_style_utils.dart';
import 'package:flutter_multiplier/utils/app_texts_utils.dart';
import 'package:flutter_multiplier/widget/date_range_picker_widget.dart';

class ActiveCasesWidget extends StatefulWidget {
  @override
  State<ActiveCasesWidget> createState() => _ActiveCasesWidgetState();
}

class _ActiveCasesWidgetState extends State<ActiveCasesWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppTextsUtils.activeCaseText,
          style: AppTextStyleUtils.styleTextFixed,
        ),
        DateRangePickerWidget(),
      ],
    );
  }
}
