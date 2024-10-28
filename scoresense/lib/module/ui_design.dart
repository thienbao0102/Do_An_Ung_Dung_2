import 'dart:math';
import 'package:scoresense/module/pie_chart.dart';
import 'package:scoresense/module/animatedPieChart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiDesign {
  //cách gọi hàm
  //UiDesign.tên_hàm(paramenter) nha

  //hàm ui cho trường nhập input data vào
  static Widget buildTextField(String label, Function(String) onChanged) {
    return SizedBox(
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle:
                  const TextStyle(color: Color(0xFF0062FF), fontSize: 16),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0062FF), width: 2.0),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 155, 155, 155), width: 2.0), // Độ dày border khi không focus
              ),
            ),
            onChanged: (val) => onChanged(val),
          )
        ],
      ),
    );
  }

  // text field with border and top label
  static Widget buildTextField2(String label, bool numOnly) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF0062FF),
            ),
          ),
          TextFormField(
            keyboardType: numOnly ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Đặt bán kính bo góc
                borderSide: BorderSide(color: Color(0xFF0062FF), width: 1.0), // Viền xung quanh
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Đặt bán kính bo góc
                borderSide: BorderSide(color: Color(0xFF0062FF), width: 1.0), // Viền xung quanh
              ),
            ),
          )
        ],
      ),
    );
  }


  // Helper method to build radio button groups
  //kích thước ô bằng nhau của radio (này là ở form 1 có gì tham khảo form 1 nha)
   static Widget buildRadioButtonGroup(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF0062FF),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF0062FF)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                //spacing: 10,
                children: options.map((option) {
                  return GestureDetector(
                    onTap: () => {onChanged(option)},
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedValue == option
                            ? const Color(0xFF0062FF)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedValue == option
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  //hàm ui radio chọn nhưng không có kích thước đồng đều (tham khảo form 2 cho dễ hình dung nha)
  static Widget buildRadioButtonGroupRow(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      children: [
        SizedBox(
          width: 250,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ), 
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0062FF)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            //spacing: 10,
            children: options.map((option) {
              return GestureDetector(
                onTap: () {
                  onChanged(option);
                },
                child: Container(
                  padding:
                      option.length < 4? const EdgeInsets.symmetric(horizontal: 36, vertical: 8):const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedValue == option
                        ? const Color(0xFF0062FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      color:
                          selectedValue == option ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  //hàm ui này là ui hàng radio tròn cổ điển (tham khảo form 3 nha)

  /*Chieu dai giua 4option va 5option khong tuong dong khong dong deu tren giao dien */

  static Widget buildRadioLevels(String question, List<String> options, int selectedIndex,
      ValueChanged<int> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            const SizedBox(
              width: 200,
            ),
            Container(
              width: options.length * 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(options.length, (index) {
                  return SizedBox(
                    width: 95,
                    child: Text(
                      options[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        Wrap(
          children: [
            SizedBox(
              width: 200,
              child: Text(
                question,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: options.length * 100,
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF0062FF)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(options.length, (index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 90,
                        child: Radio<int>(
                          value: index,
                          activeColor: const Color(0xFF0062FF),
                          groupValue: selectedIndex,
                          onChanged: (int? value) {
                            if (value != null) {
                              onChanged(value);
                            }
                          },
                        ),
                      )
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ],
    );
  }
  static Widget buildRadioButtonSupport(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          child: Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
        ), SizedBox(width: 155),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0062FF)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            //spacing: 10,
            children: options.map((option) {
              return GestureDetector(
                onTap: () {
                  onChanged(option);
                },
                child: Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      //option.length < 4? const EdgeInsets.symmetric(horizontal: 36, vertical: 8):const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedValue == option
                        ? const Color(0xFF0062FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      color:
                          selectedValue == option ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

Widget buildAnimatedPieChart(String title, double percentage) {
  String percentageString = "";
  Color conersColor = Color.fromARGB(255, 0, 0, 0);
  if (percentage < 0 || percentage > 100) {
      throw Exception('Percentage must be between 0 and 100');
  }else{
    percentageString = percentage.toStringAsFixed(0);
  }

  if (percentage >= 0 && percentage < 30) {
       conersColor = Color.fromARGB(255, 211, 0, 4);
      }
    else if (percentage >= 30 && percentage < 50) {
      conersColor = Color.fromARGB(255, 214, 97, 99);
    }
    else if (percentage >= 50 && percentage < 70) {
      conersColor = Color.fromARGB(255, 76, 75, 22);
    }
    else if (percentage >= 70 && percentage < 100) {
      conersColor = Color.fromARGB(255, 4, 203, 110);
    }
    else {
      conersColor = Color.fromARGB(255, 243, 198, 35);
    }

  // Dữ liệu cho biểu đồ  
  ChartSampleData data = ChartSampleData(
    x: "",  // Bạn có thể để tên hoặc nhãn ở đây nếu cần
    y: percentage,  // percentage cần là một giá trị double từ 0 đến 100
    text: '',
    pointColor: conersColor,
  );

  return RadialBarChart(
    title: title,
    maximumValue: 100,
    data: data,
  );
}

Widget addTextToAnimatedPieChart(percentage) {
  String percentageString = "";
  Color conersColor = Color.fromARGB(255, 0, 0, 0);
  if (percentage < 0 || percentage > 100) {
      throw Exception('Percentage must be between 0 and 100');
  }else{
    percentageString = percentage.toStringAsFixed(0);
  }

  if (percentage >= 0 && percentage < 30) {
       conersColor = Color.fromARGB(255, 211, 0, 4);
      }
    else if (percentage >= 30 && percentage < 50) {
      conersColor = Color.fromARGB(255, 214, 97, 99);
    }
    else if (percentage >= 50 && percentage < 70) {
      conersColor = Color.fromARGB(255, 76, 75, 22);
    }
    else if (percentage >= 70 && percentage < 100) {
      conersColor = Color.fromARGB(255, 4, 203, 110);
    }
    else {
      conersColor = Color.fromARGB(255, 243, 198, 35);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
            '${percentageString}%', // Phần trăm
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: conersColor, // Màu chữ
              height: 1.0
            ),
          ),
          Text(
            'Pass', // Chữ "Pass" nằm dưới phần trăm
            style: TextStyle(
              fontSize: 30, // Kích thước chữ có thể thay đổi
              fontWeight: FontWeight.bold,
              color: conersColor, // Màu chữ
              height: 1.0
            ),
          ),
      ],
    );
  }


Widget buildPieChart(double percentage) {
  String percentageString = "";
  Color conersColor = Color.fromARGB(255, 0, 0, 0);
  if (percentage < 0 || percentage > 100) {
      throw Exception('Percentage must be between 0 and 100');
  }else{
    percentageString = percentage.toStringAsFixed(0);
  }

  if (percentage >= 0 && percentage < 30) {
       conersColor = Color.fromARGB(255, 211, 0, 4);
      }
    else if (percentage >= 30 && percentage < 50) {
      conersColor = Color.fromARGB(255, 214, 97, 99);
    }
    else if (percentage >= 50 && percentage < 70) {
      conersColor = Color.fromARGB(255, 76, 75, 22);
    }
    else if (percentage >= 70 && percentage < 100) {
      conersColor = Color.fromARGB(255, 4, 203, 110);
    }
    else {
      conersColor = Color.fromARGB(255, 243, 198, 35);
    }
    // Dữ liệu cho biểu đồ
    final List<PieChartData> data = [
      PieChartData(conersColor, percentage), //data chính
      PieChartData(Color(0xFFA0E9FF), 100 - percentage), // nền
    ];

    return PieChart(
      data: data,
      radius: 120, // Bán kính của biểu đồ (tùy chỉnh theo nhu cầu)
      strokeWidth: 20, // Độ dày đường viền
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa cột
        crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
        children: [
          Text(
            '${percentageString}%', // Phần trăm
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: conersColor, // Màu chữ
              height: 1.0
            ),
          ),
          Text(
            'Pass', // Chữ "Pass" nằm dưới phần trăm
            style: TextStyle(
              fontSize: 30, // Kích thước chữ có thể thay đổi
              fontWeight: FontWeight.bold,
              color: conersColor, // Màu chữ
              height: 1.0
            ),
          ),
        ],
      ),
    );
}


  //toast thông báo ra màn hình
  static void showToast(String message) {
    Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 5,
    fontSize: 16.0,
  );
}

}

