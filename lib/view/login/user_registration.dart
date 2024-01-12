
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration_appp/view/login/login_page.dart';

// ignore: must_be_immutable
class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
 
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  
  Future<User?> _register() async {
    try {
      UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Kullanıcı oluşturuldu, adı Firestore'a kaydet
      await FirebaseFirestore.instance.collection('person').add({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'gender': genderController.text,
        'uid': userCredential.user?.uid,
      });
// Kullanıcı kaydı başarılı, işlemi tamamlayabilirsiniz.
    print('Kullanıcı kaydı başarılı: ${userCredential.user?.uid}');
    showSuccessDialog(); // Başarılı kayıt durumu
  } catch (e) {
    // Kayıt sırasında bir hata oluştu
    print('Hata: $e');
    showErrorDialog(e.toString()); // Hata durumunda hata mesajını göster
  }
  return null;
  }
  
void showSuccessDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Başarılı'),
        content: Text('Kullanıcı başarıyla kaydedildi.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(const LoginPage());
            },
            child: Text('Tamam'),
          ),
        ],
      );
    },
  );
}

void showErrorDialog(String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hata'),
        content: Text('Kullanıcı kaydedilirken bir hata oluştu: $errorMessage'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Tamam'),
          ),
        ],
      );
    },
  );
}

String? _validateEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      // E-posta format kontrolü
      if (!GetUtils.isEmail(value)) {
        return 'Geçerli bir e-posta giriniz';
      }
    } else {
      return 'E-posta alanı boş bırakılamaz';
    }
    return null;
  }

  // Cinsiyet doğrulaması için fonksiyon
  String? _validateGender(String? value) {
    if (value != null && value.isNotEmpty) {
      // Sadece kadın veya erkek kabul edilecek
      if (value.toLowerCase() != 'kadın' && value.toLowerCase() != 'erkek') {
        return 'Cinsiyet sadece kadın veya erkek olabilir';
      }
    } else {
      return 'Cinsiyet alanı boş bırakılamaz';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 201, 203, 227),
      ),
      backgroundColor: Color.fromARGB(255, 201, 203, 227),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/kullanici_ekle.png',
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Kullanıcı Kaydı",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Color.fromARGB(255, 68, 73, 107),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'Ad',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 112, 116, 153)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 85, 90, 125)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 68, 73, 107),
                ),
                hintText: 'Adınızı girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.name
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Soyad',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 112, 116, 153)), 
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color:  Color.fromARGB(255, 85, 90, 125)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 68, 73, 107),
                ),
                hintText: 'Soyadınızı girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.name
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-posta',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 112, 116, 153)), 
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 85, 90, 125)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 68, 73, 107),
                ),
                hintText: 'E-posta adresinizi girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.emailAddress, // E-posta klavyesi
  validator: _validateEmail,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Cinsiyet',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 112, 116, 153)), 
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color:  Color.fromARGB(255, 85, 90, 125)),
                ),
                labelStyle: TextStyle(
                  color:  const Color.fromARGB(255, 68, 73, 107),
                ),
                hintText: 'Cinsiyetinizi girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.multiline
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Şifre',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 112, 116, 153)), 
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color:  Color.fromARGB(255, 85, 90, 125)),
                ),
                labelStyle: TextStyle(
                  color:  const Color.fromARGB(255, 68, 73, 107),
                ),
                hintText: 'Şifrenizi girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.visiblePassword
            ),
            const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), backgroundColor:const Color.fromARGB(255, 68, 73, 107),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
                child: const Text('Kayıt Ol', style: TextStyle(color: Color.fromARGB(255, 209, 209, 209), fontSize: 18),),
              ),
              TextButton(
                          onPressed: () {
                            Get.to(const LoginPage());
                          },
                          child: const Text('Giriş Ekranına Dön'),
                        ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}