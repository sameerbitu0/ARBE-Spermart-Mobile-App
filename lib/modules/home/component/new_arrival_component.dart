import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../../utils/k_images.dart';
import '../../../widgets/custom_image.dart';
import '../../category/component/product_card.dart';
import '../model/product_model.dart';
import 'package:get/get.dart';

class NewArrivalComponent extends StatelessWidget {
  const NewArrivalComponent({
    Key? key,
    required this.productList,
  }) : super(key: key);
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: MultiSliver(
        children: [
          const SliverToBoxAdapter(child: _NewArrivalHeader()),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 208,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  ProductCard(productModel: productList[index]),
              childCount: productList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _NewArrivalHeader extends StatefulWidget {
  const _NewArrivalHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<_NewArrivalHeader> createState() => _NewArrivalHeaderState();
}

class _NewArrivalHeaderState extends State<_NewArrivalHeader> {
  final _controller = CustomPopupMenuController();

  final List<String> list = <String>[
    'home_filter_dropdown_new_arrival'.tr,
    'home_filter_dropdown_top_products'.tr,
    'home_filter_dropdown_best_sellings'.tr,
    'home_filter_dropdown_discount_products'.tr,
    'home_filter_dropdown_height_price'.tr,
    'home_filter_dropdown_low_price'.tr,
    'home_filter_dropdown_free_delivery'.tr
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "new_arrival".tr,
          style:
              TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w600),
        ),
        CustomPopupMenu(
          pressType: PressType.singleClick,
          position: PreferredPosition.bottom,
          showArrow: false,
          verticalMargin: 4,
          controller: _controller,
          child: const SizedBox(
            height: 24,
            width: 24,
            child: Center(child: CustomImage(path: Kimages.menuIcon)),
          ),
          menuBuilder: () =>
              MenuItemListComponent(list: list, controller: _controller),
        ),
      ],
    );
  }
}

class MenuItemListComponent extends StatelessWidget {
  const MenuItemListComponent({
    Key? key,
    required this.controller,
    required this.list,
  }) : super(key: key);

  final List<String> list;
  final CustomPopupMenuController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.white,
        width: 175,
        height: 280,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 12),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: list
              .map(
                (e) => InkWell(
                  onTap: () {
                    controller.hideMenu();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
