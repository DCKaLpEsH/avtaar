import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider extends ChangeNotifier {
  bool isEditable = false;
  bool bgExpanded = false;
  int profileCompleteness = 100;
  String name = "Jonathan";
  String description = "I am here to find what aligns with my interests";
  String contactNumber = "+91 9982738484";
  String gender = "Male";
  String doing = "I'm in school/junior college";
  String parentEmail = "mother@email.com";
  String grade = "Grade 8";
  String board = "CBSE";
  String city = "Pune";
  XFile? imagePath = XFile("assets/pngs/person.png");
  void toggleEdit() {
    isEditable = true;
    notifyListeners();
  }

  void toggleEdit2() {
    isEditable = false;
    notifyListeners();
  }

  void _profileCompleteness() {}

  void update({
    String? userName,
    String? desc,
    String? number,
    String? userGender,
    String? currentlyDoing,
    String? parentEmailID,
    String? userGrade,
    String? userBoard,
    String? userCity,
  }) {
    name = userName ?? name;
    description = desc ?? description;
    contactNumber = number ?? contactNumber;
    gender = userGender ?? gender;
    doing = currentlyDoing ?? doing;
    parentEmail = parentEmailID ?? parentEmail;
    grade = userGrade ?? grade;
    board = userBoard ?? board;
    city = userCity ?? city;
    notifyListeners();
  }

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    imagePath = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    // imagePath = img!.path;
    notifyListeners();
  }
}
