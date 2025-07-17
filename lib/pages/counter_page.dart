import 'package:course/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Counter : ', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (_, state) {
                return Text(
                  "${state.counter}",
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncreamentEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(ResetEvent());
            },
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              //  BlocProvider.of<CounterBloc>(context).add(DecreamentEvent());
              context.read<CounterBloc>().add(DecreamentEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
