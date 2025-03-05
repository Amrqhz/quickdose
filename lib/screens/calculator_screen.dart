import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/drug.dart';
import '../data/drugs_data.dart';
import 'package:provider/provider.dart';
import '../data/user_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';


Future<void> _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}



class UserData {
  static String email = '';
  static String password = '';
}



class CalculatorScreen extends StatefulWidget{
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Drug? selectedDrug;
  String? selectedForm;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String? result;
  final TextEditingController searchController = TextEditingController();
  List<Drug> filteredDrugs = [];

   @override
  void initState() {
    super.initState();
    filteredDrugs = List.from(drugs); // Initialize with all drugs
    searchController.addListener(_filterDrugs);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterDrugs);
    searchController.dispose();
    super.dispose();
  }
  void _filterDrugs() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredDrugs = drugs
          .where((drug) => drug.name.toLowerCase().startsWith(query))
          .toList();
    });
  }



  // Dosage form tag
  Color getDosageFormColor(String dosageform) {
    switch (dosageform) {
      case 'Syr':
        return Color(0xFF67B639); // Green
      case 'Tab':
        return Color(0xFFE74C3C); // Red
      case 'Inj':
        return Color(0xFF3498DB); // Blue
      case 'Susp':
        return Color(0xFFF39C12); // Orange
      case 'Drops':
        return Color(0xFF9B59B6); // Purple
      case 'cream':
      case 'Oint':
        return Color(0xFF34495E); // Dark Blue Grey
      default:
        return Color.fromARGB(255, 166, 160, 149); // Grey (default)
    }
  }



  //  subscription tracking
  final int totalDays = 30; // Total subscription days
  final int remainingDays = 12; // Days remaining (you should get this from your backend)

  double get subscriptionPercentage => remainingDays / totalDays;



  // drug dose calculation
  void calculateDose() {
    if (selectedDrug == null || weightController.text.isEmpty || ageController.text.isEmpty) {
      setState(() {
        result = "لطفا یک دارو را انتخاب کرده و یک مقدار درستی از دوز و وزن را وارد کنید";
      });
      return;
    }

    final weight = double.tryParse(weightController.text);
    final age = double.tryParse(ageController.text);

    if (weight == null || age == null) {
      setState(() {
        result = "لطفا یک دارو را انتخاب کرده و یک مقدار درستی از دوز و وزن را وارد کنید";
      });
      return;
    }

    try {
      String doseResult = "";
      // Dose Calculation Logic
      switch (selectedDrug!.calculationType) {
        


        //1-standard        
        case "standard":
          // Original calculation logic
          //double dose;
          //if (selectedDrug!.concentration == "100") {
            //dose = weight / 4;
          //} else if (selectedDrug!.concentration == "200") {
          //  dose = weight / 8;
          //} //else {
            //throw Exception("Invalid concentration");
          //}
          //doseResult = "هر 24 ساعت ${dose.toStringAsFixed(1)} سی سی مصرف شود";
          switch (selectedDrug!.name){
            case "Lactolose":
            doseResult = "هر 24 ساعت 15سی سی مصرف گردد";
            break;
            case "2":
            doseResult = "8mg TDS";
            break;
            case "Diphenhydramine Compound":
            if (age <= 5){
              doseResult = " 2.5 سی سی هر 4 ساعت";
            } else if (age >=6 && age <= 12){
              doseResult = "5 سی سی هر 4 ساعت";
            }
            break;
            case "Pedilact":
            doseResult = "روزانه 5 قطره ";
            break;
            case "Acetaminophen":
            doseResult= "هر 8 ساعت 325 میلی گرم مصرف میگردد.";
            break;


            default:
              throw Exception("No standard dose defined for ${selectedDrug!.name}");
          }
          break;





        //2-WeightDivision shows how many cc in total day by division of weight to a specific divisior
        case "weightDivision":
          final params = selectedDrug!.parameters!;
          double divisor = params["divisor"];
          double maxDose = params ["maxDose"]; 
          int frequency = params ["frequency"];

          double dose = weight / divisor;
          doseResult = "هر $frequency ساعت ${dose.toStringAsFixed(1)} سی سی مصرف شود ";

          if (dose > maxDose){
            dose = maxDose;
          }

          break;





        //3-weightBased, it's just multiplie weight with dose per kilograms
        case "weightBased":
          final params = selectedDrug!.parameters!;
          double dosePerKg = params['dosePerKg'];
          double maxDose = params['maxDose'];
          int frequency = params['frequency'];
        
          double calculatedDose = weight * dosePerKg;
          if (calculatedDose > maxDose) {
            calculatedDose = maxDose;
          }
        
        // Convert to ml based on concentration
          String concentration = selectedDrug!.concentration;
        // Extract numbers from concentration string (e.g., "120mg/5ml" -> 120 and 5)
          final RegExp regExp = RegExp(r'(\d+)mg/(\d+)ml');
          final Match? match = regExp.firstMatch(concentration);

          if (match != null) {
            double mgPerMl = double.parse(match.group(1)!) / double.parse(match.group(2)!);
            double mlDose = calculatedDose / mgPerMl;
          
            doseResult = "${mlDose.toStringAsFixed(1)}ml every $frequency hours\n"
                        "Total dose: ${calculatedDose.toStringAsFixed(1)}mg";
          }
          break;



        //4-weight and age, it's related to both weight and age if the drug has min age contraindications
        case "weightAndAge":
          final params = selectedDrug!.parameters!;
        
          if (age < params['minAge']) {
            throw "بیمار دارای حداقل سن لازم برای مصرف داروی انتخاب شده نمیباشد.";
          }
        
          double dose;
          if (age < 12) {
            // Child dosing
            double dosePerKg = params['childDosePerKg'];
            dose = weight * dosePerKg;
          } else {
            // Adult dosing
            dose = params['adultDose'].toDouble();
          }
        
          int frequency = params['frequency'];
        
          // Convert to ml similar to weightBased calculation
          String concentration = selectedDrug!.concentration;
          final RegExp regExp = RegExp(r'(\d+)mg/(\d+)ml');
          final Match? match = regExp.firstMatch(concentration);
        
          if (match != null) {
            double mgPerMl = double.parse(match.group(1)!) / double.parse(match.group(2)!);
            double mlDose = dose / mgPerMl;
          
            doseResult = "${mlDose.toStringAsFixed(1)}ml every $frequency hours\n"
                        "Total dose: ${dose.toStringAsFixed(1)}mg";
          }
          break;

        default:
          throw Exception("! لطفا دوباره سعی کنید");
      }

      setState(() {
        result = doseResult;
        if (selectedDrug?.note != null) {
          result = "$result\n${selectedDrug?.note}";
        }
      });
    
    } catch (e) {
      setState(() {
        result = " ${e.toString()}";
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context);


    if (userData.id.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return Container();
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 30.0),
          children: <Widget>[
            Icon(Icons.account_circle, size: 80,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Divider(
                color: Color(0xFF90A4AE),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.verified_user_sharp),
              title: const Text('I D' ,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle:  Text(UserData.email),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('P A S S W O R D',style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle:  Text(UserData.password),

              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Your account status',style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('$remainingDays days remaining'),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: subscriptionPercentage,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        subscriptionPercentage > 0.3 
                            ? Colors.green 
                            : Colors.red
                      ),
                      minHeight: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(subscriptionPercentage * 100).toInt()}% remaining',
                    style: TextStyle(
                      color: subscriptionPercentage > 0.3 
                          ? Colors.green 
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
                        ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('Any QUESTIONS?',style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacementNamed(context, "/about");
              },
            ),

            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 70),
              child: Row(
                children: [
                  Text("Theme Mode", style: TextStyle(fontWeight: FontWeight.bold),),
                  CupertinoSwitch(
                    value: Provider.of<UserDataProvider>(context).isDarkMode, 
                    onChanged: (value){
                      Provider.of<UserDataProvider>(context, listen: false).isDarkMode = value;
                    },
                  ),
                ],
              ),
            ),




            //ListTile(
              //leading: const Icon(Icons.settings),
              //title: const Text('S E T T I N G S',style: TextStyle(fontWeight: FontWeight.bold)),
              //onTap: () {
                //Navigator.pop(context); // Close the drawer
              //},
            //),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Divider(
                color: Color(0xFF90A4AE),
              ),
            ),
            
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('L O G O U T', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // Clear user data
                UserData.email = '';
                UserData.password = '';
                // Navigate to login screen
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),

          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_basket_outlined),
                      onPressed: (){
                        Navigator.pushNamed(context, "/shoping");
                      },
                    ),

                    IconButton(
                      icon: const Icon(Icons.person_outline),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    
                  ],
                ),
                const SizedBox(height: 30),

                //make change to show a searchable dropdown 
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Autocomplete<Drug>(
                    displayStringForOption: (Drug option) => option.name,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Drug>.empty();
                      }
                      return drugs.where((Drug option) {
                        return option.name
                            .toLowerCase()
                            .startsWith(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (Drug selection) {
                      setState(() {
                        selectedDrug = selection;
                        selectedForm = null;
                      });
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextFormField(
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Choose a drug',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<Drug> onSelected,
                        Iterable<Drug> options) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          child: Container(
                            width: 300,
                             // Set the width as needed
                            constraints: BoxConstraints(
                              maxHeight: 300,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Drug option = options.elementAt(index);
                                return GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: ListTile( 
                                    dense: true,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    title: Text(option.name,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                              option.concentration,
                                              style:
                                                  const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)
                                          ),
                                          SizedBox(width: 20,),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: getDosageFormColor(option.dosageform),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              option.dosageform,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'weight(Kg)',
                      labelStyle: TextStyle(color: Colors.black54),
                      alignLabelWithHint: false,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Age(years old)',
                      labelStyle: TextStyle(color: Colors.black54),
                      alignLabelWithHint: false,
                      floatingLabelAlignment: FloatingLabelAlignment.center
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: calculateDose,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF67B639),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w900),
                  ),
                ),
                if (result != null)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      result!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const Spacer(),
                //Image.asset(
                  //'assets/doctors.png',
                  //height: 80,
                //),
                const Text(
                  'Join the community',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('🫧 !Tell your friends about us'),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    IconButton(
                      icon:  Icon(Icons.telegram, size: 15),
                      onPressed: () => _launchURL('https://t.me/amrqhz'),
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.twitter, size: 15),
                      onPressed: () => _launchURL("https://x.com/amrqhz"),
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      icon: Icon(Icons.share, size: 15),
                      onPressed: (){
                        Share.share("check out this awesome app: https://yourlink.com");
                      },
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}