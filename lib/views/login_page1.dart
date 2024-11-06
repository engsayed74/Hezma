import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hezma_app/views/activate_account1.dart';
import 'package:hezma_app/views/create_account.dart';
import 'package:hezma_app/views/vegtable_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});

  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  bool isEmailSelected = false; // To track the selected option
  final _formKey = GlobalKey<FormState>(); // Key for the form

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginWithToken(String phoneOrEmail, String password) async {
    try {
      Dio dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, dynamic> requestData = {
        isEmailSelected ? 'email' : 'phone': phoneOrEmail,
        'password': password,
      };

      Response response = await dio.post(
        'https://hezma-traning.eltamiuz.net/api/v1/login',
        data: requestData,
      );

      if (response.statusCode == 200) {
        String token = response.data['token'];
        // Save token in shared preferences
        await prefs.setString('auth_token', token);

        // Navigate to next page if status is okay
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VegtableInfo(),
          ),
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError Status: ${e.response!.statusCode}');
        print('DioError Data: ${e.response!.data}');

        // Check if the error indicates that the phone number isn't confirmed
        if (e.response!.data['message'] ==
            'لم يتم تأكيد رقم الجوال الخاص بك بعد') {
          String token = e.response!.data['token'];

          // Direct the user to the phone verification page with the token
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActivateAccount1(token: token),
            ),
          );

          // Show a message asking the user to verify their phone
          showErrorSnackBar('Please verify your phone number.');
        } else if (e.response!.statusCode == 400) {
          showErrorSnackBar('Invalid request: Check your input.');
        } else if (e.response!.statusCode == 401) {
          showErrorSnackBar('Password or phone/email is incorrect.');
        } else {
          showErrorSnackBar('Server error: ${e.response!.statusCode}');
        }
      } else {
        showErrorSnackBar('An unknown error occurred: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
      showErrorSnackBar('An unexpected error occurred: $e');
    }
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff30a345),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: const Color(0xff30a345),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color(0xff30a345),
                  child: Image.asset(
                    'asset/images/لوجو-حزمه 2.png',
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Form(
                    key: _formKey, // Form key
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isEmailSelected
                                          ? Colors.green
                                          : Colors.white,
                                      foregroundColor: isEmailSelected
                                          ? Colors.white
                                          : Colors.green,
                                      side:
                                          const BorderSide(color: Colors.green),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isEmailSelected = true; // Select email
                                      });
                                    },
                                    child: const Text('البريد الالكتروني'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: !isEmailSelected
                                          ? Colors.green
                                          : Colors.white,
                                      foregroundColor: !isEmailSelected
                                          ? Colors.white
                                          : Colors.green,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isEmailSelected =
                                            false; // Select phone number
                                      });
                                    },
                                    child: const Text(
                                      'رقم الجوال',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: emailController,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child:
                                    Image.asset('asset/images/Rectangle.png'),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 18),
                              hintText: isEmailSelected
                                  ? 'البريد الالكتروني'
                                  : 'رقم الجوال',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: const BorderSide(
                                  color: Color(0xffcccccc),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى ادخال ${isEmailSelected ? "البريد الالكتروني" : "رقم الجوال"}';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                    'asset/images/3671903_hide_view_icon 1.png'),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 18),
                              hintText: 'الرقم السري',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: const BorderSide(
                                  color: Color(0xffcccccc),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى ادخال الرقم السري';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'هل نسيت الرقم السري؟',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'سياسة الخصوصية',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'بتسجيلك في حزمه فأنت توافق علي',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        loginWithToken(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                        // If the form is valid, proceed to the next screen
                                        /* Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const VegtableInfo(),
                                            ));*/
                                      }
                                    },
                                    child: const Text(
                                      'الدخول',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount(),
                                    ));
                                emailController.clear();
                                passwordController.clear();
                              },
                              child: const Text(
                                'انشاء حساب',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.green,
                                ),
                              ),
                            ),
                            Text(isEmailSelected
                                ? 'هل تريد تسجيل الدخول بالبريد الالكتروني؟'
                                : 'هل تريد تسجيل الدخول برقم الجوال؟'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'دخول بدون تسجيل',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green,
                              decorationStyle: TextDecorationStyle.double),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
