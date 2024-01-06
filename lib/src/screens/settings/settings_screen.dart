import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/screens/settings/support_screen.dart';
import 'package:stud_advice/stud_advice.dart';

import 'change_password_screen.dart';
import 'change_user_data_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const String navigatorId = '/settings_screen';
  final ThemeController themeController = Get.find();
  final I18n _i18n = Get.find();
  final SettingsController settingsController = Get.find();
  final UserStorageController userStorageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            FutureBuilder<BigUserCard>(
              future: buildUserCard(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Container(); // Handle error case
                  }
                  return snapshot.data ?? Container();
                } else {
                  return const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  );
                }
              },
            ),
            buildOptionsGroup(context),
            buildInfoGroup(),
            buildLogoutGroup(),
          ],
        ),
      ),
    );
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
          labelText: 'settings.language'.tr,
          backgroundColor: AppColors.white,
          borderColor: AppColors.primaryColor,
          focusedBorderColor: AppColors.primaryColor,
          items: supportedLocales,
          selectedItem: _i18n.getCurrentLocale,
          onChanged: (locale) {
            // TODO : checker l'async
            _i18n.changeLocale(locale ?? _i18n.getCurrentLocale);
            return null;
          },
          validator: (locale) {
            return null;
          },
          emptyBuilder: (context, searchEntry) {
            return Text('settings.noResult'.tr);
          },
          errorBuilder: (context, searchEntry, exception) {
            return Text('settings.error'.tr);
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
          labelText: 'settings.textSize'.tr,
          backgroundColor: AppColors.white,
          borderColor: AppColors.primaryColor,
          focusedBorderColor: AppColors.primaryColor,
          items: [
            'settings.small'.tr,
            'settings.medium'.tr,
            'settings.large'.tr,
          ],
          //selectedItem: i18n.getCurrentLocale,
          onChanged: (fontSize) {
            // TODO : checker l'async
            return null;
          },
          validator: (locale) {
            return null;
          },
          emptyBuilder: (context, searchEntry) {
            return Text('settings.noResult'.tr);
          },
          errorBuilder: (context, searchEntry, exception) {
            return Text('settings.error'.tr);
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
          title: 'settings.logout'.tr,
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
          onTap: () {
            Get.toNamed(SupportScreen.navigatorId);
          },
          icons: Icons.flag,
          iconStyle: IconStyle(
            iconsColor: AppColors.white,
            withBackground: true,
            backgroundColor: AppColors.red,
          ),
          title: 'settings.support'.tr,
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
            backgroundColor: AppColors.primaryColor,
          ),
          title: 'settings.terms'.tr,
        ),
      ],
    );
  }

  SettingsGroup buildOptionsGroup(BuildContext context) {
    return SettingsGroup(
      items: [
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
          title: 'settings.language'.tr,
          // subtitle: "Ma",
        ),
        SettingsItem(
          onTap: () {
            Get.toNamed(ChangePasswordScreen.navigatorId);
          },
          icons: Icons.password,
          iconStyle: IconStyle(),
          title: 'settings.changePassword'.tr,
        ),
        SettingsItem(
          onTap: () {},
          icons: Icons.dark_mode_rounded,
          iconStyle: IconStyle(
            iconsColor: AppColors.white,
            withBackground: true,
            backgroundColor: AppColors.black,
          ),
          title: 'settings.darkmode'.tr,
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

  Future<String> getCurrentUserPseudo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return await userStorageController.getPseudo(user.uid);
    }
    return "settings.unknownPseudo".tr;
  }

  Future<BigUserCard> buildUserCard(BuildContext context) async {
    String userId = userStorageController.getCurrentUserId();
    String pseudo = await userStorageController.getPseudo(userId);
    return BigUserCard(
      userName: pseudo,
      userProfilePic: const AssetImage("assets/images/common/raven_image.png"),
      cardActionWidget: SettingsItem(
        icons: Icons.edit,
        iconStyle: IconStyle(
          withBackground: true,
          borderRadius: 50,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        title: 'settings.account'.tr,
        subtitle: "Tap to change your data",
        onTap: () {
          Get.toNamed(ChangeUserDataScreen.navigatorId);
        },
      ),
    );
  }
}
