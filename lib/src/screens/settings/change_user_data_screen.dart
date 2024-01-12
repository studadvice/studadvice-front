import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stud_advice/stud_advice.dart';

class ChangeUserDataScreen extends StatefulWidget {
  static const String navigatorId = '/change_user_data_screen';

  const ChangeUserDataScreen({super.key});

  @override
  State<ChangeUserDataScreen> createState() => _ChangeUserDataScreenState();
}

class _ChangeUserDataScreenState extends State<ChangeUserDataScreen> {
  final RegisterUserInformationController _registerUserInformationController =
      Get.find();

  // Controllers for the text fields.
  final TextEditingController pseudoController = TextEditingController(
    text: RegisterUserInformationController.generateRandomPseudo(),
  );
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _formationController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  // Model data.
  List<String> universityData = [];

  @override
  void initState() {
    super.initState();
    final getLocalStorage = GetStorage();
    var locale = Get.locale;
    final fileLocale = '${locale?.languageCode}_${locale?.countryCode}';
    final universities = getLocalStorage.read('universities_$fileLocale');

    if (universities != null) {
      universityData = universities.cast<String>();
    }
    if (!universityData.contains('register.defaultUniversityChoice'.tr)) {
      universityData.insert(0, 'register.defaultUniversityChoice'.tr);
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    pseudoController.dispose();
    _birthDateController.dispose();
    _cityController.dispose();
    _universityController.dispose();
    _formationController.dispose();
    _countryController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'register.screenTitle'.tr,
          style: (const TextStyle(
            fontSize: AppFontSizes.large16,
            fontWeight: FontWeight.bold,
          )),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        // Wrap in a ListView to avoid overflow when the keyboard is displayed.
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          buildRegisterUserInformationForm(universityData),
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget buildRegisterUserInformationForm(List<String> universityData) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            buildPseudoTextField(),
            const SizedBox(height: 10),
            buildCityTextField(),
            const SizedBox(height: 10),
            buildPostalCodeDropdown(),
            const SizedBox(height: 10),
            buildCountryTextField(),
            const SizedBox(height: 10),
            buildBirthDateTextField(),
            const SizedBox(height: 10),
            buildUniversityTextField(universityData),
            const SizedBox(height: 10),
            buildFormationTextField(),
            const SizedBox(height: 50),
            buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget buildPseudoTextField() {
    return ClassicTextField(
      hintText: 'register.pseudoHint'.tr,
      labelText: 'register.pseudoLabel'.tr,
      controller: pseudoController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.primaryColor,
      borderColor: AppColors.primaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'register.pseudoError'.tr;
        }
        return null;
      },
    );
  }

  Widget buildCityTextField() {
    return AutoCompleteTextField<CityData>(
      controller: _cityController,
      labelText: 'register.cityLabel'.tr,
      hintText: 'register.cityHint'.tr,
      backgroundColor: AppColors.white,
      borderColor: AppColors.primaryColor,
      focusedBorderColor: AppColors.primaryColor,
      suggestionsCallback: (pattern) async {
        return await _registerUserInformationController
            .fetchCitiesFromAPI(pattern);
      },
      errorText: 'register.cityError'.tr,
      notFoundText: 'register.cityNotFound'.tr,
      noItemSelectedText: 'register.cityNotSelected'.tr,
      itemBuilder: (suggestion) {
        return Text(suggestion.nom ?? '');
      },
    );
  }

  Widget buildPostalCodeDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: CustomAsyncDropdownSearch(
        labelText: 'register.postalCodeLabel'.tr,
        backgroundColor: AppColors.white,
        borderColor: AppColors.primaryColor,
        focusedBorderColor: AppColors.primaryColor,
        asyncItems: (String filter) => _registerUserInformationController
            .fetchPostalCodesFromApi(_cityController.text),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'register.postalCodeNotSelected'.tr;
          }
          return null;
        },
        onChanged: (String? selectedItem) {
          _postalCodeController.text = selectedItem ?? '';
          return null;
        },
        errorBuilder: (context, postalCodeErrorText, reload) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(postalCodeErrorText,
                style: const TextStyle(
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
        emptyBuilder: (context, reload) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text('register.postalCodeNotFound'.tr,
                style: const TextStyle(
                    fontSize: AppFontSizes.medium,
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
      ),
    );
  }

  Widget buildCountryTextField() {
    return CountryPickerField(
        controller: _countryController,
        hintText: 'register.countryHint'.tr,
        labelText: 'register.countryLabel'.tr,
        focusedBorderColor: AppColors.primaryColor,
        borderColor: AppColors.primaryColor);
  }

  Widget buildBirthDateTextField() {
    return DatePickerField(
      hintText: 'register.birthDateHint'.tr,
      controller: _birthDateController,
      focusedBorderColor: AppColors.primaryColor,
      borderColor: AppColors.primaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'register.birthDateError'.tr;
        }
        return null;
      },
    );
  }

  List<DropdownMenuItem<String>> buildUniversityDataItems(
      List<String> universityData) {
    return universityData.map((element) {
      return DropdownMenuItem<String>(
        value: element,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            element,
            style: const TextStyle(
              fontSize: AppFontSizes.medium,
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget buildUniversityTextField(List<String> universityData) {
    return CustomSelectionModal(
      labelText: 'register.universityLabel'.tr,
      hintText: 'register.universityHint'.tr,
      itemsList: universityData,
      height: MediaQuery.of(context).size.height * 0.8,
      controller: _universityController,
      onItemSelected: (String selectedItem) {
        _universityController.text = selectedItem;
      },
      searchHintText: 'register.universitySearchHint'.tr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'register.universityError'.tr;
        }
        return null;
      },
    );
  }

  Widget buildFormationTextField() {
    return ClassicTextField(
      hintText: 'register.formationHint'.tr,
      labelText: 'register.formationLabel'.tr,
      controller: _formationController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.primaryColor,
      borderColor: AppColors.primaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'register.formationError'.tr;
        }
        return null;
      },
    );
  }

  Widget buildNextButton() {
    return CustomButton(
        text: 'setting.change_data.done'.tr,
        textColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (_formKey.currentState!.validate()) {
            UserData userData = buildUserData();
            _registerUserInformationController.saveUserInformation(userData);
          }
        });
  }

  UserData buildUserData() {
    String pseudo = pseudoController.text.trim();
    String birthDate = _birthDateController.text.trim();
    String city = _cityController.text.trim();
    String university = _universityController.text.trim();
    String formation = _formationController.text.trim();
    String country = _countryController.text.trim();
    int postalCode = int.parse(_postalCodeController.text.trim());

    return UserData(
      pseudo: pseudo,
      birthDate: birthDate,
      city: city,
      university: university,
      formation: formation,
      country: country,
      postalCode: postalCode,
      hasAcceptedTermsAndConditions:
          true, // The user by login with a social account has already accepted the terms and conditions.
    );
  }
}
