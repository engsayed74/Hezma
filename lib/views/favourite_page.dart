import 'package:flutter/material.dart';
import 'package:hezma_app/views/product_details.dart';
import 'package:hezma_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:hezma_app/widgets/custom_card.dart';
import 'package:hezma_app/widgets/custom_item_card.dart';

class FavouritPAge extends StatelessWidget {
  const FavouritPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Padding(
            padding: EdgeInsets.only(
              top: 32,
              right: 24,
            ),
            child: Center(
                child: Text(
              'المفضلة',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
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
      body: Container(
        margin: EdgeInsets.only(top: 32),
        padding: EdgeInsets.all(16),
        height: MediaQuery.sizeOf(context).height,
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 3,
          ),
          itemBuilder: (context, index) {
            return CustomCard(
              name: 'orange',
              price: '20',
              imageUrl:
                  'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
            );
          },
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
