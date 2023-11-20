import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/controller/register/register_user_information_controller.dart';
import 'package:stud_advice/src/models/city/city_data.dart';
import 'package:stud_advice/src/models/user/user_data.dart';
import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';
import 'package:stud_advice/src/widgets/dropdowns/custom_dropdown_button.dart';
import 'package:stud_advice/src/widgets/modals/custom_selection_modal.dart';
import 'package:stud_advice/src/widgets/pickers/country_picker_field.dart';
import 'package:stud_advice/src/widgets/pickers/date_picker_field.dart';
import 'package:stud_advice/src/widgets/textFields/auto_complete_text_field.dart';
import 'package:stud_advice/src/widgets/textFields/classic_text_field.dart';

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

  // Use constants to facilitate the implementation of the translation.
  final String screenTitle = 'Veuillez renseigner les informations suivantes';
  final String pseudoHintText = 'Pseudo';
  final String pseudoErrorText = 'Veuillez renseigner votre pseudo';
  final String postalCodeHintText = 'Code Postal';
  final String postalCodeLabelText = 'Code Postal';
  final String birthDateHintText = 'Date de naissance';
  final String birthDateLabelText = 'Date de naissance';
  final String birthDateErrorText =
      'Veuillez renseigner votre date de naissance';
  final String cityHintText = 'Ville';
  final String cityLabelText = 'Ville';
  final String universityHintText = 'Université';
  final String universityDialogCloseText = 'Fermer';
  final String universitySearchHintText = 'Rechercher une université';
  final String countryHintText = 'Pays d\'origine';
  final String countryLabelText = 'Pays d\'origine';
  final String formationHintText = 'Formation';
  final String formationLabelText = 'Formation';
  final String formationErrorText = 'Veuillez renseigner votre formation';
  final String nextButtonText = 'Suivant';
  final String cityNotFoundText = 'Ville non trouvée';
  final String cityNotSelectedText = 'Veuillez sélectionner une ville';
  final String universityNotSelectedText =
      'Veuillez sélectionner une université';
  final String universityNotFound = 'Aucune université trouvée';
  final String defaultUniversityChoice = 'Autre';
  final String universityErrorText = 'Une erreur est survenue';
  final String cityErrorText = 'Une erreur est survenue';
  final String postalCodeErrorText = 'Une erreur est survenue';
  final String postalCodeNotFoundText =
      'Code postal non trouvé, veuillez sélectionner une ville.';
  final String postalCodeNotSelectedText =
      'Veuillez sélectionner un code postal';

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
          screenTitle,
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
      hintText: pseudoHintText,
      labelText: pseudoHintText,
      controller: pseudoController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return pseudoErrorText;
        }
        return null;
      },
    );
  }

  Widget buildCityTextField() {
    return AutoCompleteTextField<CityData>(
      controller: cityController,
      labelText: cityLabelText,
      hintText: cityHintText,
      backgroundColor: AppColors.white,
      borderColor: AppColors.secondaryColor,
      focusedBorderColor: AppColors.secondaryColor,
      suggestionsCallback: (pattern) async {
        return await _registerUserInformationController
            .fetchCitiesFromAPI(pattern);
      },
      errorText: universityErrorText,
      notFoundText: cityNotFoundText,
      noItemSelectedText: cityNotSelectedText,
      itemBuilder: (suggestion) {
        return Text(suggestion.nom ?? '');
      },
    );
  }

  Widget buildPostalCodeDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: CustomDropdownSearch(
        labelText: postalCodeLabelText,
        backgroundColor: AppColors.white,
        borderColor: AppColors.secondaryColor,
        focusedBorderColor: AppColors.secondaryColor,
        asyncItems: (String filter) => _registerUserInformationController
            .fetchPostalCodesFromApi(cityController.text),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return postalCodeNotSelectedText;
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
            child: Text(postalCodeNotFoundText,
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
        hintText: countryHintText,
        labelText: countryLabelText,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildBirthDateTextField() {
    return DatePickerField(
      hintText: birthDateHintText,
      controller: birthDateController,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return birthDateErrorText;
        }
        return null;
      },
    );
  }

  List<DropdownMenuItem<String>> buildUniversityDataItems(
      List<String> universityData) {
    if (!universityData.contains(defaultUniversityChoice)) {
      universityData.insert(0, defaultUniversityChoice);
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
    if (!universityData.contains(defaultUniversityChoice)) {
      universityData.insert(0, defaultUniversityChoice);
    }
    return CustomSelectionModal(
      labelText: universityHintText,
      hintText: universityHintText,
      itemsList: universityData,
      height: MediaQuery.of(context).size.height * 0.8,
      controller: universityController,
      defaultChoice: defaultUniversityChoice,
      onItemSelected: (String selectedItem) {
        universityController.text = selectedItem;
      },
      searchHintText: universitySearchHintText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return universityNotSelectedText;
        }
        return null;
      },
    );
  }

  Widget buildFormationTextField() {
    return ClassicTextField(
      hintText: formationHintText,
      labelText: formationLabelText,
      controller: formationController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return formationErrorText;
        }
        return null;
      },
    );
  }

  Widget buildNextButton() {
    return DefaultConnectionButton(
        text: nextButtonText,
        textColor: AppColors.white,
        backgroundColor: AppColors.blue,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            UserData userData = buildUserData();
            debugPrint(
              userData.toJson().toString(),
            );
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
      email: previousFormData['email'] ?? '',
      passwordHash: previousFormData['hashedPassword'] ?? '',
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
