import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_commerce_app/modules/authentication/controller/login/login_bloc.dart';

import '../../../utils/constants.dart';
import '../../../utils/k_images.dart';
import '../main_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.mainController,
    required this.selectedIndex,
  }) : super(key: key);
  final MainController mainController;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginBloc>().userInfo;
    return Material(
      elevation: 9,
      color: const Color(0x00ffffff),
      shadowColor: blackColor,
      child: ClipRRect(
        // borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: greenColor,
          unselectedItemColor: Color.fromARGB(255, 128, 128, 128),
          selectedLabelStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'fa-brands-400',
              fontWeight: FontWeight.w400),
          unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontFamily: 'fa-brands-400',
              fontWeight: FontWeight.w400),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Kimages.homeIcon,
                  color: selectedIndex == 0
                      ? greenColor
                      : Color.fromARGB(255, 128, 128, 128)),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset(Kimages.inboxIcon,
            //       color: selectedIndex == 1 ? redColor : Color.fromARGB(255, 128, 128, 128)),
            //   label: 'Inbox',
            // ),
            BottomNavigationBarItem(
              tooltip: 'Order',
              activeIcon:
                  SvgPicture.asset(Kimages.orderIcon, color: greenColor),
              icon: SvgPicture.asset(Kimages.orderIcon,
                  color: Color.fromARGB(255, 128, 128, 128)),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              tooltip: 'Profile',
              activeIcon:
                  SvgPicture.asset(Kimages.profileIcon, color: greenColor),
              icon: SvgPicture.asset(Kimages.profileIcon,
                  color: Color.fromARGB(255, 128, 128, 128)),
              label: 'Account',
            ),

            BottomNavigationBarItem(
              tooltip: 'LogOut',
              activeIcon: SvgPicture.asset(Kimages.profileLogOutIcon,
                  color: greenColor),
              icon: SvgPicture.asset(Kimages.profileLogOutIcon,
                  color: Color.fromARGB(255, 128, 128, 128)),
              label: 'LogOut',
            ),
          ],
          // type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (int index) {
            if (index == 3) {
              context.read<LoginBloc>().add(const LoginEventLogout());
            } else {
              mainController.naveListener.sink.add(index);
            }
          },
        ),
      ),
    );
  }
}
