import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterUserInformationScreen extends StatefulWidget {
  static const String navigatorId = '/register_user_information_screen';

  const RegisterUserInformationScreen({super.key});

  @override
  State<RegisterUserInformationScreen> createState() =>
      _RegisterUserInformationScreenState();
}

class _RegisterUserInformationScreenState
    extends State<RegisterUserInformationScreen> {
  final RegisterUserInformationController _registerUserInformationController =
      Get.put(RegisterUserInformationController());

  I18n i18n = Get.find<I18n>();

  // Controllers for the text fields.
  final TextEditingController pseudoController = TextEditingController(
    text: RegisterUserInformationController.generateRandomPseudo(),
  );
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController formationController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  // Model data.
  late UserData userData;
  late Future<List<String>> universityData;

  @override
  void initState() {
    super.initState();
    universityData = _registerUserInformationController.fetchUniversityData();
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    pseudoController.dispose();
    birthDateController.dispose();
    cityController.dispose();
    universityController.dispose();
    formationController.dispose();
    countryController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          i18n.text('screenTitle'),
          style: (const TextStyle(
            fontSize: AppFontSizes.large16,
            fontWeight: FontWeight.bold,
          )),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        // Wrap in a ListView to avoid overflow when the keyboard is displayed.
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          FutureBuilder<List<String>>(
              future: universityData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return buildRegisterUserInformationForm(snapshot.data!);
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.secondaryColor,
                    strokeWidth: 5,
                  ));
                }
              })
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
      hintText: i18n.text('pseudoHint'),
      labelText: i18n.text('pseudoLabel'),
      controller: pseudoController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return i18n.text('pseudoError');
        }
        return null;
      },
    );
  }

  Widget buildCityTextField() {
    return AutoCompleteTextField<CityData>(
      controller: cityController,
      labelText: i18n.text('cityLabel'),
      hintText: i18n.text('cityHint'),
      backgroundColor: AppColors.white,
      borderColor: AppColors.secondaryColor,
      focusedBorderColor: AppColors.secondaryColor,
      suggestionsCallback: (pattern) async {
        return await _registerUserInformationController
            .fetchCitiesFromAPI(pattern);
      },
      errorText: i18n.text('cityError'),
      notFoundText: i18n.text('cityNotFound'),
      noItemSelectedText: i18n.text('cityNotSelected'),
      itemBuilder: (suggestion) {
        return Text(suggestion.nom ?? '');
      },
    );
  }

  Widget buildPostalCodeDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: CustomAsyncDropdownSearch(
        labelText: i18n.text('postalCodeLabel'),
        backgroundColor: AppColors.white,
        borderColor: AppColors.secondaryColor,
        focusedBorderColor: AppColors.secondaryColor,
        asyncItems: (String filter) => _registerUserInformationController
            .fetchPostalCodesFromApi(cityController.text),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return i18n.text('postalCodeNotSelected');
          }
          return null;
        },
        onChanged: (String? selectedItem) {
          postalCodeController.text = selectedItem ?? '';
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
            child: Text(i18n.text('postalCodeNotFound'),
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
        controller: countryController,
        hintText: i18n.text('countryHint'),
        labelText: i18n.text('countryLabel'),
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildBirthDateTextField() {
    return DatePickerField(
      hintText: i18n.text('birthDateHint'),
      controller: birthDateController,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return i18n.text('birthDateError');
        }
        return null;
      },
    );
  }

  List<DropdownMenuItem<String>> buildUniversityDataItems(
      List<String> universityData) {
    if (!universityData.contains(i18n.text('defaultUniversityChoice'))) {
      universityData.insert(0, i18n.text('defaultUniversityChoice'));
    }
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
    if (!universityData.contains(i18n.text('defaultUniversityChoice'))) {
      universityData.insert(0, i18n.text('defaultUniversityChoice'));
    }
    return CustomSelectionModal(
      labelText: i18n.text('universityLabel'),
      hintText: i18n.text('universityHint'),
      itemsList: universityData,
      height: MediaQuery.of(context).size.height * 0.8,
      controller: universityController,
      defaultChoice: i18n.text('defaultUniversityChoice'),
      onItemSelected: (String selectedItem) {
        universityController.text = selectedItem;
      },
      searchHintText: i18n.text('universitySearchHint'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return i18n.text('universityError');
        }
        return null;
      },
    );
  }

  Widget buildFormationTextField() {
    return ClassicTextField(
      hintText: i18n.text('formationHint'),
      labelText: i18n.text('formationLabel'),
      controller: formationController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return i18n.text('formationError');
        }
        return null;
      },
    );
  }

  Widget buildNextButton() {
    return CustomButton(
        text: i18n.text('nextButton'),
        textColor: AppColors.white,
        backgroundColor: AppColors.blue,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            UserData userData = buildUserData();
            _registerUserInformationController.saveUserInformation(userData);
          }
        });
  }

  UserData buildUserData() {
    Map<String, dynamic> previousFormData = Get.arguments;

    String pseudo = pseudoController.text.trim();
    String birthDate = birthDateController.text.trim();
    String city = cityController.text.trim();
    String university = universityController.text.trim();
    String formation = formationController.text.trim();
    String country = countryController.text.trim();
    int postalCode = int.parse(postalCodeController.text.trim());

    return UserData(
      pseudo: pseudo,
      birthDate: birthDate,
      city: city,
      university: university,
      formation: formation,
      country: country,
      postalCode: postalCode,
      hasAcceptedTermsAndConditions: previousFormData[
              'hasAcceptedTermsAndConditions'] ??
          false, // HINT If the user has not accepted the terms and conditions, the default value is false.
    );
  }
}
