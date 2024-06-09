import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jointeam/logis/constant/appColors.dart';

Widget barlowBold(
    {String text = "",
    double? size,
    Color? color,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? textAlign,
    bool underline = false}) {
  return Text(
    text,
    overflow: overflow ?? TextOverflow.ellipsis,
    maxLines: maxLine,
    textAlign: textAlign,
    textScaler: TextScaler.linear(1.0),
    style: TextStyle(
      color: color,
      fontSize: (size ?? 14),
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      decoration: underline ? TextDecoration.underline : null,
    ),
  );
}

///Navigate Push
goto(BuildContext context, Widget nextScreen) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

/// Screen size
double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget textFormFieldData({
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType,
  String? hintText,
  void Function(String)? onChanged,
  void Function()? onTap,
  TextEditingController? controller,
  bool readOnly = false,
  bool? enabled,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 20,
    ),
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(),
    ),
    child: TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      style: TextStyle(
        color: black,
      ),
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: black,
        ),
        border: InputBorder.none,
        // prefixText: "+91",
        // prefixStyle: TextStyle(color: black, fontSize: 15),
      ),
    ),
  );
}
