import 'dart:io';

import 'package:avtaar/providers/edit_profile_provider.dart';
import 'package:avtaar/ui/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widgets/my_activity_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameController,
      numberController,
      genderController,
      doingController,
      parentEmailController,
      personalEmailController,
      gradeController,
      schoolBoardController,
      descriptionController;
  late FocusNode nameFn,
      numberFn,
      genderFn,
      doingFn,
      parentEmailFn,
      personalEmailFn,
      gradeFn,
      schoolBoardFn,
      descriptionFn,
      cityFn;

  bool bgExpanded = true, isEditable = true;

  @override
  void initState() {
    super.initState();
    nameFn = FocusNode();
    numberFn = FocusNode();
    genderFn = FocusNode();
    doingFn = FocusNode();
    parentEmailFn = FocusNode();
    personalEmailFn = FocusNode();
    gradeFn = FocusNode();
    schoolBoardFn = FocusNode();
    descriptionFn = FocusNode();
    cityFn = FocusNode();
  }

  @override
  void dispose() {
    nameFn.dispose();
    descriptionFn.dispose();
    numberFn.dispose();
    genderFn.dispose();
    doingFn.dispose();
    parentEmailFn.dispose();
    personalEmailFn.dispose();
    gradeFn.dispose();
    schoolBoardFn.dispose();
    cityFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: const Size(360, 812),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );
    final provider = context.watch<EditProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Soleil",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            fontStyle: FontStyle.normal,
            color: const Color(0xFF000000),
          ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xFF000000),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: FileImage(
                        File(provider.imagePath!.path),
                      ),
                      backgroundColor: const Color(0xFFFFFFFF),
                      radius: 74.r,
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.name,
                        style: const TextStyle(
                          fontFamily: "Soleil",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        provider.description,
                        style: const TextStyle(
                          color: Color(0xFF282828),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Profile (${provider.profileCompleteness}%)",
              style: const TextStyle(
                color: Color(0xFF282828),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.maxFinite,
              height: 5.h,
              decoration: BoxDecoration(
                color: const Color(0xFF630BFF),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            Card(
              child: Container(
                width: double.maxFinite,
                // height: 60.h,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Career Clarity",
                      style: TextStyle(
                        color: Color(0xFF282828),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "I have a general idea",
                      style: TextStyle(
                        color: Color(0xFF282828),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const MyActivityWidget(),
            SizedBox(
              height: 15.h,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.zero,
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: bgExpanded,
                      backgroundColor: const Color(0xFFFFFFFF),
                      headerBuilder: (context, isExpanded) => Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.w,
                          ),
                          child: const Text(
                            "Background",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      body: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w,
                        ),
                        child: Column(
                          children: [
                            BackgroundFieldWidget(
                              title: provider.name,
                              fieldName: "Name",
                            ),
                            BackgroundFieldWidget(
                              fieldName: "Contact Number",
                              title: provider.contactNumber,
                            ),
                            BackgroundFieldWidget(
                              fieldName: "Gender",
                              title: provider.gender,
                            ),
                            BackgroundFieldWidget(
                              fieldName: "What I am currently doing",
                              title: provider.doing,
                            ),
                            BackgroundFieldWidget(
                              fieldName: "Parent's Email ID",
                              title: provider.parentEmail,
                            ),
                            BackgroundFieldWidget(
                              fieldName: "Which grade I'm in",
                              title: provider.grade,
                            ),
                            BackgroundFieldWidget(
                              fieldName: "Which school board I'm in",
                              title: provider.board,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  // provider.toggleEdit();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfilePage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Edit",
                                  style: TextStyle(
                                    color: Color(0xFF630BFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundFieldWidget extends StatelessWidget {
  const BackgroundFieldWidget({
    Key? key,
    required this.fieldName,
    required this.title,
  }) : super(key: key);

  final String fieldName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: const TextStyle(
              color: Color(0xFF929292),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF282828),
              fontSize: 16,
            ),
          ),
          const Divider(
            height: 1.5,
            color: Color(0xFF717171),
          ),
        ],
      ),
    );
  }
}
