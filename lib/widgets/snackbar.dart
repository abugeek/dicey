import 'package:flutter/material.dart';

openIconSnackBar(context, String text, Widget icon) {
  // This should be called by an on pressed/tap function
  // Example:
  // Button(
  //  onTap: (){
  //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   backgroundColor: Colors.blue,
  //   content: Text("Your Text"),
  //   duration: Duration(milliseconds: 1500),
  // ));
  // }
  //)
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Row(
      children: [
        icon,
        const SizedBox(
          width: 13,
        ),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
      ],
    ),
    duration: const Duration(milliseconds: 1500),
  ));
}
