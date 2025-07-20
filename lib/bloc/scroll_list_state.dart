part of 'scroll_list_bloc.dart';

enum PostStatus { loading, success, error }

class ScrollListState extends Equatable {
  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;
  final String errorMessage;

  const ScrollListState({
    this.status = PostStatus.loading,
    this.hasReachedMax = false,
    this.posts = const [],
    this.errorMessage = "",
  });

  ScrollListState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return ScrollListState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax, errorMessage];
}
