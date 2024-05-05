import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamztask/bloc/connectivity/connectivity_bloc.dart'; // Import the connectivity bloc
import 'package:hamztask/bloc/connectivity/connectivity_states.dart';
import 'package:hamztask/bloc/nyt/nyt_bloc.dart';
import 'package:hamztask/bloc/nyt/nyt_states.dart';
import 'package:hamztask/core/network/local.dart';
import 'package:hamztask/presentation/nyt/widgets/nyt_cache_date_view.dart';
import 'package:hamztask/presentation/nyt/widgets/nyt_error_view.dart';
import 'package:hamztask/presentation/nyt/widgets/nyt_loading_view.dart';
import 'package:hamztask/presentation/nyt/widgets/nyt_success_view.dart';

class NYTViewBody extends StatelessWidget {
  const NYTViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged.asBroadcastStream(), // Transform into broadcast stream
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          // Treat as offline if snapshot data is null
          return const Scaffold(
            body: NytErrorView(), // Display error view when offline
          );
        }

        final isConnected = snapshot.data!.any((result) => result != ConnectivityResult.none);
        if (isConnected) {
          Future.delayed(Duration.zero, () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Connected'))); // Show snackbar when connected
          });
          return BlocBuilder<NYTBloc, NYTStates>(
            builder: (context, state) {
              if (state is NYTFetchArticleLoading) {
                return const NytLoadingView();
              } else if (state is NYTFetchArticleSuccess) {
                return NytSuccessView(state: state);
              } else if (state is NYTFetchArticleError) {
                // Check the connectivity state
                final connectivityState = BlocProvider.of<ConnectivityBloc>(context).state;
                if (connectivityState is ConnectivityDisconnected) {
                  // App is not connected, show cached data or error message
                  dynamic cachedData = CachHelper.getData(key: 'cachedDate');
                  if (cachedData != null) {
                    // Cached data exists, display it
                    return NytSuccessView(state: cachedData);
                  } else {
                    // No cached data available, display error message
                    return const NytErrorView();
                  }
                } else {
                  // App is connected, display error message
                  return const NytErrorView();
                }
              } else {
                return const NytErrorView();
              }
            },
          );
        } else {
          Future.delayed(Duration.zero, () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Not Connected'))); // Show snackbar when connected
          });
          return Scaffold(
            body: CachDataView(), // Display widget for no internet connection
          );
        }
      },
    );
  }
}
