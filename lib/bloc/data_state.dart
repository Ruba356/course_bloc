part of 'data_bloc.dart';

sealed class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class LoadingState extends DataState {}

class LoadedState extends DataState {
  final List<Todo> todos;

  const LoadedState(this.todos);

  @override
  List<Object> get props => [todos];
}

class ErrorState extends DataState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
