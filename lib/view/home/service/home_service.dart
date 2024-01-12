import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibration_appp/view/home/model/vibration_model.dart';

class HomeService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  HomeViewModel() {
    initializeCurrentUser();
  }

  void initializeCurrentUser() async {
    final _auth = FirebaseAuth.instance;
    User? _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      print("Mevcut Kullanıcı ID: ${_currentUser.uid}");
      print("Mevcut Kullanıcı E-Posta: ${_currentUser.email}");
    } else {
      print("Oturum açmış bir kullanıcı yok");
    }
    notifyListeners();
  }

  Future<void> addDataForUser(List<VibrationModel> list) async {
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    User? _currentUser = _auth.currentUser;
    try {
      CollectionReference vibrations = _firestore.collection('vibration_data');

      List<Map<String, dynamic>> dataList =
          list.map((model) => model.toJson()).toList();

      // Her bir modelin userId'sini ekleyerek veri ekleme
      for (var data in dataList) {
        if (_currentUser != null) {
          data['userId'] = _currentUser.uid;
        }
        await vibrations.add(data);
      }
    } catch (e) {
      debugPrint("Adding error: $e");
    }
  }

  Future<void> clearUserData() async {
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    User? _currentUser = _auth.currentUser;
    try {
      CollectionReference vibrations = _firestore.collection('vibration_data');

      QuerySnapshot snapshot =
          await vibrations.where('userId', isEqualTo: _currentUser?.uid).get();
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      debugPrint("Delete error: $e");
    }
  }
}
