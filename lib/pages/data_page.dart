import 'package:course/bloc/data_bloc.dart';
import 'package:course/bloc/data_freezed/data_freezed_bloc.dart';
import 'package:course/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPage extends StatelessWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      BlocBuilder<DataFreezedBloc , DataFreezedState>(builder: (context, state){
        return state.when(
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (todos) =>  ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final item = todos[index];
                return ListTile(title: Text(item.title.toString()));
              },
            ),
            error: (message) =>  Center(child: Text(message),),
          );
      })
      // BlocConsumer<DataBloc, DataState>(
      //   listener: (context, state) => {},
      //   builder: (context, state) {
      //     if (state is LoadedState) {
      //       return ListView.builder(
      //         itemCount: state.todos.length,
      //         itemBuilder: (context, index) {
      //           final item = state.todos[index];
      //           return ListTile(title: Text(item.title.toString()));
      //         },
      //       );
      //     } else if (state is ErrorState) {
      //       return Center(child: Text(state.message),);
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
