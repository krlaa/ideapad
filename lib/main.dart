import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get/get.dart';
import 'package:ideapad/homePage.dart';
import 'package:ideapad/register.dart';
import 'package:ideapad/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GetMaterialApp(
        title: "IdeaPad",
        initialRoute: "/",
        getPages: [
          GetPage(
            name: "/",
            page: () => HomePage(),
          ),
          GetPage(
              name: "/signIn",
              page: () => SignIn(),
              parameter: {"helo": "hello"},
              title: "he"),
          GetPage(name: "/register", page: () => Register())
        ],
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
      ),
    );
  }
}
