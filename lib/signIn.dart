import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flare_loading/flare_loading.dart';
import 'package:get/get.dart';
import 'package:ideapad/globals/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ideapad/register.dart';

class SignIn extends HookWidget {
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    final userNameController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final passwordController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    return Consumer(
      builder: (context, watch, child) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: GestureDetector(
                  onTap: () => Get.toNamed("/"), child: Text("IdeaPad")),
            ),
            backgroundColor: lighterDarkB,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.height / 3,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (MediaQuery.of(context).size.width < 1532)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 8,
                                child: FlareLoading(
                                  name: "assets/login.flr",
                                  loopAnimation: 'flareUp',
                                  onError: (error, stacktrace) {},
                                  onSuccess: (data) {},
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: mainColor, width: 2.5),
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: "Enter your username",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                controller: userNameController,
                                onSubmitted: (value) {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: mainColor, width: 2.5),
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                controller: passwordController,
                                onSubmitted: (value) {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: FlatButton(
                                padding: EdgeInsets.all(15),
                                color: mainColor,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50),
                                ),
                                onPressed: () => print("hello"),
                              ),
                            ),
                            Text("Not a user?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50)),
                            TextButton(
                              child: Text(
                                "Register here",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                              onPressed: () => Get.toNamed('/register'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (MediaQuery.of(context).size.width > 1532)
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height / 1.5,
                      child: FlareLoading(
                        name: "assets/login.flr",
                        loopAnimation: 'flareUp',
                        onError: (error, stacktrace) {},
                        onSuccess: (data) {},
                      ),
                    ),
                  )
              ],
            ));
      },
    );
  }
}
