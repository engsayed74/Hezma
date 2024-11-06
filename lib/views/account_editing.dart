import 'package:flutter/material.dart';

class AccountEditing extends StatelessWidget {
  const AccountEditing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Padding(
              padding: EdgeInsets.only(
                top: 32,
                right: 24,
              ),
              child: Center(
                  child: Text(
                'تعديل الحساب',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'STV BOLD'),
              ))),
          //backgroundColor:Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 24,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(
                height: 32,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16, bottom: 8),
                    child: Text(
                      'الاسم',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'STV BOLD',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Image.asset('asset/images/pen.png'),
                  ),
                  // prefixIconConstraints: const BoxConstraints(),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

                  hintText: 'محمود',
                  hintStyle: TextStyle(
                    fontFamily: 'STV BOLD',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                      color: Color(0xffcccccc),
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16, bottom: 8, top: 10),
                    child: Text(
                      'رقم الجوال',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'STV BOLD',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Image.asset('asset/images/pen.png'),
                  ),
                  // prefixIconConstraints: const BoxConstraints(),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

                  hintText: '123456',
                  hintStyle: TextStyle(
                    fontFamily: 'STV BOLD',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                      color: Color(0xffcccccc),
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16, bottom: 8, top: 10),
                    child: Text(
                      'البريدالاكتروني',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'STV BOLD',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Image.asset('asset/images/pen.png'),
                  ),
                  // prefixIconConstraints: const BoxConstraints(),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

                  hintText: '1323@5654',
                  hintStyle: TextStyle(
                    fontFamily: 'STV BOLD',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                      color: Color(0xffcccccc),
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16, bottom: 8, top: 10),
                    child: Text(
                      'الرقم السري',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'STV BOLD',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Image.asset('asset/images/pen.png'),
                  ),
                  // prefixIconConstraints: const BoxConstraints(),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

                  hintText: '643215',
                  hintStyle: TextStyle(
                    fontFamily: 'STV BOLD',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                      color: Color(0xffcccccc),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: const Color(0xff8dc245),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Color(0xff8dc245),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'إلغاء',
                          style: TextStyle(
                              fontFamily: 'STV Bold',
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'حفظ',
                          style: TextStyle(
                              fontFamily: 'STV Bold',
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
