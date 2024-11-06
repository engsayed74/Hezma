import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma_app/core/utils/function/get_slider.dart';
import 'package:hezma_app/features/home/data/models/sliders_model/slider_model.dart';
import 'package:hezma_app/features/home/manager/category_cubit/category_cubit.dart';
import 'package:hezma_app/features/home/manager/product_cubit/product_cubit.dart';
import 'package:hezma_app/features/home/manager/slider_cubit/slider_cubit.dart';
import 'package:hezma_app/views/vegtable_section_details.dart';
import 'package:hezma_app/views/vegtables_catalog.dart';
import 'package:hezma_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:hezma_app/widgets/custom_card.dart';
import 'package:hezma_app/widgets/custom_error_widget.dart';
import 'package:hezma_app/widgets/custom_section.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VegtableInfo extends StatefulWidget {
  const VegtableInfo({
    super.key,
  });

  @override
  State<VegtableInfo> createState() => _VegtableInfoState();
}

class _VegtableInfoState extends State<VegtableInfo> {
  List<SliderModel> sliders = [];
  GetSlider getSlider = GetSlider();
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //height: MediaQuery.sizeOf(context).height*.5,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'asset/images/alert.png',
                          width: 100,
                          alignment: Alignment.centerLeft,
                        ),
                        Image.asset(
                          'asset/images/لوجو-حزمه 4.png',
                          width: 100,
                          alignment: Alignment.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const VegtablesCatalog(),
                                ));
                          },
                          child: Image.asset(
                            'asset/images/menuicon.png',
                            width: 100,
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    ),

                    /* FutureBuilder<String>(
        future: getSlider.getSlider(),  // Fetch the first slider image URL
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            String imageUrl = snapshot.data!;  // Image URL

            return Center(
              child: Image.network(
                imageUrl,  // Display the image using the URL
                fit: BoxFit.cover,
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
                    ),*/

                    /* BlocBuilder<SliderCubit, SliderState>(
                      builder: (context, state) {
                        if (state is SliderLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SliderSuccess) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.slider.length,
                            itemBuilder: (context, index) {
                              final sliderItem = state.slider[index];

                              // Ensure the image URL is a valid string
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  sliderItem.image ??
                                      '', // Provide fallback if image is null
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons
                                        .error); // Show error icon if image fails to load
                                  },
                                ),
                              );
                            },
                          );
                        } else if (state is SliderFailure) {
                          return CustomErrorWidget(
                              errMessage: state.errorMessage);
                        } else {
                          return const SizedBox
                              .shrink(); // Return nothing for the initial or unknown state
                        }
                      },
                    ),*/

                    Image.asset('asset/images/vegtableinfo.png'),
                    // Image.network(GetSlider().toString(),width: 100,height: 50,),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'الاقسام',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        if (state is CategorySuccess) {
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                              reverse: true,
                              itemCount: state.categories.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: GestureDetector(
                                    onTap: () {
                                    if(state.categories[index].id==1){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const VegtableSectionDetails(),
                                        ));
                                    }
                                  },
                                    child: CustomSection(
                                        image: state.categories[index].image!,
                                        title: state.categories[index].name!),
                                  ),
                                );
                              },
                            ),
                          );

                          /*Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'asset/images/Group 60.png',
                                ),
                                Image.asset(
                                  'asset/images/Group 58.png',
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const VegtableSectionDetails(),
                                        ));
                                  },
                                  child: Image.asset(
                                    'asset/images/Group 61.png',
                                  ),
                                ),
                              ],
                            ),
                          );*/
                        } else if (state is CategoryFailure) {
                          return CustomErrorWidget(
                              errMessage: 'no image preview');
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'المنتجات',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductSuccess) {
                    return Container(
                      height: MediaQuery.sizeOf(context).height * .7,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 15,
                                childAspectRatio: 3 / 3),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            name: state.products[index].name!,
                            imageUrl: state.products[index].image!,
                            price: state.products[index].price!,
                          );
                        },
                      ),
                    );
                  } else if (state is ProductFailure) {
                    return CustomErrorWidget(errMessage: state.errMessage);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
      //bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
