import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class SettingsScreen extends StatelessWidget {
  static const String navigatorId = '/settings_screen';
  final ThemeController themeController = Get.find();
  final I18n _i18n = Get.find();
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
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
          labelText: _i18n.text('language'),
          backgroundColor: AppColors.white,
          borderColor: AppColors.secondaryColor,
          focusedBorderColor: AppColors.secondaryColor,
          items: supportedLocales,
          selectedItem: _i18n.getCurrentLocale,
          onChanged: (locale) {
            // TODO : checker l'async
            _i18n.changeLocale(locale ?? _i18n.getCurrentLocale, navigatorId);
            return null;
          },
          validator: (locale) {
            return null;
          },
          emptyBuilder: (context, searchEntry) {
            return Text(_i18n.text('noResult'));
          },
          errorBuilder: (context, searchEntry, exception) {
            return Text(_i18n.text('error'));
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
          labelText: _i18n.text('textSize'),
          backgroundColor: AppColors.white,
          borderColor: AppColors.secondaryColor,
          focusedBorderColor: AppColors.secondaryColor,
          items: [
            _i18n.text('small'),
            _i18n.text('medium'),
            _i18n.text('large')
          ],
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
            return Text(_i18n.text('noResult'));
          },
          errorBuilder: (context, searchEntry, exception) {
            return Text(_i18n.text('error'));
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
            settingsController.logout();
          },
          icons: Icons.logout,
          iconStyle: IconStyle(
            iconsColor: AppColors.white,
            withBackground: true,
            backgroundColor: AppColors.red,
          ),
          title: _i18n.text('logout'),
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
          title: _i18n.text('support'),
        ),
        SettingsItem(
          onTap: () {
            Get.toNamed(LegalTermsScreen.navigatorId);
          },
          // icon for terms and conditions
          icons: Icons.description,
          iconStyle: IconStyle(
            iconsColor: AppColors.white,
            withBackground: true,
            backgroundColor: AppColors.blue,
          ),
          title: _i18n.text('terms'),
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
          title: _i18n.text('accessibility'),
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
          title: _i18n.text('language'),
          // subtitle: "Ma",
        ),
        SettingsItem(
          onTap: () {},
          icons: Icons.password,
          iconStyle: IconStyle(),
          title: _i18n.text('changePassword'),
        ),
        SettingsItem(
          onTap: () {},
          icons: Icons.dark_mode_rounded,
          iconStyle: IconStyle(
            iconsColor: AppColors.white,
            withBackground: true,
            backgroundColor: AppColors.black,
          ),
          title: _i18n.text('darkmode'),
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
        title: _i18n.text('account'),
        subtitle: "Tap to change your data",
        onTap: () {
          debugPrint("Account :OK");
        },
      ),
    );
  }
}
