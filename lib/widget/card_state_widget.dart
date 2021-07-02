import 'package:flutter/material.dart';
import 'package:flutter_multiplier/model/covid_case_model.dart';
import 'package:flutter_multiplier/utils/app_colors_utils.dart';
import 'package:flutter_multiplier/utils/app_size_utils.dart';
import 'package:flutter_multiplier/utils/app_text_style_utils.dart';
import 'package:flutter_multiplier/utils/app_texts_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardStateWidget extends StatefulWidget {
  final CovidCase covidCase;

  CardStateWidget({this.covidCase}) : super();

  @override
  State<CardStateWidget> createState() => _CardStateWidgetState();
}

class _CardStateWidgetState extends State<CardStateWidget> {
  String initialValue = "";
  String companyUuid = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * .22;
    var width = MediaQuery.of(context).size.width * .28;
    var sizeIcon = MediaQuery.of(context).size.width * .08;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: AppColorsUtils.colorCardBackground,
            child: Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: AppSizeUtils.paddingCardState,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorsUtils.colorCardCircleInfected,
                      ),
                      child: Padding(
                        padding: AppSizeUtils.paddingCardState,
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          size: sizeIcon,
                          color: AppColorsUtils.colorCardIconInfected,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.covidCase?.confirmed.toString(),
                      style: AppTextStyleUtils.styleTextResultCardStateInfected,
                    ),
                  ),
                  Container(
                    child: Text(
                      AppTextsUtils.appTextDescriptionCardInfected,
                      style: AppTextStyleUtils.styleTextCardDescription,
                    ),
                  ),
                ],
              ),
            ),
            elevation: 1.0,
          ),
          Card(
            color: AppColorsUtils.colorCardBackground,
            child: Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: AppSizeUtils.paddingCardState,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorsUtils.colorCardCircleRecovered,
                      ),
                      child: Padding(
                        padding: AppSizeUtils.paddingCardState,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: sizeIcon,
                          color: AppColorsUtils.colorCardIconRecovered,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.covidCase?.recovered.toString(),
                      style: AppTextStyleUtils.styleTextCardResultRecovered,
                    ),
                  ),
                  Container(
                    child: Text(
                      AppTextsUtils.appTextDescriptionCardRecovered,
                      style: AppTextStyleUtils.styleTextCardDescription,
                    ),
                  ),
                ],
              ),
            ),
            elevation: 1.0,
          ),
          Card(
            color: AppColorsUtils.colorCardBackground,
            child: Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .01),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorsUtils.colorCardCircleDeath,
                      ),
                      child: Padding(
                        padding: AppSizeUtils.paddingIconCardStateDeath,
                        child: FaIcon(
                          FontAwesomeIcons.times,
                          size: sizeIcon,
                          color: AppColorsUtils.colorCardIconDeath,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.covidCase.deaths.toString(),
                      style: AppTextStyleUtils.styleTextCardResultDeath,
                    ),
                  ),
                  Container(
                    child: Text(AppTextsUtils.appTextDescriptionCardDeath,
                        style: AppTextStyleUtils.styleTextCardDescription),
                  ),
                ],
              ),
            ),
            elevation: 1.0,
          ),
        ],
      ),
    );
  }
}
