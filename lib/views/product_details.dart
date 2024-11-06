import 'package:flutter/material.dart';
import 'package:hezma_app/views/product_details2.dart';
import 'package:hezma_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:hezma_app/widgets/custom_card.dart';
import 'package:hezma_app/widgets/pannable_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int increment = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Color(0xffF0F0F0),
                  ),
                ),
              ),
              child: Image.asset(
                'asset/images/carrot.png',
                // width: 100,
                // height: 150,
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 8),
                    child: Row(
                      children: [
                        IconButton(
                            iconSize: 32,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Colors.green,
                            )),
                        Text(
                          '$increment',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        IconButton(
                            iconSize: 32,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails2(counter: increment),
                                  ));

                              setState(() {
                                increment++;
                              });
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.green,
                            )),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'جزر',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      RatingBar(),
                      const Row(
                        children: [
                          Text('رس/كجم',
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          Text('20.00',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'مزيد من التفاصيل',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'ان الجزر من الخضراوات الجذرية ويكون له الوان مختلفة تتنوع من البرتقالي العادي الي الاسود الاورجولني',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                      'وكذلك الاحمر والاصفر والابيض ان الجزر الذي يتم انتاجه في الوقت الحالي عرض المزيد',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      softWrap: true,
                      textAlign: TextAlign.right)
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8, bottom: 8),
              child: Text(
                'مزيد من المنتجات',
                style: TextStyle(
                    color: Color(0xff029445),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .4,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2 / 2),
                  itemBuilder: (context, index) {
                    return const CustomCard(
                      name: 'orange',
                      price: '20',
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: SizedBox(
          height: 80,
          child: BottomAppBar(
            child: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.only(
                      //  left: 160, right: 160, top: 10, bottom: 10),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'اضف الي السلة',
                      style: TextStyle(fontSize: 16),
                    )),
                const Column(
                  children: [
                    Text('مجموع السعر'),
                    Row(
                      children: [
                        Text('رس/كجم',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        Text('20.00',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                )
              ],
            )

                /*ListTile(
                  
                   leading: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                           // padding: const EdgeInsets.only(
                              //  left: 160, right: 160, top: 10, bottom: 10),
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                    onPressed: (){},
                    child: Text('اضف الي السلة',style: TextStyle(fontSize: 16),
                   
                   )
                   
                   
                   ),
                   title: Padding(
                     padding: const EdgeInsets.only(left: 108),
                     child: Text('مجموع السعر'),
                   ),
                   subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('رس/كجم',
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text('20.00',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold)),
                              ],
                   
                 ),
                 ),*/
                ),
          ),
        ),
      ),
    );
  }
}
