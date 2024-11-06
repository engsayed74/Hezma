import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hezma_app/widgets/electronic_paayment_dialog.dart';

class PaymentPage34 extends StatelessWidget {
  const PaymentPage34({super.key});

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
              'الدفع',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(':وسائل الدفع المستخدمة من قبل',
                    style: TextStyle(
                        fontFamily: 'STV Bold',
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * .5,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2 / 2),
                itemCount: 4,
                itemBuilder: (context, index) =>
                    Image.asset('asset/images/payment.png'),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              insetPadding: EdgeInsets.only(
                                  right: 4,
                                  left:
                                      4), // Removes default padding around the dialog
                              child: Material(
                                type: MaterialType
                                    .transparency, // Ensures the dialog background is transparent
                                child: Container(
                                  width: MediaQuery.of(context)
                                      .size
                                      .width, // Set width to full screen width
                                  height: MediaQuery.of(context).size.height *
                                      0.6, // Adjust height as needed
                                  padding: const EdgeInsets.all(
                                      16.0), // Optional: Add padding inside the dialog
                                  child: ElectronicDialogPayment(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'اضافة طريقة دفع',
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
          ],
        ),
      ),
    );
  }
}
