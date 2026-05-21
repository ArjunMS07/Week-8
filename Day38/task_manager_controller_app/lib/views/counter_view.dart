import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  final CounterController controller =
      CounterController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Controller"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Text(
              "Current Count",
              style: TextStyle(
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "${controller.count}",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(
                      controller.decrement,
                    );
                  },
                  child: const Text("-"),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {
                    setState(
                      controller.increment,
                    );
                  },
                  child: const Text("+"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(
                  controller.reset,
                );
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}