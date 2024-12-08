import 'package:scoresense/module/ui_design/Radio_Buton_Group_Row.dart';
import 'package:scoresense/module/ui_design/Radio_Button_Group.dart';
import 'package:scoresense/module/ui_design/Radio_Button_YesNo.dart';
import 'package:scoresense/module/ui_design/Radio_Levels.dart';
// import 'package:scoresense/module/Radio_Levels_Label.dart';
import 'package:scoresense/module/ui_design/animatedPieChart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class UiDesign {
  //cách gọi hàm
  //UiDesign.tên_hàm(paramenter) nha

  //hàm ui cho trường nhập input data vào
  static Widget buildTextField(String label, String value, Function(String) onChanged) {
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
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 155, 155, 155),
                    width: 2.0), // Độ dày border khi không focus
              ),
            ),
            initialValue: value,
            onChanged: (val) => onChanged(val),
          )
        ],
      ),
    );
  }

  // text field with border and top label
  static Widget buildTextField2(String label,String value, bool numOnly, Function(String) onChanged) {
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
            inputFormatters: numOnly
                ? [FilteringTextInputFormatter.digitsOnly] // Chỉ cho phép nhập số
                : null,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Color(0xFF0062FF), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Color(0xFF0062FF), width: 1.0),
              ),
            ),
            initialValue: value,
            onChanged: (val) => onChanged(val),
          )
        ],
      ),
    );
  }

  // Helper method to build radio button groups
  //kích thước ô bằng nhau của radio (này là ở form 1 có gì tham khảo form 1 nha)
  static Widget buildRadioButtonGroup(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return RadioButtonGroup(label: label, options: options, initialSelectedValue: selectedValue, onChanged: onChanged);
  }

  //hàm ui radio chọn nhưng không có kích thước đồng đều (tham khảo form 2 cho dễ hình dung nha)
  static Widget buildRadioButtonGroupRow(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return RadioButtonGroupRow(label: label, options: options, initialSelectedValue: selectedValue, onChanged: onChanged);
  }

  //hàm ui này là ui hàng radio tròn cổ điển (tham khảo form 3 nha)

  /*Chieu dai giua 4option va 5option khong tuong dong khong dong deu tren giao dien */
  static Widget buildRadioLevelsLabel(String question, List<String> options) {
    return Wrap(
      //runAlignment: WrapAlignment.start,
      children: [
        SizedBox(
          width: (WidgetsBinding.instance.window.physicalSize.width /
                      WidgetsBinding.instance.window.devicePixelRatio) >
                  1300
              ? 300
              : 450,
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
    );
  }


  static Widget buildRadioLevels(String question, List<String> options,
      int selectedIndex, ValueChanged<int> onChanged) {
    return RadioLevels(question: question, options: options, initialSelectedValue: selectedIndex, onChanged: onChanged);
  }

  static Widget buildRadioButtonYesNo( label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return RadioButtonYesNo(label: label, options: options, initialSelectedValue: selectedValue, onChanged: onChanged);
  }

  Widget buildAnimatedPieChart(String title, double percentage, Color conersColor) {
    if (percentage < 0 || percentage > 100) {
      throw Exception('Percentage must be between 0 and 100');
    } else {
    }

    // Dữ liệu cho biểu đồ
    ChartSampleData data = ChartSampleData(
      x: "", // Bạn có thể để tên hoặc nhãn ở đây nếu cần
      y: percentage, // percentage cần là một giá trị double từ 0 đến 100
      text: '',
      pointColor: conersColor,
    );

    return RadialBarChart(
      title: title,
      maximumValue: 100,
      data: data,
    );
  }

  Widget addTextToAnimatedPieChart(conersColor, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text, // Chữ "Pass" nằm dưới phần trăm
          style: TextStyle(
              fontSize: 60, // Kích thước chữ có thể thay đổi
              fontWeight: FontWeight.bold,
              color: conersColor, // Màu chữr
              height: 1.0),
        ),
      ],
    );
  }


  // //in danh sach ra man hinh
  // Widget buildContentTable(){

  // }
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
