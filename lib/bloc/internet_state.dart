part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}


class ConnectedState extends InternetState {
  final String message;

  ConnectedState({required this.message});
}

