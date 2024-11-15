
class Predictions {
  final String name;
  final int prediction;

  Predictions({required this.name, required this.prediction});

  // Phương thức để tạo đối tượng từ JSON
  factory Predictions.fromJson(Map<String, dynamic> json) {
    return Predictions(
      name: json['name']?? "",  
      prediction: json['prediction'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Prediction{name: $name, prediction: $prediction}';
  }
}