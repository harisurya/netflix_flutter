// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnIntialPage()) {
    on<PageEvent>((event, emit) {
      if (event is GoToUserPickPage) {
        emit(OnUserPickPage());
      } else if (event is GoToHomePage) {
        emit(OnHomePage());
      } else if (event is GoToMovieDetailPage) {
        emit(OnMovieDetailPage());
      } else {
        emit(OnSplashPage());
      }
    });
  }
}
