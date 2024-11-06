import 'package:flutter/material.dart';
import 'package:hezma_app/views/fruit_catalog.dart';
import 'package:hezma_app/views/vegtables_catalog.dart';
import 'package:hezma_app/widgets/custom_fruit_card.dart';
import 'package:hezma_app/widgets/custom_vegtable_card.dart';
import 'package:hezma_app/widgets/custom_water_card.dart';

class WaterCatalog extends StatelessWidget {
  const WaterCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding: EdgeInsets.only(
              top: 32,
              right: 24,
            ),
            child: Center(
                child: Text(
              'كاتلوج حزمة',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      backgroundColor: const Color(0xff8DC245),
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xff8DC245)),
                    ),
                    onPressed: () {},
                    child: const Text('مويه',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xff8DC245),
                      side: const BorderSide(color: Color(0xff8DC245)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FruitsCatalog(),
                        ),
                      );
                    },
                    child: const Text('فواكه', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xff8DC245)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VegtablesCatalog(),
                          ),
                        );
                      },
                      child: const Text(
                        'خضار',
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height * .7,
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 3 / 2),
                  itemBuilder: (context, index) {
                    return const CustomWaterCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
