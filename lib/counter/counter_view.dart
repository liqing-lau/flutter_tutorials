import 'package:flutter/material.dart';
import 'package:flutter_application/counter/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // BlocBuilder rebuilds the widget when there's change in state
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              "Current Count: $state",
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().plus(),
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().minus(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
