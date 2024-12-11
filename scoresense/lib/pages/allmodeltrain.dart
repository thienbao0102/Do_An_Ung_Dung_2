import 'package:flutter/material.dart';
import 'package:scoresense/module/callbackend.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/pages/importtrainmodel.dart';

class AllModelTrain extends StatefulWidget {
  const AllModelTrain({super.key});

  @override
  _AllModelTrainState createState() => _AllModelTrainState();
}

class _AllModelTrainState extends State<AllModelTrain> {
  double _rotationAngle = 0.0;
  Future<void> _loadData() async {
    int num = await getTotalModel();
    setState(() {
      GlobalData().numModel = num;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Background_OtherPage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Header(setColor: GlobalData().colorPrimary),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Decision Tree Model",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ImportFileTrainModel()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF8FD14F)),
                          child: const Row(
                            children: [
                              Icon(Icons.memory, size: 24),
                              SizedBox(width: 8),
                              Text(
                                "Train Model",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // Quay icon một vòng (360 độ)
                            _rotationAngle += 3.14159 * 2; // Tăng thêm 360 độ
                          });
                          _loadData(); // Gọi function khác (nếu cần)
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: AnimatedRotation(
                            turns: _rotationAngle /
                                (3.14159 *
                                    2), // Chia cho 360 độ để biểu diễn số vòng quay
                            duration: const Duration(
                                milliseconds: 500), // Thời gian quay
                            child: Icon(Icons.autorenew, size: 24),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 165,
                margin: const EdgeInsets.only(
                    top: 20, bottom: 0, right: 50, left: 50),
                child: GridModelTrain())
          ],
        ),
      ),
    );
  }
}

class GridModelTrain extends StatefulWidget {
  const GridModelTrain({super.key});

  @override
  State<GridModelTrain> createState() => _GridModelTrainState();
}

class _GridModelTrainState extends State<GridModelTrain> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 40,
      mainAxisSpacing: 40,
      children: [...renderContainerModel(GlobalData().numModel)],
    );
  }
}

//container item of gridview
List<Container> renderContainerModel(int numModel) {
  return List<Container>.generate(
    numModel - 1,
    (int i) {
      return Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFBFBFB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Model_v${i + 1}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      );
    },
  );
}
