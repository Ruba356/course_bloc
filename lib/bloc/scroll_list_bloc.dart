import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scroll_list_event.dart';
part 'scroll_list_state.dart';
part 'scroll_list_bloc.freezed.dart';

class ScrollListBloc extends Bloc<ScrollListEvent, ScrollListState> {
  ScrollListBloc() : super(_Initial()) {
    on<ScrollListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
