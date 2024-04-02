import 'package:flutter/material.dart';
import 'package:top_commerce_app/utils/constants.dart';
import '../../../core/remote_urls.dart';
import '../model/slider_model.dart';
import 'package:get/get.dart';

class HotDealBanner extends StatelessWidget {
  const HotDealBanner({
    Key? key,
    required this.banner,
    this.height,
  }) : super(key: key);
  final SliderModel banner;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(RemoteUrls.imageUrl(banner.image)),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: Colors.black.withOpacity(.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                banner.description,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 14.0, height: 2, color: Colors.white),
              ),
            ),
            Text(
              banner.title,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 20, height: 1.5, color: Colors.white),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                // Add functionality here if needed
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  'shop_now'.tr,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
