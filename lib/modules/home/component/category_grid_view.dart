import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../../core/router_name.dart';
import '../../category/component/single_circuler_card.dart';
import '../../category/model/product_categories_model.dart';
import 'section_header.dart';
import 'package:get/get.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key? key,
    required this.categoryList,
  }) : super(key: key);
  final List<ProductCategoriesModel> categoryList;

  @override
  Widget build(BuildContext context) {
    if (categoryList.isEmpty) return const SliverToBoxAdapter();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: SectionHeader(
              headerText: 'categories'.tr,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.allCategoryListScreen);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 0,
              mainAxisExtent: 90,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  CategoryCircleCard(categoryModel: categoryList[index]),
              childCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
