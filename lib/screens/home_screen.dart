import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multiplier/model/covid_case_model.dart';
import 'package:flutter_multiplier/model/covid_history_model.dart';
import 'package:flutter_multiplier/services/covid_service.dart';
import 'package:flutter_multiplier/utils/app_colors_utils.dart';
import 'package:flutter_multiplier/utils/app_text_style_utils.dart';
import 'package:flutter_multiplier/utils/app_texts_utils.dart';
import 'package:flutter_multiplier/widget/active_cases_widget.dart';
import 'package:flutter_multiplier/widget/card_state_widget.dart';
import 'package:flutter_multiplier/widget/date_formatting_widget.dart';
import 'package:flutter_multiplier/widget/last_update_widget.dart';
import 'package:flutter_multiplier/widget/period_cases_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final pageViewController = PageController(); //Controle de paginas
  Map<String, dynamic> casesJson = {};
  List<CovidCase> _companies;
  CovidService service;
  List<DropdownMenuItem<CovidCase>> _dropdownMenuItems;
  CovidCase covidCase;
  CovidHistoryModel covidHistory;

  @override
  void initState() {
    service = CovidService();
    covidCase = CovidCase();
    initCasesAsync();

    super.initState();
  }

  void initCasesAsync() async {
    List<CovidCase> covidCases = await service.fetchCases();
    setState(() {
      _dropdownMenuItems = buildDropdownMenuItems(covidCases);
      covidCase = covidCases.first;
    });
  }

  List<DropdownMenuItem<CovidCase>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<CovidCase>> items = [];
    for (CovidCase covidCase in companies) {
      items.add(
        DropdownMenuItem(
          value: covidCase,
          child: Text(
            covidCase.country,
          ),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(CovidCase covidCase) async {
    CovidHistoryModel covidHistory =
        await service.fetchHistory(covidCase.country);

    setState(() {
      this.covidCase = covidCase;
      this.covidHistory = covidHistory;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightSizedBox = MediaQuery.of(context).size.height * .05;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          AppTextsUtils.titleAppBar,
          style: AppTextStyleUtils.appBarPrimaryText,
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.solidBell),
            color: AppColorsUtils.colorNotificationIcon,
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        //possibilita arrastar para trocar de pagina
        controller:
            pageViewController, //Controla as paginas (caso precise colocar paginação por bottomNavigation)
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColorsUtils.appColor,
            ),
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * .024,
                right: MediaQuery.of(context).size.height * .024,
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton(
                        underline: Container(),
                        value: covidCase,
                        items: _dropdownMenuItems,
                        onChanged: onChangeDropdownItem,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColorsUtils.mainColor,
                        ),
                        elevation: 2,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DateNowWidget(),
                      SizedBox(
                        height: heightSizedBox,
                      ),
                      Text(
                        AppTextsUtils.latestUpdateText,
                        style: AppTextStyleUtils.styleTextFixed,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height * .024),
                        child: LastUpdateWidget(covidCase: covidCase),
                      ),
                    ],
                  ),
                  CardStateWidget(covidCase: covidCase),
                  SizedBox(
                    height: heightSizedBox,
                  ),
                  ActiveCasesWidget(),
                  PeriodCasesWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
