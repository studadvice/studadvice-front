import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class InformationModal extends StatelessWidget {
  final StepProcess stepProcess;

  const InformationModal({
    Key? key,
    required this.stepProcess,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    const BoxShadow(
                      color: AppColors.black26,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "roadmap.required".tr,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
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
                        if (stepProcess.requiredDocuments != null &&
                            stepProcess.requiredDocuments!.isNotEmpty)
                          for (var document in stepProcess.requiredDocuments ?? [])
                            buildListTile(
                              context,
                              Icons.info_outline_rounded,
                              document.name ?? '',
                            )
                        else
                          buildEmptyListTile(context),
                        const Divider(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          Text(
                            "roadmap.description".tr,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            stepProcess.description,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
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

  ListTile buildEmptyListTile(BuildContext context) {
    return ListTile(
      title: Text("roadmap.required_empty".tr),
    );
  }
}
