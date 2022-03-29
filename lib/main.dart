import 'package:avtaar/providers/edit_profile_provider.dart';
import 'package:avtaar/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AvtaarApp());
}

class AvtaarApp extends StatefulWidget {
  const AvtaarApp({Key? key}) : super(key: key);

  @override
  State<AvtaarApp> createState() => _AvtaarAppState();
}

class _AvtaarAppState extends State<AvtaarApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EditProfileProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Soleil",
          scaffoldBackgroundColor: const Color.fromRGBO(255, 252, 239, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: ProfilePage(),
      ),
    );
  }
}
