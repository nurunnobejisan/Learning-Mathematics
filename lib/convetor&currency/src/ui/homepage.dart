import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jisan/convetor&currency/src/blocs/homepage_bloc.dart';
import 'package:jisan/convetor&currency/src/utils/common_methods.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:jisan/convetor&currency/src/states/homepage_states.dart';
import 'package:jisan/convetor&currency/src/events/homepage_events.dart';
import 'package:jisan/convetor&currency/src/ui/previous_conversions.dart';
import 'package:jisan/convetor&currency/src/data/models/currency_model.dart';
import 'package:jisan/convetor&currency/src/data/models/previous_conversions_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var screenSize;
  double? exchangeValue;
  CurrencyModel? _sourceCurrency;
  CurrencyModel? _targetCurrency;
  bool isLoadingProgress = false;
  List<CurrencyModel>? listOfCurrency = [];
  static HomePageStates? initialState = LoadingState();
  final HomePageBloc? _homePageBloc = HomePageBloc(initialState!);
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homePageBloc!.add(GetAvailableCurrenciesEvent());
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
          child: BlocListener<HomePageBloc, HomePageStates>(
            bloc: _homePageBloc,
            listener: (context, state) {
              setState(() {
                if (state is LoadingState) {
                  isLoadingProgress = true;
                }
                if (state is GetAvailableCurrenciesSuccess) {
                  listOfCurrency = state.listOfCurrency;
                  isLoadingProgress = false;
                }
                if (state is GetExchangeRateSuccess) {
                  var response = json.decode(state.response!.body.toString());
                  exchangeValue = response['${_targetCurrency!.key}'];
                  isLoadingProgress = false;
                  PreviousConversionModel previousConversionModel =
                      PreviousConversionModel(
                          date: "${response['date']}",
                          sourceCurrency: _sourceCurrency,
                          targetCurrency: _targetCurrency,
                          sourceValue:
                              double.parse(_textEditingController.text),
                          targetValue: exchangeValue);
                  _homePageBloc!
                      .add(SaveConversionsEvent(previousConversionModel));
                }
                if (state is SaveConversionSuccess) {
                  isLoadingProgress = false;
                }
              });
            },
            child: buildScreen(),
          ),
          inAsyncCall: isLoadingProgress,
          progressIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget buildScreen() {
    return Container(
      margin: EdgeInsets.only(
          left: screenSize.width * 0.02,
          top: screenSize.height * 0.05,
          right: screenSize.width * 0.02,
          bottom: screenSize.height * 0.02),
      child: Column(
        children: [
          amountBox(),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          currencyDropDownButton("source"),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          currencyDropDownButton("Target"),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Container(
              margin: EdgeInsets.only(left: screenSize.width * 0.03),
              alignment: Alignment.centerLeft,
              child: Text(
                "Result",
                style: TextStyle(fontSize: screenSize.height * 0.018, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          resultText(),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: previousConversionButton(),
          ),
        ],
      ),
    );
  }

  //amount box
  Widget amountBox() {
    return SizedBox(
      height: screenSize.height * 0.07,
      width: screenSize.width,
      child: TextField(
        controller: _textEditingController,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: 'পরিমান',
          contentPadding: EdgeInsets.only(left: screenSize.width*0.06,right: screenSize.width*0.06,top: screenSize.height*0.02,bottom: screenSize.height*0.02),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  // button for getting previous conversion
  Widget previousConversionButton() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
        ),
        child: Text("পূর্ববর্তী রূপান্তরগুলি দেখুন",
            style: TextStyle(
                fontSize: screenSize.height * 0.017, color: Colors.black)),
        onPressed: () => {pageNavigate()});
  }

  // result
  Widget resultText() {
    return Container(
        margin: EdgeInsets.only(left: screenSize.width * 0.02),
        alignment: Alignment.centerLeft,
        child: exchangeValue == null
            ? Container()
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints:
                    BoxConstraints(maxWidth: screenSize.width * 0.4),
                    child: Text(
                      "${_textEditingController.text} ${_sourceCurrency!.value}",
                      style:
                          TextStyle(fontSize: screenSize.height * 0.015, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(width: screenSize.width*0.04,),
                  Text(
                    "=",
                    style:
                        TextStyle(fontSize: screenSize.height * 0.015, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(width: screenSize.width*0.04,),
                  Container(
                    constraints:
                    BoxConstraints(maxWidth: screenSize.width * 0.4),
                    child: Text(
                      "$exchangeValue ${_targetCurrency!.value}",
                      style:
                          TextStyle(fontSize: screenSize.height * 0.015, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ));
  }

  //Dropdown widget
  Widget currencyDropDownButton(String dropdownName) {
    return Container(
      height: screenSize.height * 0.07,
      width: screenSize.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: DropdownButton<CurrencyModel>(
        iconEnabledColor: Colors.transparent,
        underline: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        hint: dropdownName == "source"
            ? const Text("উৎস মুদ্রা")
            : const Text("লক্ষ্য মুদ্রা"),
        value: dropdownName == "source" ? _sourceCurrency : _targetCurrency,
        items: listOfCurrency!.map((CurrencyModel value) {
          return DropdownMenuItem<CurrencyModel>(
            value: value,
            child: Text(value.value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            if (dropdownName == "source") {
              _sourceCurrency = newValue;
            } else {
              if (_textEditingController.text.isEmpty) {
                showToast("অনুগ্রহ করে প্রথমে পরিমাণ টাইপ করুন");
              } else if (_sourceCurrency == null) {
                showToast("অনুগ্রহ করে প্রথমে উৎস মুদ্রা নির্বাচন করুন");
              } else {
                _targetCurrency = newValue;
                _homePageBloc!.add(GetExchangeRatesEvent(
                    _sourceCurrency!.key, _targetCurrency!.key));
              }
            }
          });
        },
      ),
    );
  }

  Future pageNavigate() async {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => PreviousConversions()),
    );
  }
}
