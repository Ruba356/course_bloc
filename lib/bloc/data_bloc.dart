import 'package:bloc/bloc.dart';
import 'package:course/models/todo.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(LoadingState()) {
    on<DataEvent>((event, emit) async {
      if (event is GetAllDataEvent) {
        emit(LoadingState());
        try {
          const String url = "https://jsonplaceholder.typicode.com/todos";

          var response = await http.get(
            Uri.parse(url),
            headers: {
              'Accept': 'application/json',
              'User-Agent': 'Mozilla/5.0',
            },
          );

          final todos = (json.decode(
            response.body,
          )).map<Todo>((json) => Todo.fromJson(json)).toList();

          emit(LoadedState(todos));
        } catch (e) {
          emit(ErrorState('error'));
          rethrow;
        }
      }
    });
  }
}
