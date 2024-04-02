import 'package:flutter/material.dart';
//import 'package:flutter_font_awesome_web_names/flutter_font_awesome.dart';
//import 'package:top_commerce_app/utils/constants.dart';
import '../../../core/router_name.dart';
import '../model/product_categories_model.dart';
import 'package:get/get.dart';

class CategoryCircleCard extends StatelessWidget {
  const CategoryCircleCard({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final ProductCategoriesModel categoryModel;

  @override
  Widget build(BuildContext context) {
    String language = "lan".tr;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.singleCategoryProductScreen,
            arguments: categoryModel);
      },
      child: Column(
        children: [
          Container(
            height: 45,
            width: 45,
            child: Center(
              child: Image.network(
                "https://arbe-group.com/backend/img/category/" +
                    categoryModel.icon_image,
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              language == 'EN'
                  ? categoryModel.name
                  : categoryModel.name_filipino,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'DMSans-Bold',
                  color: Color.fromARGB(255, 56, 56, 56)),
            ),
          )
        ],
      ),
    );
  }
}
