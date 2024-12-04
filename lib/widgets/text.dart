import 'package:flutter/material.dart';
import 'package:gastro_experience/style.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends Text {
  DefaultText(super.data, { double size = 16, FontWeight weight = FontWeight.normal, Color? color, super.key}): super(
    style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color
        )
      )
    );
  
  factory DefaultText.h1(String text){
    return DefaultText(
      text,
      weight: FontWeight.w600,
      size: 64
    );
  }
  
  factory DefaultText.h2(String text){
    return DefaultText(
      text,
      weight: FontWeight.w600,
      size: 40
    );
  }

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

  factory DefaultText.normal(String text, { bool isInverted = false}){
    return DefaultText(
      text,
      size: 16,
      color: isInverted ? DefaultColors.white : null
    );
  }
}