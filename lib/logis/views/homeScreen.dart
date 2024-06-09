import 'package:flutter/material.dart';
import 'package:jointeam/logis/providers.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.language,
            ),
            itemBuilder: (context) => [
              // PopupMenuItem 1
              const PopupMenuItem(
                value: 1,
                // row with 2 children
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.abc,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("English")
                  ],
                ),
              ),
              // PopupMenuItem 2
              const PopupMenuItem(
                value: 2,
                // row with two children
                child: Row(
                  children: [
                    Icon(Icons.nearby_off),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Hindi")
                  ],
                ),
              ),
            ],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                appLanguageProvider.changeLanguage(const Locale("en"));
              } else if (value == 2) {
                appLanguageProvider.changeLanguage(const Locale("ne"));
              }
            },
          ),
        ],
      ),
    );
  }
}
