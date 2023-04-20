import 'package:flutter_hooks/flutter_hooks.dart';

UseCounter useCounter() {
  final counter = useState(0);
  void increment() {
    counter.value++;
  }

  return UseCounter(count: counter.value, increment: increment);
}

class UseCounter {
  final int count;
  final void Function() increment;
  UseCounter({required this.count, required this.increment});
}
