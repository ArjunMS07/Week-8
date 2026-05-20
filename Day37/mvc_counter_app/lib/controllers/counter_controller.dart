import '../models/counter_model.dart';

class CounterController {
  final CounterModel model = CounterModel();

  int get counterValue => model.count;

  void increment() {
    model.count++;
  }

  void decrement() {
    model.count--;
  }

  void reset() {
    model.count = 0;
  }
}