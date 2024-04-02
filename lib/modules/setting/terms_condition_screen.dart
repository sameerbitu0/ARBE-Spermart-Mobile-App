import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../utils/constants.dart';
import '../../widgets/rounded_app_bar.dart';
import 'controllers/privacy_and_term_condition_cubit/privacy_and_term_condition_cubit.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PrivacyAndTermConditionCubit>().getTermsAndConditionData();
    return Scaffold(
      appBar: RoundedAppBar(titleText: 'Teams & Condition'),
      body: BlocBuilder<PrivacyAndTermConditionCubit,
          PrivacyTermConditionCubitState>(
        builder: (context, state) {
          if (state is TermConditionCubitStateLoaded) {
            final termsAndCondition = state.privacyPolicyAndTermConditionModel;
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Html(
                  data: termsAndCondition.termsAndCondition,
                  style: {
                    "body": Style(
                      fontFamily: 'fa-regular-400',                      
                    ),
                    "p": Style(
                      fontFamily: 'fa-regular-400',                      
                    ),
                    // ... Add other tags as needed
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
