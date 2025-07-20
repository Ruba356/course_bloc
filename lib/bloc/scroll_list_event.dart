part of 'scroll_list_bloc.dart';

abstract class ScrollListEvent extends Equatable {
  const ScrollListEvent();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends ScrollListEvent {}
