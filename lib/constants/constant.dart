import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'colors.dart';

Widget textFormField(
        {required TextEditingController? controller,
        FormFieldValidator<String>? validator,
        required bool obscureText,
        required String hintText,
        Widget? suffixIcon,
        VoidCallback? onEditingComplete,
        FocusNode? focusNode,
        required TextInputType? keyboardType}) =>
    TextFormField(
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Colors.grey,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none
            // BorderSide(

            //   color: Color(0xff3A0CA3))

            ),
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3A0CA3))),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3A0CA3))),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3A0CA3))),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14, fontFamily: 'Poppins', color: Color(0xff3A0CA3)),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3A0CA3))),
      ),
    );

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}

// String? printFullText(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   pattern.allMatches(text).forEach((match) {
//     return match.group(0);
//   });
// }

Widget defaultButton({
  required String title,
  required VoidCallback? onPressed,
  required double? fontSize,
  required double? height,
  required double? width,
  required Color color,
  required Color textColor,
  List<BoxShadow>? boxShadow,
  EdgeInsetsGeometry? margin,
}) =>
    Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: boxShadow,

        //#3A0CA3
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700),
        ),
      ),
    );

///////////////////////////////////////////////////////////////////////

void dialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        child: Opacity(
          opacity: 0.7,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black12,
            child: Center(
              child: CircularProgressIndicator(
                color: MyColors.mainColor,
              ),
            ),
          ),
        ),
        onWillPop: () async => false,
      );
    },
  );
}

///////////////////////////////////////////////////////////////////////////////

customCachedNetworkImage(
    {required String url, required context, required BoxFit fit}) {
  try {
    // ignore: unnecessary_null_comparison
    if (url == null || url == "") {
      return const Icon(
        Icons.error,
        color: Color(0xffAB0D03),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.height * 0.02,
                      child: Image.asset(
                        "assets/icons/LOGO.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                errorWidget: (context, url, error) {
                  // ignore: prefer_const_constructors
                  return Icon(
                    Icons.error,
                    color: const Color(0xffAB0D03),
                  );
                })
            : const Icon(
                Icons.error,
                color: Color(0xffAB0D03),
              ),
      );
    }
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
  }
}
