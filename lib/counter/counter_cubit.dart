/* Cubit is a simplfied version of BLoC

According to the documentations, Cubit can expose functions
which can be invoked to trigger state changes

Bloc requires events to trigger state changes. It receive events
and convert the incoming events into outgoing states. It can also 
capture info on what triggered the state change, good for traceability

Bloc also has an event sink that can control flow of incoming events
*/

import 'package:flutter_bloc/flutter_bloc.dart';

// Need to define the type of Cubit (int, class etc)
class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  // access the current state of cubit via getter and
  // emit a new state by adding + 1 to current state
  void plus() {
    emit(state + 1);
  }

  void minus() {
    if (state > 0) {
      emit(state - 1);
    } else if (state == 0) {
      // error handling
      addError(Exception("Count is at 0, can't go lower"), StackTrace.current);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
