import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hezma_app/widgets/custom_map_container.dart';
import 'package:hezma_app/widgets/map_screen.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
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
              'العناوين',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color(0xfff0f0f0)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('asset/images/map.png'),
                    const Text(
                      'تحديد ع الخريطة',
                      style: TextStyle(
                          fontFamily: 'STV Bold', color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'العناوين المستخدم للتوصيل',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'STV Bold'),
              ),
              const SizedBox(
                height: 32,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomMapContainer(),
                  CustomMapContainer(),
                  CustomMapContainer(),
                ],
              ),
              const SizedBox(
                height: 64,
              ),

              /* Container(
                  height: MediaQuery.sizeOf(context).height*.4,
                  child: GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target: const LatLng(24.7136, 46.6753),
                          zoom: 12,
                        ),),
                )*/
              Container(
                  height: MediaQuery.sizeOf(context).height * .4,
                  child: MapScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
