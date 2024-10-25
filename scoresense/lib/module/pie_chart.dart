import 'dart:ui';

import 'package:flutter/material.dart';

class PieChartData {
  const PieChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

// our pie chart widget
class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    this.child,
    Key? key,
  })  : // make sure sum of data is never ovr 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100),
        super(key: key);

  final List<PieChartData> data;
  // radius of chart
  final double radius;
  // width of stroke
  final double strokeWidth;
  // optional child; can be used for text for example
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
        // calc diameter
        dimension: radius * 2,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

// responsible for painting our chart
class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    // Chuyển đổi dữ liệu biểu đồ thành dữ liệu cho trình vẽ
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round, // Đường chính bo tròn
              (e.percent - _padding) * _percentInRadians,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;
  static const _padding = 0;
  static const _paddingInRadians = _percentInRadians * _padding;
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    double startAngle = _startAngle;
    
    // Tính toán tổng góc của các đường phụ
    double totalSupplementaryAngle = 0;
    for (int i = 1; i < dataList.length; i++) {
      totalSupplementaryAngle += dataList[i].radians + _paddingInRadians;
    }

    // Điều chỉnh góc bắt đầu cho đường chính
    startAngle -= totalSupplementaryAngle;

    // Vẽ các phần còn lại (đường phụ) trước
    for (int i = 1; i < dataList.length; i++) {
      final data = dataList[i];
      final paint = Paint()
        ..color = data.paint.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = data.paint.strokeWidth
        ..strokeCap = StrokeCap.round; // Đường viền không bo tròn

      final path = Path()..addArc(rect, startAngle, data.radians);
      startAngle += data.radians + _paddingInRadians;
      canvas.drawPath(path, paint);
    }

    // Vẽ đường chính (đường đầu tiên) sau cùng
    if (dataList.isNotEmpty) {
      final firstData = dataList.first;
      final firstPath = Path()..addArc(rect, startAngle, firstData.radians);
      canvas.drawPath(firstPath, firstData.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


