import 'package:flutter/material.dart';
import 'package:jointeam/logis/providers.dart';
import 'package:jointeam/logis/constant/widgets.dart';
import 'package:jointeam/logis/views/loginScreen.dart';
import 'package:jointeam/logis/constant/appColors.dart';

class Languagessalection extends StatefulWidget {
  const Languagessalection({super.key});

  @override
  State<Languagessalection> createState() => _LanguagessalectionState();
}

class _LanguagessalectionState extends State<Languagessalection> {
  List language = [
    {"name": "English", "code": "en"},
    {"name": "HIndi", "code": "ne"}
  ];
  List slectedLanguage = [];
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Choose Language"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    language.length,
                    (index) => InkWell(
                      onTap: () {
                        code = language[index]["code"];
                        setState(() {});
                      },
                      child: Stack(
                        children: [
                          Card(
                            shape: (code == language[index]["code"])
                                ? RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: darkgreen, width: 1.5))
                                : null,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: fullWidth(context) / 3,
                              height: fullHeight(context) / 5,
                              // color: darkgreen,
                              child: Center(
                                child: Text(
                                  language[index]["name"],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            right: 1,
                            child: Checkbox(
                              value: (code == language[index]["code"]),
                              onChanged: (value) {
                                code = language[index]["code"];
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: code != null
                      ? () {
                          appLanguageProvider
                              .changeLanguage(Locale(code ?? ""));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }
                      : () {},
                  color: code != null ? materialButtonColor : grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
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
