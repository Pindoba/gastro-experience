import 'package:flutter/material.dart';
import 'package:gastro_experience/widgets/text.dart';

class DefaultButton extends ElevatedButton {
  const DefaultButton({
    super.key,
    required super.onPressed,
    required super.child,
  });

  factory DefaultButton.primary(String text, Function()? onPressed){
    return DefaultButton(
      onPressed: onPressed,
      child: DefaultText.normal(text)
    );
  }
}