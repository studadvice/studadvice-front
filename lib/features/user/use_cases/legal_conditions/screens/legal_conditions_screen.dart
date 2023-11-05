import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_fonts_sizes.dart';

class LegalTermsScreen extends StatelessWidget {
  static const String navigatorId = 'legal_terms_screen';
  static const String screenTitle = "Termes et Conditions";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(screenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '''
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas justo in justo malesuada, et consequat justo tincidunt. Integer fermentum, neque non varius consectetur, libero quam cursus erat, a vehicula sem sem eu nisi. In hendrerit justo sed urna lacinia efficitur. Vestibulum sed est non libero lacinia imperdiet. Vivamus in turpis vestibulum, elementum urna non, fringilla erat. Vestibulum viverra sapien vel quam elementum, in posuere lectus tincidunt. Vestibulum eu vulputate leo. Quisque hendrerit, metus eu tristique egestas, dui lectus varius libero, quis tristique justo nisi id sapien. Nulla cursus luctus turpis non tristique. Integer tempus tortor a libero posuere congue. Proin ut ligula elit. Morbi at libero ut ipsum volutpat auctor.
          
          Nullam ac lectus quis erat luctus rhoncus non in massa. Quisque vitae massa et ipsum viverra eleifend. Vivamus hendrerit euismod mauris, a tristique libero facilisis sed. Sed a turpis a nulla volutpat auctor. Sed ut est ac odio volutpat scelerisque. Phasellus lacinia erat in urna facilisis, id hendrerit arcu fermentum. Nulla eget urna sed felis iaculis hendrerit. Nam vel purus sed ex semper iaculis. Donec a auctor dolor. Vestibulum cursus suscipit dui in lacinia. Nulla facilisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer viverra enim vel tincidunt lacinia. Nullam vestibulum rhoncus congue. Sed dapibus velit nec odio aliquam ultricies.
          
          Sed sit amet tortor vel odio congue pellentesque. Quisque a orci in metus sodales interdum sit amet a justo. Vivamus tincidunt, odio vel facilisis pharetra, ante urna eleifend purus, ut sollicitudin odio felis a metus. Vivamus congue, odio in aliquet iaculis, urna neque feugiat orci, et vehicula metus neque id sapien. Sed nec dolor eget risus scelerisque fringilla. Sed hendrerit tellus et dolor vehicula, ut volutpat erat vestibulum. Suspendisse potenti. Curabitur eleifend, dolor in sollicitudin tristique, urna ligula varius urna, ut hendrerit libero metus ac sapien. Fusce vehicula semper purus ac semper. Fusce interdum urna non augue auctor, nec feugiat ex consectetur. Vivamus vel ante at quam eleifend tempus. Suspendisse feugiat a felis vel sollicitudin. Duis ut sapien id ligula facilisis rhoncus.
          ''',
          style: TextStyle(fontSize: AppFontSizes.medium),
        ),
      ),
    );
  }
}
