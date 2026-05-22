import 'package:flutter/material.dart';
import '../controllers/roast_controller.dart';

class RoastView extends StatefulWidget {
  const RoastView({super.key});

  @override
  State<RoastView> createState() => _RoastViewState();
}

class _RoastViewState extends State<RoastView> {

  final RoastController controller =
      RoastController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Coffee Roast Timer",
        ),
      ),

      body: Center(
        child: ListenableBuilder(

          listenable: controller,

          builder: (context, child) {

            return Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Container(
                  width: 180,
                  height: 180,

                  decoration: BoxDecoration(
                    color: controller.roast.color,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "${controller.roast.seconds} sec",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  controller.roast.stage,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed:
                      controller.startRoasting,
                  child: const Text(
                    "Start Roasting",
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    ElevatedButton(
                      onPressed:
                          controller.back,
                      child: const Text("Back"),
                    ),

                    const SizedBox(width: 15),

                    ElevatedButton(
                      onPressed:
                          controller.forward,
                      child: const Text("Forward"),
                    ),

                    const SizedBox(width: 15),

                    ElevatedButton(
                      onPressed:
                          controller.reset,
                      child: const Text("Reset"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}