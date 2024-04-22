import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundcolor,
    required this.textcolor,
    this.borderRadius,
    required this.text,
    this.fontsize,
    this.onPressed,
  });
  final String text;
  final Color backgroundcolor;
  final Color textcolor;
  final BorderRadius? borderRadius;
  final double? fontsize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundcolor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ??
                    BorderRadius.circular(
                      16,
                    ),
              )),
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(
              color: textcolor,
              fontWeight: FontWeight.w900,
              fontSize: fontsize,
            ),
          )),
    );
  }
}
