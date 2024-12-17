import 'package:flutter/material.dart';

InputDecoration mFieldDecor({required String hint, required String heading}){
  return InputDecoration(
    hintText: hint,
    label: Text(heading),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
    )
  );
}