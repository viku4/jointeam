import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:jointeam/logis/constant/widgets.dart';
import 'package:jointeam/logis/views/homeScreen.dart';
import 'package:jointeam/logis/constant/appColors.dart';
import 'package:jointeam/languages/app_localizations.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _phonController = TextEditingController();
  // String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  DateTime selectedDate = DateTime.now();
  int selectedYear = DateTime.now().year;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale("en"),
      context: context,
      // initialDate: DateTime(selectedYear - 18, 12),
      firstDate: DateTime(selectedYear - 100, 1),
      lastDate: DateTime(selectedYear - 18, 12, 31),
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          _controller.text = DateFormat("dd-MM-yyyy").format(picked);
          _controllerAge.text = ((DateTime.now().year - picked.year) == 0)
              ? "1 Year"
              : ((DateTime.now().year - picked.year) == 1)
                  ? "${DateTime.now().year - picked.year} Year"
                  : "${DateTime.now().year - picked.year} Years";
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((onValue) {
      _phonController.text = "+91 9065546703";
    });
  }

  bool _isLoading = false;

  String? selectGender;
  @override
  Widget build(BuildContext context) {
    List gender = [
      {
        "name": AppLocalizations.of(context)?.translate('male') ?? "",
        "image": "assets/gender/man.png",
      },
      {
        "name": AppLocalizations.of(context)?.translate('female') ?? "",
        "image": "assets/gender/woman.png",
      },
      {
        "name": AppLocalizations.of(context)?.translate('others') ?? "",
        "image": "assets/gender/gender-fluid.png",
      }
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: barlowBold(
          text:
              AppLocalizations.of(context)?.translate('userInformations') ?? "",
          size: 15,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Column(
            children: [
              textFormFieldData(
                hintText:
                    AppLocalizations.of(context)?.translate('enterYourName') ??
                        "",
              ),
              const SizedBox(
                height: 20,
              ),
              textFormFieldData(
                hintText:
                    AppLocalizations.of(context)?.translate('enterYourEmail') ??
                        "",
              ),
              const SizedBox(
                height: 20,
              ),
              textFormFieldData(
                readOnly: true,
                controller: _controller,
                enabled: true,
                onTap: () {
                  _selectDate(context);
                },
                hintText:
                    AppLocalizations.of(context)?.translate('chooseYourDOB') ??
                        "",
              ),
              const SizedBox(
                height: 20,
              ),
              textFormFieldData(
                // color: grey,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                controller: _controllerAge,
                enabled: true,
                hintText:
                    AppLocalizations.of(context)?.translate('chooseYourAge') ??
                        "",
              ),
              const SizedBox(
                height: 20,
              ),
              textFormFieldData(
                // color: grey,
                readOnly: true,
                controller: _phonController,
                enabled: true,
                hintText: AppLocalizations.of(context)
                        ?.translate('yourMobileNumber') ??
                    "",
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    barlowBold(
                      text: AppLocalizations.of(context)
                              ?.translate('chooseYourGender') ??
                          "",
                      size: 13,
                      color: black,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        gender.length,
                        (generator) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                selectGender = gender[generator]["name"];
                                setState(() {});

                                // log("message${gender.firstOrNull}");
                              },
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: generator == 0
                                        ? const Radius.circular(10)
                                        : const Radius.circular(0),
                                    topLeft: generator == 0
                                        ? const Radius.circular(10)
                                        : const Radius.circular(0),
                                    topRight: generator == gender.length - 1
                                        ? const Radius.circular(10)
                                        : const Radius.circular(0),
                                    bottomRight: generator == gender.length - 1
                                        ? const Radius.circular(10)
                                        : const Radius.circular(0),
                                  ),
                                  color:
                                      selectGender == gender[generator]["name"]
                                          ? lightgreen
                                          : grey,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "${gender[generator]["image"]}",
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    barlowBold(
                                      text: "${gender[generator]["name"]}",
                                      color: black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  //mimicking the api
                  Future.delayed(const Duration(seconds: 1), () {
                    goto(
                      context,
                      const Homescreen(),
                    );
                    setState(() {
                      _isLoading = false;
                    });
                  });
                },
                color: materialButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                // const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        AppLocalizations.of(context)?.translate('continue') ??
                            "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
