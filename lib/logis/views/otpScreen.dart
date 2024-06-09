import 'dart:async';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:jointeam/logis/constant/widgets.dart';
import 'package:jointeam/logis/constant/appColors.dart';
import 'package:jointeam/languages/app_localizations.dart';
import 'package:jointeam/logis/views/userDetailScreen.dart';
// ignore: file_names

class OtpScreen extends StatefulWidget {
  final int phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _isLoading = false;
  String currentText = "";
  bool hasError = false;
  late Timer _timer;
  int _start = 60;
  bool isLoading = false;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((onValue) {
      startTimer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero).then((onValue) {
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
          child: Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)?.translate('otpVerify') ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: fullHeight(context) * 0.03,
                ),
                Image(
                  image: const AssetImage('assets/images/image.png'),
                  height: fullHeight(context) * 0.32,
                ),
                barlowBold(
                  text: _start != 0
                      ? AppLocalizations.of(context)?.translate('otpResent') ??
                          ""
                      : AppLocalizations.of(context)?.translate('otpSent') ??
                          "",
                  size: 12,
                ),
                barlowBold(
                  text: "+91 ${widget.phoneNumber}",
                  size: 15,
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                Pinput(
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 40,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(125, 196, 201, 205)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 40,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(125, 196, 201, 205)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ).copyDecorationWith(
                    border: Border.all(
                        color: const Color.fromRGBO(114, 178, 238, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 56,
                    height: 40,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(125, 196, 201, 205)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ).copyWith(
                    decoration: PinTheme(
                      width: 56,
                      height: 40,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(125, 196, 201, 205)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ).decoration!.copyWith(
                        color: const Color.fromARGB(121, 234, 246, 235)),
                  ),
                  closeKeyboardWhenCompleted: true,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  validator: (s) {
                    return null;
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                SizedBox(height: fullHeight(context) * 0.050),
                _start != 0
                    ? Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                      ?.translate('resendCode') ??
                                  "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "$_start Sec",
                              style: TextStyle(
                                color: materialButtonColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                      ?.translate('didNotReceiveAnyCode') ??
                                  "",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                // color: Colors.black38,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _start = 60;
                                  isLoading = true;
                                  startTimer();
                                });
                                // setState(() {
                                //   _isOtpResent = true;
                                // });
                              },
                              child: Text(
                                AppLocalizations.of(context)
                                        ?.translate('resendNewCode') ??
                                    "",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: materialButtonColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: fullHeight(context) * 0.010),
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
                        const UserDetailScreen(),
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
                          AppLocalizations.of(context)
                                  ?.translate('verifyOTP') ??
                              "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                ),
                SizedBox(height: fullHeight(context) * 0.03),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    AppLocalizations.of(context)
                            ?.translate('termsAndCondition') ??
                        "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
