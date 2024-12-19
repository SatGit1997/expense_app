import 'package:flutter/material.dart';

InputDecoration mFieldDecor({required String hint, required String heading, IconData? mIcon, IconData? sIcon , String? mPrefixText }){
  return InputDecoration(
      hintText: hint,
      label: Text(heading),
      prefixIcon: mIcon != null ? Icon(mIcon) : null,
      suffixIcon: sIcon != null ? Icon(sIcon) : null,
      prefixText: mPrefixText,

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21),
        borderSide: BorderSide(
            color: Colors.green,
            width: 2
        )
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(
            color: Color(0xff6574d3)
        )
    )
  );
}

/// custom Sized box
Widget mSpacer({double mHeight = 11.0, double mWidth = 11.0}) {
  return SizedBox(
    height: mHeight,
    width: mWidth,
  );
}