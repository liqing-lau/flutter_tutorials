/*To transmit the state of a variable into another page*/

import 'package:flutter/material.dart';
import 'package:flutter_tutorials/counter/counter_cubit.dart';
import 'package:flutter_tutorials/counter/counter_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(0),

      // BlocListener does something when state change, needs to occur
      // once per state chage, NOT including the initial state
      child: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          if (state == 10) {
            showAdaptiveDialog(
              context: context,
              builder:
                  (context) => const AlertDialog.adaptive(
                    content: Text("Yay, you've reached 10!"),
                  ),
            );
          } else if (state == 0) {
            showAdaptiveDialog(
              context: context,
              builder:
                  (context) => const AlertDialog.adaptive(
                    content: Text("Oh no, you are at 0!"),
                  ),
            );
          }
        },
        child: const CounterView(),
      ),
    );
  }
}
