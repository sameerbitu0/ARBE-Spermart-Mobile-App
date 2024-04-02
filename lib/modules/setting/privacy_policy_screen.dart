import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../utils/constants.dart';
import '../../widgets/rounded_app_bar.dart';
import 'controllers/privacy_and_term_condition_cubit/privacy_and_term_condition_cubit.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PrivacyAndTermConditionCubit>().getTermsAndConditionData();
    return Scaffold(
      appBar: RoundedAppBar(titleText: 'Privacy Policy'),
      body: BlocBuilder<PrivacyAndTermConditionCubit,
          PrivacyTermConditionCubitState>(
        builder: (context, state) {
          if (state is TermConditionCubitStateLoaded) {
            final termsAndCondition = state.privacyPolicyAndTermConditionModel;
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Html(
                  data: termsAndCondition.privacyPolicy,
                  style: {
                    "body": Style(
                      fontFamily: 'fa-regular-400',
                      fontSize: FontSize(16), // Set your desired font size
                    ),
                    "p": Style(
                      fontFamily: 'fa-regular-400',
                      fontSize: FontSize(16), // Set your desired font size
                    ),
                    // You can add other HTML tags here if needed
                  },
                )
              ],
            );
          } else if (state is TermConditionCubitStateLoading) {
            return const Center(
                child: CircularProgressIndicator(color: Color(0xFF34A853)));
          } else if (state is TermConditionCubitStateError) {
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
