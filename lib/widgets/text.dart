import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends Text {
  DefaultText(super.data, { double size = 16, FontWeight weight = FontWeight.normal, super.key}): super(
    style: GoogleFonts.roboto(
        textStyle: TextStyle(
        fontSize: size,
        fontWeight: weight
      )
    )
  );

  factory DefaultText.title(String text){
    return DefaultText(
      text,
      weight: FontWeight.w600,
      size: 24
    );
  }

  factory DefaultText.subtitle(String text){
    return DefaultText(
      text,
      size: 20
    );
  }

  factory DefaultText.normal(String text){
    return DefaultText(
      text,
      size: 16
    );
  }
}