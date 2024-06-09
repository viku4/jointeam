import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jointeam/logis/providers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jointeam/services/apiUrls.dart';
import 'package:jointeam/services/apiServices.dart';
import 'package:jointeam/logis/views/otpScreen.dart';
import 'package:jointeam/logis/constant/widgets.dart';
import 'package:jointeam/logis/constant/appColors.dart';
import 'package:jointeam/languages/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  String verificationID = "";
  Map payload = {};
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: white,
      //   actions: [
      //     PopupMenuButton<int>(
      //       color: Colors.white,
      //       itemBuilder: (context) => [
      //         // PopupMenuItem 1
      //         const PopupMenuItem(
      //           value: 1,
      //           // row with 2 children
      //           child: Row(
      //             children: <Widget>[
      //               Icon(
      //                 Icons.abc,
      //               ),
      //               SizedBox(
      //                 width: 10,
      //               ),
      //               Text("English")
      //             ],
      //           ),
      //         ),
      //         // PopupMenuItem 2
      //         const PopupMenuItem(
      //           value: 2,
      //           // row with two children
      //           child: Row(
      //             children: [
      //               Icon(Icons.nearby_off),
      //               SizedBox(
      //                 width: 10,
      //               ),
      //               Text("Hindi")
      //             ],
      //           ),
      //         ),
      //       ],
      //       elevation: 2,
      //       onSelected: (value) {
      //         if (value == 1) {
      //           appLanguageProvider.changeLanguage(const Locale("en"));
      //         } else if (value == 2) {
      //           appLanguageProvider.changeLanguage(const Locale("ne"));
      //         }
      //       },
      //     ),
      //   ],
      // ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
          child: Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)?.translate('loginIn') ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: fullHeight(context) * 0.03),
                Image(
                    image: const AssetImage('assets/images/image.png'),
                    height: fullHeight(context) * 0.32),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    AppLocalizations.of(context)?.translate('weWillSendOtp') ??
                        "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: fullHeight(context) * 0.024,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: black,
                    ),
                    onChanged: (value) {
                      if (value.length == 10) {
                        goto(
                          context,
                          const OtpScreen(
                            phoneNumber: 9065546703,
                          ),
                        );
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)
                              ?.translate('enterYourNumber') ??
                          "",
                      hintStyle: TextStyle(
                        color: black,
                      ),
                      border: InputBorder.none,
                      // prefixText: "+91",
                      // prefixStyle: TextStyle(color: black, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(height: fullHeight(context) * 0.05),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    goto(
                      context,
                      const OtpScreen(
                        phoneNumber: 9065546703,
                      ),
                    );
                  },
                  color: materialButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
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
                          AppLocalizations.of(context)?.translate('getOtp') ??
                              "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                ),
                SizedBox(height: fullHeight(context) * 0.028),
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
  //   return Scaffold(
  //     // resizeToAvoidBottomInset: false,
  //     appBar: AppBar(),
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         // const SizedBox(
  //         //   height: 200,
  //         // ),
  //         // // const Text(
  //         // //   "Hello! Champion",
  //         // //   style: TextStyle(
  //         // //       color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
  //         // // ),
  //         // const SizedBox(height: 200),
  //         TextFormField(
  //           onChanged: (value) {
  //             payload["number"] = value;
  //             // if (value.length == 10) {}
  //           },
  //           maxLength: 10,
  //           keyboardType: TextInputType.number,
  //           style: TextStyle(
  //             fontSize: 23 / 1.0,
  //             fontStyle: FontStyle.normal,
  //             fontFamily: "Barlow",
  //             fontWeight: FontWeight.bold,
  //             color: black,
  //           ),
  //           inputFormatters: [
  //             FilteringTextInputFormatter.digitsOnly,
  //           ],
  //           decoration: InputDecoration(
  //             counterText: "",
  //             enabledBorder: const OutlineInputBorder(
  //               borderSide: BorderSide.none,
  //             ),
  //             focusedBorder: const OutlineInputBorder(
  //               borderSide: BorderSide.none,
  //             ),
  //             prefix: barlowBold(
  //               text: "+91 ",
  //               color: black,
  //               size: 23,
  //             ),
  //             hintText: "999-999-9999",
  //             hintStyle: TextStyle(
  //               fontSize: 23 / 1.0,
  //               fontStyle: FontStyle.normal,
  //               fontFamily: "Barlow",
  //               fontWeight: FontWeight.bold,
  //               color: greyShade400,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         ElevatedButton(
  //           onPressed: () async {
  //             // await Api().post(
  //             //   baseUrl + login,
  //             //   payload: {
  //             //     "number": payload["number"],
  //             //   },
  //             // ).then((value) {
  //             //   if (value.data["responce"]) {
  //             //     Fluttertoast.showToast(
  //             //         msg: "We have sent the verification code to ");
  //             //   } else {
  //             //     Fluttertoast.showToast(msg: "Server error!");
  //             //   }
  //             //   // log("${onValue.data}");
  //             // });
  //           },
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.yellow[700],
  //             shape: const StadiumBorder(),
  //             padding:
  //                 const EdgeInsets.symmetric(horizontal: 155, vertical: 15),
  //             textStyle: const TextStyle(
  //               fontSize: 20,
  //             ),
  //           ),
  //           child: const Text("Login"),
  //         ),
  //         const SizedBox(height: 15),
  //       ],
  //     ),
  //   );
  // }

  // getOtp() async {
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: "+91${phonecontroller.text}",
  //       verificationCompleted: (phoneAuthCredential) async {},
  //       verificationFailed: (verificationFailed) {
  //         setState(() {});
  //         print(verificationFailed);
  //       },
  //       codeSent: (verificationID, resendingToken) async {
  //         setState(() {
  //           this.verificationID = verificationID;
  //         });
  //         Navigator.of(context)
  //             .push(MaterialPageRoute(builder: (context) => OtpScreen()));
  //       },
  //       codeAutoRetrievalTimeout: (verificationID) async {});
  //   // Navigator.of(context)
  //   //.push(MaterialPageRoute(builder: (context) => OtpScreen()));
  // }
}
