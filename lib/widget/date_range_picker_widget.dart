import 'package:flutter/material.dart';
import 'package:flutter_multiplier/utils/app_colors_utils.dart';
import 'package:flutter_multiplier/utils/app_text_style_utils.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatefulWidget {
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange dateRange;

  String getFrom() {
    if (dateRange == null) {
      return '00';
    } else {
      return DateFormat('d').format(dateRange.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return '00/00';
    } else {
      return DateFormat('d MMM').format(dateRange.end);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getFrom() + ' - ' + getUntil(),
                    style: AppTextStyleUtils.styleTextDateRange,
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: AppColorsUtils.colorRangeDateIcon,
                  ),
                ],
              ),
              onPressed: () => pickDateRange(context),
            ),
          ],
        ),
      );

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}
