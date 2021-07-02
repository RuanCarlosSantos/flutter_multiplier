import 'package:flutter/material.dart';
import 'package:flutter_multiplier/utils/app_colors_utils.dart';

class AppTextStyleUtils {
  static const appBarPrimaryText =
      TextStyle(fontSize: 17, color: AppColorsUtils.mainColor);
  static const styleTextDateNow = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColorsUtils.dateTextColor);
  static const styleTextLastUpdate = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColorsUtils.dateTextColor);
  static const styleTextFixed = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColorsUtils.latestUpdateTextColor);
  static const styleTextPeriod =
      TextStyle(fontSize: 18, color: AppColorsUtils.colorPeriodText);
  static const styleTextLastUpdatedDetails =
      TextStyle(color: AppColorsUtils.colorLastUpdatedDetails);
  static const styleTextDateRange =
      TextStyle(fontSize: 18, color: AppColorsUtils.colorRangeDate);
  static const styleTextResultCardStateInfected = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColorsUtils.colorTextResultCardInfected);
  static const styleTextCardDescription = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColorsUtils.colorCardDescription);
  static const styleTextCardResultRecovered = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColorsUtils.colorCardResultRecovered);
  static const styleTextCardResultDeath = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColorsUtils.colorCardResultDeath);
}
