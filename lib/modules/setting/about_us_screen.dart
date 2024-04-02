import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../utils/constants.dart';
import '../../widgets/rounded_app_bar.dart';
import 'controllers/about_us_cubit/about_us_cubit.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AboutUsCubit>().getAboutUs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(titleText: 'About Us'),
      body: BlocBuilder<AboutUsCubit, AboutUsState>(
        builder: (context, state) {
          if (state is AboutUsStateLoaded) {
            final aboutUsData = state.aboutUsModel;
            final String language = 'lan'.tr;
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Html(
                  data: language == 'EN'
                      ? aboutUsData.description
                      : aboutUsData.description_filipino,
                  style: {
                    "body": Style(
                      fontFamily: 'fa-regular-400',
                    ),
                    "p": Style(
                      fontFamily: 'fa-regular-400',
                    ),
                  },
                )
              ],
            );
          } else if (state is AboutUsStateLoading) {
            return const Center(
                child: CircularProgressIndicator(color: Color(0xFF34A853)));
          } else if (state is AboutUsStateError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: redColor),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
