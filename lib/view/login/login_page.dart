import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration_appp/core/constant/app/color_constant.dart';
import 'package:vibration_appp/view/home/service/auth_service.dart';
import 'package:vibration_appp/view/home/view/home_view.dart';
import 'package:vibration_appp/view/login/user_registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Lütfen e-posta ve şifre giriniz");
      return;
    }

    var user = await AuthService().signIn(email, password);
    if (user != null) {
      // Başarılı giriş durumunda yönlendirme yapabilirsiniz
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomeView()));
      });
    } else {
      _showErrorDialog("Kullanıcı bulunamadı veya hatalı şifre");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hata"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kapat"),
            ),
          ],
        );
      },
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: ColorsConstant.instance.primary,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Color.fromARGB(255, 201, 203, 227),
          elevation: 4, // Card'a hafif bir gölge ekleyebilirsin
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Şifre',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    backgroundColor: ColorsConstant.instance.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    await _signIn();
                  },
                  child: const Text(
                    "Giriş Yap",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Hesabınız yok mu?'),
                    TextButton(
                      onPressed: () {
                        Get.to(UserRegistration());
                      },
                      child: const Text('Kayıt Ol'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}
