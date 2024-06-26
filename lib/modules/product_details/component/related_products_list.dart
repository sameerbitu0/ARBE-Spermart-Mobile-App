import 'package:flutter/material.dart';

import '../../home/component/section_header.dart';
import '../model/product_details_product_model.dart';
import 'related_single_product_card.dart';
import '../../../core/router_name.dart';

class RelatedProductsList extends StatelessWidget {
  const RelatedProductsList(
    this.relatedProducts, {
    Key? key,
  }) : super(key: key);
  final List<ProductDetailsProductModel> relatedProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            headerText: 'Related Products',
            onTap: () {
              Navigator.pushNamed(context, RouteNames.allCategoryListScreen);
            },
          ),
        ),
        SizedBox(
          height: 235,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            itemCount: relatedProducts.length,
            itemBuilder: (context, index) => RelatedSingleProductCard(
                productModel: relatedProducts[index], width: 180),
          ),
        ),
      ],
    );
  }
}
