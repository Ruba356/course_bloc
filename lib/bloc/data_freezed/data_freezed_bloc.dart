import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/todo.dart';
import '../../api/todo_api.dart';

part 'data_freezed_state.dart';
part 'data_freezed_event.dart';
part 'data_freezed_bloc.freezed.dart';

class DataFreezedBloc extends Bloc<DataFreezedEvent,DataFreezedState>{
    final TodosApi todosApi;
  DataFreezedBloc({required this.todosApi}) : super(const DataFreezedState.loading()){
    on<DataFreezedEvent>((event, emit) async {
      await event.when(
        getAllTodos: () async {
          emit(const DataFreezedState.loading());
          try {
            final todos = await todosApi.getAllTodos();
            emit(DataFreezedState.loaded(todos));
          } catch (e) {
            emit(const DataFreezedState.error(
                "Something Went Wrong, Please Try Again Later !"));
          }
        },
       
      );
    });
  }
}