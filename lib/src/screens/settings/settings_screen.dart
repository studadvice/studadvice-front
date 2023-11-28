import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/supported_locales.dart';
import 'package:stud_advice/src/common/helper/navigation_helper.dart';
import 'package:stud_advice/src/controllers/common/i18n_controller.dart';
import 'package:stud_advice/src/controllers/common/theme_controller.dart';
import 'package:stud_advice/src/screens/legal_terms/legal_terms_screen.dart';
// import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';

import 'package:stud_advice/src/screens/settings/widgets/settings_big_user_card.dart';
import 'package:stud_advice/src/screens/settings/widgets/settings_group.dart';
import 'package:stud_advice/src/utils/custom_locale.dart';
import 'package:stud_advice/src/widgets/common/dropdowns/custom_dropdown.dart';
import 'package:stud_advice/src/widgets/sheets/bottom_sheet_widget.dart';

import 'widgets/settings_icon_style.dart';
import 'widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  static const String navigatorId = '/settings_screen';
  static final ThemeController themeController = Get.find();
  static final I18n i18n = Get.find();

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // User card
          buildUserCard(context),
          buildOptionsGroup(context),
          buildInfoGroup(),
          buildLogoutGroup(),
        ],
      ),
    ));
  }

  void showLanguageSettings() {
    Get.bottomSheet(
      buildLanguageSheet(),
      isScrollControlled: true,
    );
  }

  void showAccessibilitySettings() {
    Get.bottomSheet(
      buildAccessibilitySheet(),
      isScrollControlled: true,
    );
  }

  BottomSheetWidget buildLanguageSheet() {
    return BottomSheetWidget(
      ratioPerItem: 200.0,
      items: [
        CustomDropdownSearch<CustomLocale>(
          labelText: i18n.text('language'),
          backgroundColor: AppColors.white,
          borderColor: AppColors.secondaryColor,
          focusedBorderColor: AppColors.secondaryColor,
          items: supportedLocales,
          selectedItem: i18n.getCurrentLocale,
          onChanged: (locale) {
            // TODO : checker l'async
            i18n.changeLocale(locale ?? i18n.getCurrentLocale, navigatorId);
            return null;
          },
          validator: (locale) {
            return null;
          },
          emptyBuilder: (context, searchEntry) {
            return Text(i18n.text('noResult'));
          },
          errorBuilder: (context, searchEntry, exception) {
            return Text(i18n.text('error'));
          },
        ),
        // DefaultConnectionButton(
        //     text: i18n.text('close'),
        //     textColor: Theme.of(Get.context!).textTheme.bodyLarge!.color ??
        //         AppColors.white,
        //     backgroundColor: backgroundColor,
        //     onPressed: () {
        //       Get.back();
        //     }),
      ],
    );
  }

  BottomSheetWidget buildAccessibilitySheet() {
    return BottomSheetWidget(
      ratioPerItem: 200.0,
      items: [
        CustomDropdownSearch<String>(
          labelText: i18n.text('textSize'),
          backgroundColor: AppColors.white,
          borderColor: AppColors.secondaryColor,
          focusedBorderColor: AppColors.secondaryColor,
          items: [i18n.text('small'), i18n.text('medium'), i18n.text('large')],
          //selectedItem: i18n.getCurrentLocale,
          onChanged: (fontSize) {
            // TODO : checker l'async
            debugPrint('accessibility changed');
            return null;
          },
          validator: (locale) {
            return null;
          },
          emptyBuilder: (context, searchEntry) {
            return Text(i18n.text('noResult'));
          },
          errorBuilder: (context, searchEntry, exception) {
            return Text(i18n.text('error'));
          },
        ),
        // DefaultConnectionButton(
        //     text: i18n.text('close'),
        //     textColor: Theme.of(Get.context!).textTheme.bodyLarge!.color ??
        //         AppColors.white,
        //     backgroundColor: backgroundColor,
        //     onPressed: () {
        //       Get.back();
        //     }),
      ],
    );
  }

  SettingsGroup buildLogoutGroup() {
    return SettingsGroup(
      items: [
        SettingsItem(
          onTap: () {
            // TODO : offAll to login screen
          },
          icons: Icons.logout,
          iconStyle: IconStyle(
            iconsColor: AppColors.white,
            withBackground: true,
            backgroundColor: AppColors.red,
          ),
          title: i18n.text('logout'),
          titleStyle: const TextStyle(
              color: AppColors.red, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  SettingsGroup buildInfoGroup() {
    return SettingsGroup(
      items: [
        SettingsItem(
          onTap: () {},
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
    );
  }

  SettingsGroup buildOptionsGroup(BuildContext context) {
    return SettingsGroup(
      items: [
        SettingsItem(
          onTap: () {
            showAccessibilitySettings();
          },
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
    );
  }

  BigUserCard buildUserCard(BuildContext context) {
    return BigUserCard(
      userName: "User",
      userProfilePic: const AssetImage(
          "assets/images/common/raven_image.png"), // TODO : change this
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
    );
  }
}
