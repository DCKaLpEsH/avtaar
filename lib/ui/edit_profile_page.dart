import 'dart:io';

import 'package:avtaar/providers/edit_profile_provider.dart';
import 'package:avtaar/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widgets/dropdown_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController,
      numberController,
      genderController,
      doingController,
      parentEmailController,
      personalEmailController,
      gradeController,
      cityController,
      descriptionController,
      boardController;
  late FocusNode nameFn,
      numberFn,
      boardFn,
      genderFn,
      doingFn,
      parentEmailFn,
      personalEmailFn,
      gradeFn,
      cityFn,
      descriptionFn;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    numberController = TextEditingController();
    genderController = TextEditingController();
    doingController = TextEditingController();
    parentEmailController = TextEditingController();
    personalEmailController = TextEditingController();
    gradeController = TextEditingController();
    cityController = TextEditingController();
    descriptionController = TextEditingController();
    boardController = TextEditingController();
    nameController.text = context.read<EditProfileProvider>().name;
    numberController.text = context.read<EditProfileProvider>().contactNumber;
    genderController.text = context.read<EditProfileProvider>().gender;
    doingController.text = context.read<EditProfileProvider>().doing;
    parentEmailController.text =
        context.read<EditProfileProvider>().parentEmail;
    gradeController.text = context.read<EditProfileProvider>().parentEmail;
    cityController.text = context.read<EditProfileProvider>().board;
    descriptionController.text =
        context.read<EditProfileProvider>().description;
    boardFn = FocusNode();
    nameFn = FocusNode();
    numberFn = FocusNode();
    genderFn = FocusNode();
    doingFn = FocusNode();
    parentEmailFn = FocusNode();
    personalEmailFn = FocusNode();
    gradeFn = FocusNode();
    cityFn = FocusNode();
    descriptionFn = FocusNode();
  }

  @override
  void dispose() {
    numberController.dispose();
    descriptionController.dispose();
    genderController.dispose();
    doingController.dispose();
    parentEmailController.dispose();
    personalEmailController.dispose();
    gradeController.dispose();
    cityController.dispose();
    boardController.dispose();
    boardFn.dispose();
    nameFn.dispose();
    descriptionFn.dispose();
    numberFn.dispose();
    genderFn.dispose();
    doingFn.dispose();
    parentEmailFn.dispose();
    personalEmailFn.dispose();
    gradeFn.dispose();
    cityFn.dispose();
    super.dispose();
  }

  String board = "";
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EditProfileProvider>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 252, 239, 1),
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            "Edit Profile",
            style: TextStyle(
              fontFamily: "Soleil",
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              fontStyle: FontStyle.normal,
              color: Color(0xFF000000),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 164.h,
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 15.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(
                          File(
                            provider.imagePath!.path,
                          ),
                          errorBuilder: (context, error, stackTrace) {
                            return const Text(
                              'Select an image to display',
                            );
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        provider.pickImage();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        child: const Text(
                          "Upload new photo",
                          style: TextStyle(
                            color: Color(0xFF630BFF),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF630BFF),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "About me",
                        style: TextStyle(
                          color: Color(0xFF264F6C),
                          fontSize: 16,
                        ),
                      ),
                      MyTextField(
                        controller: nameController,
                        focusNode: nameFn,
                        label: "Name",
                        validator: (s) {
                          if (s == null) {
                            return "Enter name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      MyTextField(
                        controller: descriptionController,
                        focusNode: descriptionFn,
                        label: "Description",
                        validator: (s) {
                          if (s == null) {
                            return "Enter Description";
                          } else {
                            return null;
                          }
                        },
                      ),
                      MyTextField(
                        controller: numberController,
                        focusNode: numberFn,
                        label: "Contact Number",
                        validator: (s) {
                          if (s == null) {
                            return "Enter Contact Number";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                      MyTextField(
                        controller: genderController,
                        focusNode: genderFn,
                        label: "Gender",
                        validator: (s) {
                          if (s == null) {
                            return "Enter Gender";
                          } else {
                            return null;
                          }
                        },
                      ),
                      MyTextField(
                        controller: doingController,
                        focusNode: doingFn,
                        label: "What I am currently doing",
                        validator: (s) {
                          if (s == null) {
                            return "Enter what you're currently doing";
                          } else {
                            return null;
                          }
                        },
                      ),
                      MyTextField(
                        controller: parentEmailController,
                        focusNode: parentEmailFn,
                        label: "Parent's Email ID",
                        validator: (s) {
                          if (s == null) {
                            return "Enter parent's email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      MyTextField(
                        controller: gradeController,
                        focusNode: gradeFn,
                        label: "Which Grade I'm in",
                        validator: (s) {
                          if (s == null) {
                            return "Enter Grade";
                          } else {
                            return null;
                          }
                        },
                      ),
                      MyTextField(
                        controller: boardController,
                        focusNode: boardFn,
                        label: "Which school board I'm in",
                        validator: (s) {
                          if (s == null) {
                            return "Enter Grade";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            provider.update(
                              userName: nameController.text,
                              number: numberController.text,
                              userGender: genderController.text,
                              currentlyDoing: doingController.text,
                              parentEmailID: parentEmailController.text,
                              userGrade: gradeController.text,
                              desc: descriptionController.text,
                              userCity: cityController.text,
                              userBoard: boardController.text,
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF7A62F8),
                                Color(0xFF630BFF),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
