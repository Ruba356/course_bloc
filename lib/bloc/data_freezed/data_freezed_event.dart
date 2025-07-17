part of 'data_freezed_bloc.dart';

@freezed
class DataFreezedEvent with _$DataFreezedEvent {
    const factory DataFreezedEvent.getAllTodos() = _GetAllTodos;
}