import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';

class UploadFilegWidget extends StatelessWidget {
  const UploadFilegWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 33, bottom: 33),
              width: 100,
              height: 100,
              child: const Image(image: AssetImage('csvicon.png')),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  GlobalData().fileName,
                  style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                const SizedBox(height: 10),
                const LinearProgressIndicator(
                  value: 100,
                  color: Colors.blueAccent,),
                const SizedBox(height: 5),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.check,
                    color: Colors.blueAccent,
                    size: 20,
                  ),
                ],
              ),
              ],
            )),
          ],
        ),
      ],
    );
  }
}