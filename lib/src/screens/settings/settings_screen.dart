import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/helpers/navigation_helper.dart';
import 'package:stud_advice/src/common/controllers/theme_controller.dart';
import 'package:stud_advice/src/screens/legal_conditions/legal_conditions_screen.dart';

import 'package:stud_advice/src/screens/settings/widgets/settings_big_user_card.dart';
import 'package:stud_advice/src/screens/settings/widgets/settings_group.dart';

import 'widgets/settings_icon_style.dart';
import 'widgets/settings_item.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  static const String navigatorId = 'settings_screen';

  SettingsScreen({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
      print('Current Locale: ${Get.locale}');
      print('Current Translations: ${Get.translations}');
      print(Get.translations);
  print('Translation for welcome: ${'welcome'.tr}');
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // User card
          BigUserCard(
            userName: "Zack LonEly",
            userProfilePic: const AssetImage("assets/images/common/raven_image.png"),
            cardActionWidget: SettingsItem(
              icons: Icons.edit,
              iconStyle: IconStyle(
                withBackground: true,
                borderRadius: 50,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              // title: Text('account,
              title: Text("welcome".tr),
              subtitle: "Tap to change your data",
              onTap: () {
                debugPrint("Account :OK");
              },
            ),
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.accessible,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                title: Text('accesibility'.tr),
                // subtitle: "Ma",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.translate,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.green,
                ),
                title: Text('language'),
                // subtitle: "Ma",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.password,
                iconStyle: IconStyle(),
                title: Text('changePassword'),
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.black,
                ),
                title: Text('darkmode'),
                // subtitle: "Automatic",
                trailing: Obx(() => Switch.adaptive(
                      value: themeController.isDarkTheme.value,
                      onChanged: (value) {
                        themeController.toggleTheme(value);
                      },
                    )),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.flag,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.red,
                ),
                title: Text('support'),
              ),
              SettingsItem(
                onTap: () {
                // NavigationHelper().navigateTo(context, LegalTermsScreen());
                Get.to(LegalTermsScreen());
                },
                // icon for terms and conditions
                icons: Icons.description,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.blue,
                ),
                title: Text('conditions'),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.logout,
                iconStyle: IconStyle(),
                title: Text('logout'),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
