import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/edit_profile_provider.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    Key? key,
    required this.items,
    required this.title,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final List<DropdownMenuItem<String>> items;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 80.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF929292),
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1,
            ),
          ),
          IgnorePointer(
            ignoring: context.watch<EditProfileProvider>().isEditable,
            child: DropdownButtonFormField<String>(
              focusColor: const Color(0xFF717171),
              value: context.watch<EditProfileProvider>().board,
              icon: Transform.rotate(
                angle: -pi / 2,
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
              iconEnabledColor: Colors.black,
              items: items,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
