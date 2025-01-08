import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: const Text(
          "Alert Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Alert :",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Animal Detected",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Camera :",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "camera 1",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(236, 255, 255, 255),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(children: [
              Text(
                "Time :",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.teal,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                DateTime.now().toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(236, 255, 255, 255),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
