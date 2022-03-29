import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyActivityCardWidget extends StatelessWidget {
  const MyActivityCardWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final Color color;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      height: 125.h,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF4F4F4),
              fontSize: 30,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
