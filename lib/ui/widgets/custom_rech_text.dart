import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomRichText extends StatelessWidget {
  final double? textSize;
  final double? textRichSize;
  final String? text;
  final String textRich;
  final String? textRichColor;
  final String? fontFamily;
  final VoidCallback? onPressed;

  const CustomRichText({
    Key? key,
    this.textSize,
    this.textRichSize,
    this.text,
    required this.textRich,
    this.textRichColor, this.fontFamily,
     this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
            TextSpan(
              text: textRich,
              style: TextStyle(
                color: HexColor(textRichColor??"#171717"),
                fontFamily: fontFamily,
                fontSize:textRichSize,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
