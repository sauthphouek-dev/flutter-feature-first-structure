// // elevated_button_widget.dart
//
// import 'package:flutter/material.dart';
//
// class ElevatedButtonWidget extends StatelessWidget {
//
//   const ElevatedButtonWidget({Key? key, required this.text, required this.onPressed,) : super(key: key);
//   final String text;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//
//         ),
//
//       ),
//       child: Text(text),
//     );
//   }
// }
