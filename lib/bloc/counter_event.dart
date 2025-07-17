part of 'counter_bloc.dart';



abstract class CounterEvent {}

class IncreamentEvent extends CounterEvent{}

class DecreamentEvent extends CounterEvent{}

class ResetEvent extends CounterEvent{}