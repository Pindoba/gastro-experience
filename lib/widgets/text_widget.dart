import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.color,
      this.sizeText,
      this.alignment,
      this.fontRoboto,
      this.bold,
      this.overflow,
      this.maxLines});
  final String text;
  final Color? color;
  final double? sizeText;
  final TextAlign? alignment;
  final bool? fontRoboto;
  final FontWeight? bold;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.center,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 200,
        style: fontRoboto == true
            ? GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: sizeText ?? 24,
                    color: color ?? Colors.black,
                    fontWeight: bold ?? FontWeight.normal),
              )
            : GoogleFonts.sourceSerif4(
                textStyle: TextStyle(
                    fontSize: sizeText ?? 24,
                    color: color ?? Colors.black,
                    fontWeight: bold ?? FontWeight.normal),
              ));
  }
}
