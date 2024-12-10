// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scoresense/module/enter_form/formenterdata1.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/pages/personalResultPage.dart';



void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
   testWidgets('Test UI of FormData1 widget', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FormData1(
          onNext: () {},
          isLastPage: false,
        ),
      ),
    ));

    // Kiểm tra sự tồn tại của các phần tử trong FormData1
    expect(find.text('Give me your information'), findsOneWidget); 
    expect(find.text('Your First name'), findsOneWidget);
    expect(find.text('Your Last name'), findsOneWidget);
    expect(find.text('Gender?'), findsOneWidget);
    expect(find.text('Home location?'), findsOneWidget);
    expect(find.text('Your age?'), findsOneWidget);
    expect(find.text('What school are you in?'), findsOneWidget);
    
    // Kiểm tra các TextField có mặt và có thể nhập
    expect(find.byType(TextField), findsNWidgets(4)); // Có 4 TextField
    expect(find.byType(Radio), findsNWidgets(4)); // Có 4 nhóm Radio (Gender, Location, Age)
    
    // Kiểm tra nút "Next"
    expect(find.text('Next'), findsOneWidget);
    
    // Kiểm tra hành động khi nhấn nút "Next"
    await tester.tap(find.text('Next'));
    await tester.pump(); // Cập nhật UI sau khi nhấn nút

    // Kiểm tra có xảy ra điều hướng đúng không (nếu có)
    // Giả sử bạn muốn kiểm tra điều hướng khi tất cả các trường đã được điền đầy đủ
    // Đây là ví dụ kiểm tra trạng thái đã thay đổi sau khi nhập dữ liệu và nhấn nút
    GlobalData().firstName = 'John';
    GlobalData().lastName = 'Doe';
    GlobalData().age = 25;
    GlobalData().school = 'ABC High School';

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle(); // Đảm bảo mọi tác vụ hoàn thành

    // Kiểm tra hành động điều hướng
    // Bạn có thể kiểm tra điều hướng nếu bạn có thêm route mới sau khi nhấn 'Next'
    // Chẳng hạn bạn có thể kiểm tra điều hướng đến một trang kết quả:
    expect(find.byType(PersonalResultPage), findsOneWidget);
  });

  testWidgets('Show alert dialog when required fields are empty', (WidgetTester tester) async {
    // Build the widget tree với dữ liệu rỗng
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FormData1(
          onNext: () {},
          isLastPage: false,
        ),
      ),
    ));

    // Nhấn nút "Next" mà không nhập gì
    await tester.tap(find.text('Next'));
    await tester.pump(); // Cập nhật UI sau khi nhấn nút

    // Kiểm tra rằng dialog được hiển thị khi các trường bắt buộc rỗng
    expect(find.text('Alert!'), findsOneWidget);
    expect(find.text('Please finish at least the questions on Page 1 before continuing!'), findsOneWidget);
  });
}
