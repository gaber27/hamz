// This is Link between events with states

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamztask/data/nyt_repo/nyt_repo_impl.dart';
import 'nyt_events.dart';
import 'nyt_states.dart';

class NYTBloc extends Bloc<NYTEvents, NYTStates>{
  final NYTRepository repository;

  NYTBloc(this.repository) : super(NYTInital()) {
    on<FetchArticleFromApi>((event, emit) async {
      emit(NYTFetchArticleLoading());
      try {
        final articles = await repository.fetchArticles();
        emit(NYTFetchArticleSuccess(articles));
      } catch (error) {
        emit(NYTFetchArticleError(error.toString()));
      }
    });
  }
}

