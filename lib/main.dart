import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dicey/widgets/tryLuck.dart';
import 'package:dicey/widgets/snackbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imageArray = [
    'one.png',
    'two.png',
    'three.png',
    'four.png',
    'five.png',
    'six.png'
  ];
  //var random = new Random();
  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffd00000),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(13, 50, 13, 50),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Total: ' +
                            '' +
                            (randomIntForDiceOne + randomIntForDiceTwo + 2)
                                .toString(),
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    /* Text(
                      "Find your\nfavorite food",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ), */
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(12, 26),
                                blurRadius: 50,
                                spreadRadius: 0,
                                color: Colors.grey.withOpacity(.25)),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 38,
                          backgroundColor: Colors.white,
                          child: FaIcon(
                            FontAwesomeIcons.dice,
                            size: 25,
                            color: Color(0xffd00000),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 90.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: Image.asset(
                      'assets/images/${imageArray[randomIntForDiceOne]}',
                      height: 190.h,
                      width: 190.h,
                    ),
                  ),
                  /* SizedBox(
                    width: 1.w,
                  ), */
                  Flexible(
                    child: Image.asset(
                      'assets/images/${imageArray[randomIntForDiceTwo]}',
                      height: 190.h,
                      width: 190.h,
                    ),
                  ),
                ],
              ),
              /* Padding(
                padding: const EdgeInsets.only(top: 60),
                child: RaisedButton(
                  onPressed: changeImage,
                  child: Text('Roll Dice'),
                ),
              ), */
              Padding(
                padding: EdgeInsets.only(top: 150.h),
                child: LoadingAnimatedButton(
                  child: const Text(
                    'Try Your Luck',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onTap: () {
                    HapticFeedback.lightImpact();
                    changeImage();
                    if ((randomIntForDiceOne + randomIntForDiceTwo + 2) >= 12) {
                      return openIconSnackBar(context, 'OMG, you\'re so lucky!',
                          const Icon(FontAwesomeIcons.trophy));
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void changeImage() {
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
    });
  }
}
