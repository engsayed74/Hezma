import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MApPage extends StatefulWidget {
  const MApPage({super.key});

  @override
  State<MApPage> createState() => _MApPageState();
}

class _MApPageState extends State<MApPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: const LatLng(24.7136, 46.6753),
            zoom: 12,
          ),
          markers: {
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              markerId: MarkerId('الرياض'),
              position: LatLng(24.7136, 46.6753),
              infoWindow: InfoWindow(
                  title: "الرياض-السعوديه",
                  anchor: Offset(3, 1),
                  // onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => const MApPage2(),)),
                  onTap: () => showDialog(
                        context: context,
                        builder: (context) => Container(
                          child: Image.asset('asset/images/mapbox.png'),
                        ),
                      )),
            ),
          },
        ),
        Positioned(
          top: 70,
          left: 20,
          right: 20,
          child: Row(
            children: [
              Image.asset(
                'asset/images/googlemap.png', // Placeholder for the logo, replace with your asset
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'STV Bold'),
                        hintText: 'البحث عن موقع',
                        suffixIcon: Icon(Icons.search),
                        suffixIconColor: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 14,
          // right: 200,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            onPressed: () {},
            child: const Text(
              'تأكيد الموقع',
              style: TextStyle(fontSize: 20, fontFamily: 'STV Bold'),
            ),
          ),
        ),
      ]),
    );
  }
}
