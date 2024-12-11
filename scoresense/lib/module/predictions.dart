
class Predictions {
  final String name;
  final int prediction;
  final int originalIndex;

  Predictions({required this.name, required this.originalIndex, required this.prediction});

  // Phương thức để tạo đối tượng từ JSON
  factory Predictions.fromJson(Map<String, dynamic> json) {
    return Predictions(
      name: json['name']?? "",  
      originalIndex: json['originalIndex']?? -1,
      prediction: json['prediction'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Prediction{name: $name, prediction: $prediction, originalIndex: $originalIndex}';
  }
}