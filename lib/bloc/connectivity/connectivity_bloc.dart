import 'package:flutter_bloc/flutter_bloc.dart';
import 'connectivity_events.dart';
import 'connectivity_states.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityLoading());

}
