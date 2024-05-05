import 'package:flutter/material.dart';

import '../../../core/theme.dart';

class NytErrorView extends StatelessWidget {
  const NytErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Some thing wrong please try again',style: appTheme.textTheme.bodyMedium,),
    );  }
}
