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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              const BoxShadow(color: AppColors.black26, offset: Offset(0, 10), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: [
                  Text(
                    'Informations',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  // close button
                  Spacer(),
                  Icon(Icons.close),
                ],
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildListTile(context, Icons.account_circle, accountInfo),
                    buildListTile(context, Icons.home, domicileInfo),
                    buildListTile(context, Icons.photo, photoIdInfo),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close')),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListTile buildListTile(BuildContext context, IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
      },
    );
  }
}
