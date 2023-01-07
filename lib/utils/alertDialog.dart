import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  // Init
  AlertDialog dialog = AlertDialog(
    backgroundColor: Theme.of(context).colorScheme.background,
    content: Column(
      children: [
        
      ],
    ),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}
  // Show the dialog
  