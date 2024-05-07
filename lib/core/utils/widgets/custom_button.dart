import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,
    required this.textColor,
    required this.backgroundColor,
     this.borderRadius,
    required this.onPressed,
     this.fontSize});
    final String text;
   final void Function() onPressed;
   final Color textColor;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final double? fontSize;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(onPressed:onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,

            shape: RoundedRectangleBorder(borderRadius:borderRadius?? BorderRadius.circular(16),)
          ),
          child:Text(text,style: Styles.textStyle16.copyWith(color:textColor,fontSize: fontSize,fontWeight: FontWeight.w600),)),
    );
  }
}
