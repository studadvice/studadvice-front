import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/supported_locales.dart';
import 'package:stud_advice/src/common/controllers/i18n_controller.dart';
import 'package:stud_advice/src/common/controllers/theme_controller.dart';
import 'package:stud_advice/src/common/helpers/navigation_helper.dart';
import 'package:stud_advice/src/screens/legal_terms/legal_terms_screen.dart';

import 'package:stud_advice/src/screens/settings/widgets/settings_big_user_card.dart';
import 'package:stud_advice/src/screens/settings/widgets/settings_group.dart';
import 'package:stud_advice/src/widgets/sheets/bottom_sheet_widget.dart';
import 'package:stud_advice/utils/custom_locale.dart';

import 'widgets/settings_icon_style.dart';
import 'widgets/settings_item.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  static const String navigatorId = '/settings_screen';
  static final ThemeController themeController = Get.find();
  static final I18n i18n = Get.find();

  const SettingsScreen({super.key});
  void showLanguageSettings() {
    Get.bottomSheet(
      BottomSheetWidget(
        items: [
          DropdownSearch<CustomLocale>(
            items: supportedLocales,
            onChanged: (CustomLocale? item) {
              i18n.changeLocale(item ?? i18n.getCurrentLocale, navigatorId);
            },
            selectedItem: i18n.getCurrentLocale,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(Get.context!).primaryColor,
              elevation: 1,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(i18n.text('close')),
          )
        ],
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // User card
          BigUserCard(
            userName: "User",
            userProfilePic:
                const AssetImage("assets/images/common/raven_image.png"), // TODO : change this
            cardActionWidget: SettingsItem(
              icons: Icons.edit,
              iconStyle: IconStyle(
                withBackground: true,
                borderRadius: 50,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              title: i18n.text('account'),
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
                title: i18n.text('accessibility'),
                // subtitle: "Ma",
              ),
              SettingsItem(
                onTap: () {
                  showLanguageSettings();
                },
                icons: Icons.translate,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.green,
                ),
                title: i18n.text('language'),
                // subtitle: "Ma",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.password,
                iconStyle: IconStyle(),
                title: i18n.text('changePassword'),
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.black,
                ),
                title: i18n.text('darkmode'),
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
                onTap: () {
                },
                icons: Icons.flag,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.red,
                ),
                title: i18n.text('support'),
              ),
              SettingsItem(
                onTap: () {
                  NavigationHelper.navigateTo(LegalTermsScreen.navigatorId);
                },
                // icon for terms and conditions
                icons: Icons.description,
                iconStyle: IconStyle(
                  iconsColor: AppColors.white,
                  withBackground: true,
                  backgroundColor: AppColors.blue,
                ),
                title: i18n.text('terms'),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.logout,
                iconStyle: IconStyle(),
                title: i18n.text('logout'),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
