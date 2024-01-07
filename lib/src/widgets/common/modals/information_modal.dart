import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationModal extends StatelessWidget {
  final String secondInfo;
  final String firstInfo;
  final String additionalInfo;
  final String bodyContent;
  final String firstDescription;
  final String secondDescription;
  final String additionalDescription;
  InformationModalController get modalController => Get.find<InformationModalController>();

  const InformationModal({
    super.key,
    required this.secondInfo,
    required this.firstInfo,
    required this.additionalInfo,
    required this.bodyContent,
    required this.firstDescription,
    required this.secondDescription,
    required this.additionalDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            child: SingleChildScrollView(
              child: Obx(() => modalController.showAlternateContent.value
                  ? _buildAlternateContent(context)
                  : _buildOriginalContent(context)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOriginalContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: _commonDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeaderContent(context, 'Prérequis'),
          _buildBodyContent(context),
          _buildFooterContent(context),
        ],
      ),
    );
  }

  Widget _buildAlternateContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: _commonDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildAlternateHeaderContent(context),
          _buildAlternateBodyContent(context, modalController.getAlternateContent()),
        ],
      ),
    );
  }

  BoxDecoration _commonDecoration() {
    return BoxDecoration(
      color: AppColors.blue50.withOpacity(0.80),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        const BoxShadow(
            color: Colors.black26, offset: Offset(0, 1), blurRadius: 2
        ),
      ],
    );
  }

  ListTile buildListTile(BuildContext context, IconData icon, String text, String description) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          modalController.toggleContent();
          modalController.setAlternateContent(description);
        },
        child: Icon(icon, color: AppColors.white, size: 30),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, color: AppColors.white),
      ),
    );
  }

  Widget _buildAlternateHeaderContent(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white, size: 30),
            onPressed: () {
              modalController.toggleContent();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAlternateBodyContent(BuildContext context, String description) {
    return Container(
      child: SizedBox(
        height: context.height * 0.55,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16,
                    color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderContent(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.blue100.withOpacity(0.13),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          const BoxShadow(
              color: AppColors.black26, offset: Offset(0, 0), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close,
                    color: AppColors.white, size: 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const Divider(
            color: AppColors.white,
            thickness: 2,
          ),
          buildListTile(context, Icons.info_outline_rounded, secondInfo, secondDescription),
          buildListTile(context, Icons.info_outline_rounded, firstInfo, firstDescription),
          buildListTile(context, Icons.info_outline_rounded, additionalInfo, additionalDescription),
        ],
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.blue100.withOpacity(0.13),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          const BoxShadow(
              color: AppColors.black26, offset: Offset(0, 0), blurRadius: 10),
        ],
      ),
      child: SizedBox(
        height: context.height * 0.3,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                bodyContent,
                style: TextStyle(fontSize: 16,
                    color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchInBrowser(Uri.parse('https://www.google.com'));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.public_outlined, color: AppColors.white),
                SizedBox(width: 8),
                Text(
                  "Site d'inscription",
                  style: TextStyle(color: AppColors.white, fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.white),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}