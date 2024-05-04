import 'package:flutter/material.dart';


void navigate({required BuildContext context, required Widget nextPage}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    ),
  );
}

void navigateAndEnd({required BuildContext context, required Widget nextPage}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    ),
        (route) => false,
  );
}


