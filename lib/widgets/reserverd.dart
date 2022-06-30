/* import 'dart:math';
import 'package:flutter/material.dart';

import 'screens/dicePage.dart';
import 'widgets/tryLuck.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffd00000),
        appBar: AppBar(
          title: const Text('Dicee'),
          centerTitle: true,
          backgroundColor: const Color(0xffd00000),
        ),
        body: DicePage(),
        
        floatingActionButton: (LoadingAnimatedButton(
          child: const Text(
            'Try Your Luck',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onTap: () {
            DicePage();
          },
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    ),
  );
}
 */