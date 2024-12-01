import 'package:flutter/material.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/text.dart';
import 'package:gastro_experience/widgets/text_widget.dart';

class DefaultButton extends ElevatedButton {
  const DefaultButton({
    super.key,
    required super.onPressed,
    required super.child,
    this.color,
    this.style
  });
  final Color? color;
  final ButtonStyle? style;

  factory DefaultButton.primary(String text, Function()? onPressed){
    return DefaultButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.primaryButton
      ),
      child: TextWidget(
        text: text,
        color: DefaultColors.white,
        sizeText: 16,
      )
    );
  }
  factory DefaultButton.secondary(String text, Function()? onPressed){
    return DefaultButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.mainBg,
        side: BorderSide(color: DefaultColors.secondaryButton)
      ),
      child: TextWidget(
        text: text,
        color: DefaultColors.secondaryButton,
        sizeText: 16,
      )
    );
  }
}