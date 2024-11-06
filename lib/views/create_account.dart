import 'package:flutter/material.dart';
import 'package:hezma_app/core/utils/function/post_register.dart';
import 'package:hezma_app/features/home/data/models/register_model/register_model.dart';
import 'package:hezma_app/views/activate_account1.dart';
import 'package:hezma_app/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>(); // Global key for form validation

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final RegisterService _registerService = RegisterService();
  final RegisterModel registerModel = RegisterModel();

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final phone = _phoneController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;
      final fcmToken =
          "626|30yKXXf6eBKXUYLFqIsQRuFq0MMkY72ypU4RMieA54de75a4"; // Get FCM token from the device, or replace with a placeholder

      // Basic form validation
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match!')),
        );
        return;
      }

      try {
        // Call the registerService method
        RegisterModel response = await _registerService.registerService(
          name: name,
          phone: phone,
          email: email,
          password: password,
          fcm: fcmToken,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text('Registration Successful!')),
        );
        // Show OTP in SnackBar

        // Save the token to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response.token ?? '');

        // Retrieve token from SharedPreferences
        String? token = prefs.getString('auth_token');
        if (token == null) {
          throw Exception('Token not found');
        }

        // Navigate to the next screen (e.g., OTP activation page)
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActivateAccount1(token: token)),
        );

        if (response.otp != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                width: MediaQuery.sizeOf(context).width * .8,
                content: Text('OTP Sent: ${response.otp}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP not received')),
          );
        }
      } catch (e) {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff30a345),
          leading: IconButton(
              onPressed: () {
                // Reset text fields when navigating back
                _nameController.clear();
                _phoneController.clear();
                _emailController.clear();
                _passwordController.clear();
                _confirmPasswordController.clear();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 24,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: const Color(0xff30a345),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //  alignment: Alignment.topCenter,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'انشاء حساب',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'STV BOLD'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 18),
                                hintStyle: const TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    ),
                                hintText: 'الاسم',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Color(0xffcccccc),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                } else if (value.length != 11) {
                                  return 'Phone number must be 11 digits';
                                }
                                return null;
                              },
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 18),
                                hintStyle: const TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    ),
                                hintText: 'رقم الجوال',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Color(0xffcccccc),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'او',
                                  style: TextStyle(
                                      fontFamily: 'STV BOLD',
                                      color: Colors.green),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Image.asset('asset/images/post.png'),
                                ),
                                // prefixIconConstraints: const BoxConstraints(),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 18),
                                hintStyle: const TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    ),
                                hintText: 'البريدالالكنروني',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Color(0xffcccccc),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Image.asset(
                                      'asset/images/3671903_hide_view_icon 1.png'),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 18),
                                hintStyle: const TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    ),
                                hintText: 'الرقم السري',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Color(0xffcccccc),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: _confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Image.asset(
                                      'asset/images/3671903_hide_view_icon 1.png'),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 18),
                                hintStyle: const TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    ),
                                hintText: 'تاكيدالرقم السري',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Color(0xffcccccc),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            const Row(
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
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
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
                                          // Navigate and clear fields

                                          _registerUser();
                                          _nameController.clear();
                                          _phoneController.clear();
                                          _emailController.clear();
                                          _passwordController.clear();
                                          _confirmPasswordController.clear();

                                          /*Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ActivateAccount1(),
                                              ));*/
                                        },
                                        child: const Text(
                                          'تسجيل',
                                          style: TextStyle(fontSize: 24),
                                        )),
                                  ),
                                ),
                              ],
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
        ));
  }
}
