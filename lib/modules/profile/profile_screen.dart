import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/remote_urls.dart';
import '../../core/router_name.dart';
import '../../utils/constants.dart';
import '../../utils/k_images.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/please_signin_widget.dart';
import '../animated_splash_screen/controller/app_setting_cubit/app_setting_cubit.dart';
import '../authentication/controller/login/login_bloc.dart';
import 'component/profile_app_bar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final _className = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginBloc>().userInfo;
    final settingModel = context.read<AppSettingCubit>().settingModel;
    const double appBarHeight = 180;
    final routeName = ModalRoute.of(context)?.settings.name ?? '';

    if (userData == null) {
      return const PleaseSigninWidget();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: primaryColor),
            automaticallyImplyLeading: routeName != RouteNames.mainPage,
            expandedHeight: appBarHeight,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: redColor,
            ),
            flexibleSpace: ProfileAppBar(
                height: appBarHeight,
                logo: RemoteUrls.imageUrl(settingModel?.logo ?? ''),
                userData: userData),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          _buildProfileOptions(context),
          const SliverToBoxAdapter(child: SizedBox(height: 65)),
        ],
      ),
    );
  }

  SliverPadding _buildProfileOptions(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.addressScreen);
              },
              contentPadding: EdgeInsets.zero,
              leading: const CustomImage(path: Kimages.profileLocationIcon),
              title: Text('your_address'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.allCategoryListScreen);
              },
              contentPadding: EdgeInsets.zero,
              leading: const CustomImage(path: Kimages.profileCategoryIcon),
              title: Text('all_category'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            // ListTile(
            //   minLeadingWidth: 0,
            //   onTap: () {
            //     Navigator.pushNamed(context, RouteNames.notificationScreen);
            //   },
            //   contentPadding: EdgeInsets.zero,
            //   leading: const CustomImage(path: Kimages.profileNotificationIcon),
            //   title:  Text('notification'.tr, style: TextStyle(fontSize: 16)),
            // ),
            // ListTile(
            //   onTap: () {
            //     Navigator.pushNamed(context, RouteNames.chatListScreen);
            //   },
            //   minLeadingWidth: 0,
            //   contentPadding: EdgeInsets.zero,
            //   leading: const CustomImage(path: Kimages.profileChatIcon),
            //   title: Text('chats'.tr, style: TextStyle(fontSize: 16)),
            // ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.paymentsScreen);
              },
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading: const CustomImage(path: Kimages.paymentIcon),
              title: Text('payment_methods'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.changePasswordScreen);
              },
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.password_outlined, color: redColor),
              title: Text('change_password'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.pushNamed(context, RouteNames.settingScreen);
            //   },
            //   minLeadingWidth: 0,
            //   contentPadding: EdgeInsets.zero,
            //   leading: const CustomImage(path: Kimages.profileSettingIcon),
            //   title:  Text('settings'.tr, style: TextStyle(fontSize: 16)),
            // ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.termsConditionScreen);
              },
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading:
                  const CustomImage(path: Kimages.profileTermsConditionIcon),
              title: Text('teams_condition'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.privacyPolicyScreen);
              },
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading: const CustomImage(path: Kimages.profilePrivacyIcon),
              title: Text('privacy_policy_title'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.pushNamed(context, RouteNames.faqScreen);
            //   },
            //   minLeadingWidth: 0,
            //   contentPadding: EdgeInsets.zero,
            //   leading: const CustomImage(path: Kimages.profileFaqIcon),
            //   title:  Text('faq'.tr, style: TextStyle(fontSize: 16)),
            // ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.aboutUsScreen);
              },
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading: const CustomImage(path: Kimages.profileAboutUsIcon),
              title: Text('about_us'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.contactUsScreen);
              },
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading: const CustomImage(path: Kimages.profileContactIcon),
              title: Text('contact_us'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fa-regular-400',
                  )),
            ),
            // const ListTile(
            //   minLeadingWidth: 0,
            //   contentPadding: EdgeInsets.zero,
            //   leading: CustomImage(path: Kimages.profileAppInfoIcon),
            //   title: Text('App Info', style: TextStyle(fontSize: 16)),
            // ),
            BlocBuilder<LoginBloc, LoginModelState>(
              builder: (context, state) {
                return ListTile(
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: const CustomImage(path: Kimages.onClickIcon),
                  title: Text(
                    'delete_account'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'fa-regular-400',
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Confirmation',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'fa-regular-400',
                            ),
                          ),
                          content: Text(
                            'Are you sure you want to delete your account?',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'fa-regular-400',
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false); // No
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'fa-regular-400',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true); // Yes
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'fa-regular-400',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).then((confirmed) {
                      if (confirmed == true) {
                        context
                            .read<LoginBloc>()
                            .add(const LoginEventAccountDelete());
                      }
                    });
                  },
                );
              },
            ),

            BlocBuilder<LoginBloc, LoginModelState>(builder: (context, state) {
              if (state.state is LoginStateLogOutLoading) {
                const CircularProgressIndicator(color: Color(0xFF34A853));
              }
              return ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                leading: const CustomImage(path: Kimages.profileLogOutIcon),
                title: Text('sign_out'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'fa-regular-400',
                    )),
                onTap: () {
                  context.read<LoginBloc>().add(const LoginEventLogout());
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
