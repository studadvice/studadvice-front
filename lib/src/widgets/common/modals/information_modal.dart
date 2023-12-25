import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class InformationModal extends StatelessWidget {
  final String accountInfo;
  final String domicileInfo;
  final String photoIdInfo;

  const InformationModal({
    super.key,
    required this.accountInfo,
    required this.domicileInfo,
    required this.photoIdInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                const BoxShadow(
                    color: Colors.black26, offset: Offset(0, 1), blurRadius: 2),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildHeaderContent(context, 'Prérequis'),
                _buildBodyContent(context),
                _buildFooterContent(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {},
    );
  }

  Widget _buildHeaderContent(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
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
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const Divider(),
          buildListTile(context, Icons.info_outline_rounded, accountInfo),
          buildListTile(context, Icons.info_outline_rounded, domicileInfo),
          buildListTile(context, Icons.info_outline_rounded, photoIdInfo),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          const BoxShadow(
              color: AppColors.black26, offset: Offset(0, 0), blurRadius: 10),
        ],
      ),
      child: const Column(
        children: <Widget>[
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildFooterContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.language, color: AppColors.black26),
              SizedBox(width: 10),
              Text(
                'Registration website',
                style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.black),
        ],
      ),
    );
  }
}