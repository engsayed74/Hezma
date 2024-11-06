import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hezma_app/core/utils/function/post_register.dart';
import 'package:hezma_app/features/home/data/models/register_model/register_model.dart';
import 'package:hezma_app/views/vegtable_info.dart';
import 'package:hezma_app/widgets/custom_textfield.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ActivateAccount1 extends StatefulWidget {
  ActivateAccount1({super.key, required this.token});

  final String token; // Token passed to this page
  final RegisterService _registerService = RegisterService();

  @override
  State<ActivateAccount1> createState() => _ActivateAccount1State();
}

class _ActivateAccount1State extends State<ActivateAccount1> {
  Timer? _timer;
  int _start = 10;
  TextEditingController otpController =
      TextEditingController(); // Controller for OTP

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer automatically when the app runs
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  // Function to activate phone number using OTP
  Future<void> activatePhoneNumber(BuildContext context) async {
    try {
      // Get the entered OTP from the controller
      String otp = otpController.text;

      if (otp.isEmpty || otp.length != 4) {
        // Show an error if OTP is not valid
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid 4-digit OTP')),
        );
        return;
      }

      // Make the API request to activate phone number with OTP
      Dio dio = Dio();
      final String _baseUrl =
          'https://hezma-traning.eltamiuz.net/api/v1/received_otp';
      Response response = await dio.post(
        _baseUrl,
        data: {'otp': otp}, // Send OTP in the request body
        options: Options(headers: {'Authorization': 'Bearer ${widget.token}'}),
      );

      if (response.statusCode == 200) {
        String message = response.data['message'];
        // If the OTP is correct and activation is successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Phone number activated successfully! $message')),
        );
        // Navigate to another page after successful activation
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const VegtableInfo(),
        ));
      } else {
        throw Exception('Failed to activate phone number');
      }
    } on DioError catch (e) {
      // Show error message if there's a Dio error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dio error: ${e.response?.data ?? e.message}')),
      );
    } catch (e) {
      // Show error message for any other error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose(); // Dispose the controller

    super.dispose();
  }

  void clearOtpFields() {
    otpController.clear(); // Clear the OTP input fields
  }

  @override
  Widget build(BuildContext context) {
    // Replace with actual user phone

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
              )),
        ),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: const Color(0xff30a345),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'تفعيل حسابك',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'الرجاء ادخال كود التفعيل',
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: PinCodeTextField(
                            controller: otpController, // Attach the controller
                            length: 4, // Number of OTP fields
                            appContext: context,
                            onChanged: (value) {},
                            onCompleted: (String verificationCode) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('OTP sent: $verificationCode')),
                              );
                              // Clear OTP input after submission
                              //  clearOtpFields();
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              fieldWidth: 60,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
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
                        const SizedBox(
                          height: 4,
                        ),
                        GestureDetector(
                          onTap: () async {
                            try {
                              // Use the token to resend OTP
                              String message = await widget._registerService
                                  .resendOtp(widget.token);

                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            } catch (e) {
                              // Show error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: $e'),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.only(left: 18, right: 18),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 1),
                                //color: Colors.blue,
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: Text(
                                'اعادة ارسال كود التفعيل خلال $_start.',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await activatePhoneNumber(context);
                            clearOtpFields();
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.only(left: 18, right: 18),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                border:
                                    Border.all(color: Colors.green, width: 1),
                                //color: Colors.blue,
                                borderRadius: BorderRadius.circular(18)),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: Text(
                                'تفعيل الكود',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
