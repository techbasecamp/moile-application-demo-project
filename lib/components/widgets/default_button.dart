import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/app_styles.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Color overlayColor;
  final Widget? prefix;

  const DefaultButton({
    Key? key,
    this.onPressed,
    this.title = "",
    this.textColor = Colors.white,
    this.prefix,
    this.backgroundColor = AppColor.brightRed,
    this.overlayColor = AppColor.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.black87),
        overlayColor: MaterialStateProperty.all(overlayColor),
        elevation: MaterialStateProperty.all(8),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 0)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefix ?? const SizedBox(),
          if (prefix != null) const SizedBox(width: 5),
          AutoSizeText(
            title,
            style: Style.buttonTextStyle.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
