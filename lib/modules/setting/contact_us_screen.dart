import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/constants.dart';
import '../../widgets/rounded_app_bar.dart';
import 'component/contact_us_form_widget.dart';
import 'controllers/contact_us_cubit/contact_us_cubit.dart';
import 'model/contact_us_mode.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<ContactUsCubit>().getContactUsContent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(titleText: 'Contact Us'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            ContactUsFormWidget(),
            ContactUsCondentWidget(),
          ],
        ),
      ),
    );
  }
}

class ContactUsCondentWidget extends StatefulWidget {
  const ContactUsCondentWidget({Key? key}) : super(key: key);

  @override
  State<ContactUsCondentWidget> createState() => _ContactUsCondentWidgetState();
}

class _ContactUsCondentWidgetState extends State<ContactUsCondentWidget> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
      builder: (context, state) {
        if (state is ContactUsStateLoaded) {
          final aboutUsData = state.contactUsModel;
          return _buildLoadedWidget(aboutUsData);
        } else if (state is ContactUsStateLoading) {
          return const Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(child: CircularProgressIndicator(color: Color(0xFF34A853))),
          );
        } else if (state is ContactUsStateError) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: redColor),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildLoadedWidget(ContactUsModel aboutUsData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30, width: double.infinity),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildSingleInfo(
                  'contact_us_Text_mail_address'.tr, Icons.email, aboutUsData.email),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildSingleInfo(
                  'contact_us_Text_phone_number'.tr, Icons.call, aboutUsData.phone),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildSingleInfo(
            'contact_us_Text_contact_address'.tr, Icons.location_on, aboutUsData.address),
        const SizedBox(height: 30),
        Container(
          color: redColor,
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            zoomEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController ctr) {
              controller = ctr;
              loadMap(aboutUsData.map);
            },
          ),
        ),
      ],
    );
  }

  void loadMap(String iframe) {
    final uri = Uri.dataFromString(
      iframe,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    controller.loadUrl(uri);
  }

  Widget _buildSingleInfo(String header, IconData icon, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 30, color: redColor),
        Text(header, style: const TextStyle(fontSize: 16)),
        Text(
          content,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: iconGreyColor),
        ),
      ],
    );
  }
}
