import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/router_name.dart';
import '../../utils/constants.dart';
import '../../widgets/please_signin_widget.dart';
import '../../widgets/toggle_button_scroll_component.dart';
import 'component/empty_order_component.dart';
import 'component/ordered_list_component.dart';
import 'controllers/order/order_cubit.dart';
import 'model/order_model.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<OrderCubit>().getOrderList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderStateLoading) {
            return const Center(
                child: CircularProgressIndicator(color: Color(0xFF34A853)));
          } else if (state is OrderStateError) {
            if (state.statusCode == 401) {
              return const PleaseSigninWidget();
            }
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: redColor),
              ),
            );
          } else if (state is OrderStateLoaded) {
            return OrderLoadedWidget(orderedList: state.orderList);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class OrderLoadedWidget extends StatefulWidget {
  final List<OrderModel> orderedList;
  const OrderLoadedWidget({
    Key? key,
    required this.orderedList,
  }) : super(key: key);

  @override
  State<OrderLoadedWidget> createState() => _OrderLoadedWidgetState();
}

class _OrderLoadedWidgetState extends State<OrderLoadedWidget> {
  List<OrderModel> orderedList = [];
  int _currentIndex = 0;
  void _filtering(int index) {
    orderedList.clear();
    _currentIndex = index;

    for (var element in widget.orderedList) {
      if (element.orderStatus == index) {
        orderedList.add(element);
      }
    }
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    _filtering(_currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = [
      context.read<OrderCubit>().orderStatusWithLenght(0),
      context.read<OrderCubit>().orderStatusWithLenght(1),
      context.read<OrderCubit>().orderStatusWithLenght(2),
      context.read<OrderCubit>().orderStatusWithLenght(3),
      context.read<OrderCubit>().orderStatusWithLenght(4),
    ];

    final routeName = ModalRoute.of(context)?.settings.name ?? '';

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          titleSpacing: routeName != RouteNames.mainPage ? 0 : null,
          automaticallyImplyLeading: routeName != RouteNames.mainPage,
          titleTextStyle: const TextStyle(
              color: blackColor, fontSize: 18, fontWeight: FontWeight.w600),
          title: Text('order_screen_my_order_text'.tr),
        ),
        SliverToBoxAdapter(
          child: ToggleButtonScrollComponent(
            textList: list,
            initialLabelIndex: _currentIndex,
            onChange: _filtering,
          ),
        ),
        if (orderedList.isEmpty) ...[
          const SliverToBoxAdapter(child: EmptyOrderComponent()),
        ] else ...[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // return Text(orderedList[index].id.toString());
                return OrderedListComponent(orderedItem: orderedList[index]);
              },
              childCount: orderedList.length,
            ),
          ),
        ],
        routeName == RouteNames.mainPage
            ? const SliverToBoxAdapter(child: SizedBox(height: 65))
            : const SliverToBoxAdapter(),
      ],
    );
  }
}
