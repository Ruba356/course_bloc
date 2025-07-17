part of 'data_freezed_bloc.dart';

@freezed
class DataFreezedState with _$DataFreezedState {
   const factory DataFreezedState.loading() = _Loading;
  const factory DataFreezedState.loaded(List<Todo> todos) = _Loaded;
  const factory DataFreezedState.error(String message) = _Error;
}