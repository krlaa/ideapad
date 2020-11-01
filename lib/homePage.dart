import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideapad/globals/colors.dart';
import 'package:ideapad/signIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Container(
      decoration: BoxDecoration(
          color: lighterDarkB,
          gradient: LinearGradient(colors: [
            lighterDarkB,
            MediaQuery.of(context).size.width < 1475 ? lighterDarkB : darkB
          ], begin: Alignment.center, end: Alignment.centerRight)),
      child: Scaffold(
        key: _drawerKey,
        endDrawer: MediaQuery.of(context).size.width < 1475 ? Drawer() : null,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: kToolbarHeight + 30,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MediaQuery.of(context).size.width < 1475
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: AssetImage(
                      kIsWeb ? "assets/logo.png" : "assets/logo.png"),
                ),
              ),
              if (MediaQuery.of(context).size.width > 1475)
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text("IdeaPad",
                        style: TextStyle(
                            fontSize: 30, fontFamily: "Arial Rounded MT"))
                  ],
                )
            ],
          ),
          actions: [
            if (!(MediaQuery.of(context).size.width < 1475))
              Row(
                children: [
                  FlatButton(
                      height: kToolbarHeight,
                      onPressed: () => print("hi"),
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 18,
                              color: mainColor,
                              fontFamily: "Arial Rounded MT"))),
                  FlatButton(
                      height: kToolbarHeight,
                      onPressed: () => print("hi"),
                      child: Text("Register",
                          style: TextStyle(
                              fontSize: 18,
                              color: mainColor,
                              fontFamily: "Arial Rounded MT"))),
                  FlatButton(
                      onPressed: () => print("hi"),
                      child: Text("About",
                          style: TextStyle(
                              fontSize: 18,
                              color: mainColor,
                              fontFamily: "Arial Rounded MT"))),
                  SizedBox(
                    width: 70,
                  )
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.bars),
                  onPressed: () => _drawerKey.currentState.openEndDrawer(),
                ),
              )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image(
              height: MediaQuery.of(context).size.height,
              color: lighterDarkB,
              image: AssetImage(
                  kIsWeb ? "assets/lightbulb.png" : "assets/lightbulb.png"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.lighten,
            ),
            Container(
              color: MediaQuery.of(context).size.width < 1475
                  ? Colors.black.withOpacity(0.6)
                  : Colors.transparent,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Life to ideas to action.",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 15,
                          color: mainColor,
                          fontFamily: "Arial Rounded MT"),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                        "Effortless notes with tools to help you visualize your next big project",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 55,
                          color: Colors.white,
                          fontFamily: "Arial Rounded MT",
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 50,
                    ),
                    FlatButton(
                        height: 50,
                        color: mainColor,
                        onPressed: () => Get.toNamed(
                              "/signIn",
                            ),
                        child: Text("Get Started",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 55,
                                color: Colors.white,
                                fontFamily: "Arial Rounded MT")))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
