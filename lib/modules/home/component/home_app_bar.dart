import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_commerce_app/modules/cart/controllers/cart/cart_cubit.dart';

import '../../../core/router_name.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  final double height;
  final String logo;
  final List<Map<String, dynamic>> locale;

  const HomeAppBar({
    Key? key,
    required this.logo,
    this.height = 140,
    this.locale = const [
      {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
      {'name': 'Filpino', 'locale': Locale('hi', 'IN')},
    ],
  }) : super(key: key);

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              'title'.tr,
              style: TextStyle(
                fontFamily: 'fa-regular-400',
              ),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextButton(
                      onPressed: () {
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        locale[index]['name'],
                        style: TextStyle(
                          fontFamily: 'fa-regular-400',
                          color: Color(0xFF4d4d4d),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: locale.length,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                height: height - 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImage(path: logo, height: 74, width: 150),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            buildLanguageDialog(context);
                          },
                          child: Text(
                            'lan'.tr,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 0),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.pushNamed(
                        //         context, RouteNames.notificationScreen);
                        //   },
                        //   child: Badge(
                        //     badgeColor: const Color(0xff18587A),
                        //     badgeContent: const Text(
                        //       '3',
                        //       style:
                        //           TextStyle(fontSize: 10, color: Colors.white),
                        //     ),
                        //     child: const Icon(Icons.notifications,
                        //         size: 28, color: Colors.white),
                        //   ),
                        // ),
                        // const SizedBox(width: 20),
                        BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                          if (state is CartStateLoading) {
                            return const CircularProgressIndicator(
                                color: Color(0xFF34A853));
                          } else if (state is CartStateError) {
                            return const Icon(Icons.error);
                          } else if (state is CartStateLoaded) {
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteNames.cartScreen);
                                },
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.shopping_cart_rounded,
                                          size: 28, color: Color(0xFF34A853)),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width:
                                            17, // Adjust this value as needed
                                        height:
                                            17, // Adjust this value as needed
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff18587A),
                                        ),
                                        child: Center(
                                          child: Text(
                                            state.cartResponseModel.cartProducts
                                                    .isNotEmpty
                                                ? state.cartResponseModel
                                                    .cartProducts.length
                                                    .toString()
                                                : '0',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          } else {
                            return const SizedBox();
                          }
                        })
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 22,
                right: 22,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff333333).withOpacity(0.18),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    onTap: () {
                      Utils.closeKeyBoard(context);
                      Navigator.pushNamed(
                          context, RouteNames.productSearchScreen);
                    },
                    decoration: inputDecorationTheme.copyWith(
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        size: 26,
                      ),
                      hintText: 'search'.tr,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 13,
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 30, minWidth: 30),
                      suffixIcon: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff18587A),
                            borderRadius: BorderRadius.circular(4)),
                        margin: const EdgeInsets.only(right: 8),
                        height: 32,
                        width: 32,
                        child: const Icon(
                          Icons.menu,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'fa-brands-400',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
