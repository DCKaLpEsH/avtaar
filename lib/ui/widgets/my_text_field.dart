import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.controller,
    this.initialValue,
    required this.focusNode,
    required this.label,
    required this.validator,
    this.enabled,
    this.keyboardType,
    // required this.
  }) : super(key: key);
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode focusNode;
  final String label;
  final String? Function(String?)? validator;
  final bool? enabled;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        // horizontal: 28.w,
        vertical: 3.0,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: 2,
        minLines: 1,
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        enabled: enabled,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 0),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF717171),
              width: 1.5,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF630BFF),
              width: 1.5,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 241, 22, 22),
              width: 1.5,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF717171),
              width: 1.5,
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF717171),
              width: 1.5,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Color(0xFF929292),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        validator: validator,
        cursorColor: Color(0xFF717171),
      ),
    );
  }
}
