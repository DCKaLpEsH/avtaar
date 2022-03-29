import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../profile_page.dart';
import 'my_activity_card_widget.dart';

class MyActivityWidget extends StatelessWidget {
  const MyActivityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Row(
          children: [
            const Expanded(
              child: MyActivityCardWidget(
                color: Color(0xFFF9B258),
                title: "2",
                subtitle: "Hour(s) spent on career learning",
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            const Expanded(
              child: MyActivityCardWidget(
                color: Color(0xFFF75956),
                title: "6",
                subtitle: "Career(s) explored",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
