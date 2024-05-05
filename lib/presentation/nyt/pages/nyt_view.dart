import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamztask/bloc/nyt/nyt_bloc.dart';
import 'package:hamztask/bloc/nyt/nyt_states.dart';
import 'package:hamztask/core/constant/colors.dart';
import 'package:hamztask/core/theme.dart';

import '../../../bloc/nyt/nyt_events.dart';
import '../widgets/nyt_view_body.dart';

class NytView extends StatelessWidget {
  const NytView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access NYTBloc instance
    final nytBloc = BlocProvider.of<NYTBloc>(context);

    // Dispatch event to trigger fetching of articles
    nytBloc.add(FetchArticleFromApi());
    return BlocConsumer<NYTBloc, NYTStates>(
      listener: (context, state) {},
      builder:  (context, state) => Scaffold(
        appBar: AppBar(backgroundColor: mainColor,centerTitle: true,title: Text(
          'NYT Article',style: appTheme.textTheme.bodyLarge,),) ,
        body: const NYTViewBody(),
      ),
    );
  }
}