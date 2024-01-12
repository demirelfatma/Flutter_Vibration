import 'package:cloud_firestore/cloud_firestore.dart';

class VibrationModel {
  String? id; // ID artık String tipinde
  double? x;
  double? y;
  double? z;
  DateTime? timestamp; // Zaman damgası

  VibrationModel({this.id, this.x, this.y, this.z, this.timestamp});

  // Firestore'dan veri okurken kullanılacak fabrika metodu
  factory VibrationModel.fromFirestore(Map<String, dynamic> json) {
    return VibrationModel(
      id: json['id'] ?? '',
      x: json['X'] ?? 0.0,
      y: json['Y'] ?? 0.0,
      z: json['Z'] ?? 0.0,
      timestamp: json['timestamp'] != null
          ? (json['timestamp'] as Timestamp).toDate()
          : null,
    );
  }

  // Firestore'ya veri gönderirken kullanılacak toJson metodu
  Map<String, dynamic> toJson() {
    return {
      'X': x ?? 0.0,
      'Y': y ?? 0.0,
      'Z': z ?? 0.0,
      'timestamp': timestamp ?? FieldValue.serverTimestamp(),
    };
  }
}
