import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/drug.dart';
import '../data/drugs_data.dart';
// Removed Provider import
import 'package:provider/provider.dart';
import '../data/user_data.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/api_service.dart';
import '../models/user.dart';

Future<void> _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

class CalculatorScreen extends StatefulWidget{
  const CalculatorScreen({super.key});
  

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final ApiService _apiService = ApiService();
  User? _user;
  Subscription? _subscription;
  bool _isLoading = true;
  bool _isSubscriptionExpanded = false;
 // Simple state for theme without provider

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
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      
      final userData = await _apiService.getUserInfo();
      ('User info received: $userData');
      
      // Check if the widget is still mounted before setting state
      if (!mounted) return;
      
      setState(() {
        _user = User.fromJson(userData);
      });

      try {

        final subData = await _apiService.getActiveSubscription();
        // Check if the widget is still mounted before setting state
        if (!mounted) return;
        
        setState(() {
          _subscription = Subscription.fromJson(subData);
        });
      } catch (e) {
        ('No active subscription found: $e');
      }
    } catch (e) {
      // Check if the widget is still mounted before showing SnackBar
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load user data: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.pushReplacementNamed(context, '/login');
    } finally {
      ('Loading data completed');
      
      // Check if the widget is still mounted before setting state
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _logout() async {
    try {
      await _apiService.logout();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to logout: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    searchController.removeListener(_filterDrugs);
    searchController.dispose();
    weightController.dispose();
    ageController.dispose();
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
      case 'Elixir':
        return Color.fromARGB(255, 182, 57, 130); // Green
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

// Add these methods instead:
int get totalDays {
  if (_subscription == null) return 1; // Avoid division by zero
  final start = DateTime.parse(_subscription!.startDate);
  final end = DateTime.parse(_subscription!.endDate);
  return end.difference(start).inDays;
}

int get remainingDays {
  if (_subscription == null) return 0;
  final end = DateTime.parse(_subscription!.endDate);
  final now = DateTime.now();
  return end.difference(now).inDays;
}

double get subscriptionPercentage {
  if (totalDays <= 0) return 0.0; // Avoid division by zero
  double percentage = remainingDays / totalDays;
  // Ensure the percentage is between 0 and 1
  return percentage.clamp(0.0, 1.0);
}

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
            case "Ketotifen":
              if (age<=2){
                doseResult = "2.5cc هر 12 ساعت مصرف گردد";
              } else if (age>2) {
                doseResult = "5 cc هر 12 ساعت مصرف گردد";
              }
              break;
            case "Pediatric Grippe":
              if (age<=6){
                doseResult = "4 cc هر 8 ساعت مصرف گردد";
              } else if (age>2) {
                doseResult = "8 cc هر 8 ساعت مصرف گردد";
              }
              break;
            default:
              throw Exception("No standard dose defined for ${selectedDrug!.name}");
          }
          break;

        //2-volumebased
        case "volumebased":
          final params = selectedDrug!.parameters!;
          double volume = params["volume"];
          double ds = params ["ds"];          
          int frequency = params ["frequency"];

          double dose = weight * volume / ds;
          doseResult = "هر $frequency ساعت ${dose.toStringAsFixed(1)} سی سی مصرف شود ";
          break;
        
        //2.1-weightDivision
        case "weightDivision":
          final params = selectedDrug!.parameters!;
          double divisor = params["divisor"];
          double maxDose = params ["maxDose"];   
          int frequency = params ["frequency"];
         
          double dose = weight / divisor;
          if (dose > maxDose){
            dose = maxDose;
          }
          doseResult = "هر $frequency ساعت ${dose.toStringAsFixed(1)} سی سی مصرف شود ";
          break;

        //3-weightBased
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

        //4-weight and age
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
          throw ("برای داروی فوق محاسبه ای صورت نمیگیرد");
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

  String _formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator while loading data
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Loading data...'),
            ],
          ),
        ),
      );
    }
    
    // If no user is loaded, there's likely an authentication issue
    if (_user == null) {
      // Delay navigation to prevent build errors
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return Scaffold(body: Center(child: Text("Redirecting to login...")));
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 20.0),
          children: <Widget>[
            Icon(Icons.account_circle, size: 60,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Divider(
                color: Color(0xFF90A4AE),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.verified_user_sharp),
              title: const Text('I D',style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(_user?.username ?? 'user', style: TextStyle( fontWeight: FontWeight.w600),),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('E M A I L',style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(_user?.email ?? '', style: TextStyle( fontWeight: FontWeight.w600),),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Your account status', style: TextStyle(fontWeight: FontWeight.bold)),
              initiallyExpanded: _isSubscriptionExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  _isSubscriptionExpanded = expanded;
                });
              },
              children: [
                _subscription != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Card(
                          //color: const Color.fromARGB(134, 186, 186, 186),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Center(child: Text('$remainingDays days remaining out of $totalDays', style: TextStyle(fontWeight: FontWeight.w700),)),
                                const SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: subscriptionPercentage,
                                    backgroundColor: Colors.grey[300],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      subscriptionPercentage > 0.2 
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
                                    color: subscriptionPercentage > 0.2 
                                        ? Colors.green 
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Divider(
                                    color: Color.fromARGB(167, 0, 0, 0),
                                  ),
                                ),                
                                Center(child: Text('Plan: ${_subscription!.planType}', style: TextStyle(fontWeight: FontWeight.bold))),
                                SizedBox(height: 8),
                                Center(child: Text('Start Date: ${_formatDate(_subscription!.startDate)}')),
                                SizedBox(height: 8),
                                Center(child: Text('End Date: ${_formatDate(_subscription!.endDate)}')),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Divider(
                                    color: Color.fromARGB(167, 0, 0, 0),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Status: ${_subscription!.isActive ? 'Active' : 'Inactive'}',
                                    style: TextStyle(
                                      color: _subscription!.isActive ? Colors.green : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('No active subscription found.'),
                          ),
                        ),
                      ),
              ],
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
              padding: const EdgeInsets.only(left: 50.0, top: 20),
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

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Divider(
                color: Color(0xFF90A4AE),
              ),
            ),
            
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('L O G O U T', style: TextStyle(fontWeight: FontWeight.bold)),
              onLongPress: _logout,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Long press to logout'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //IconButton(
                      Icon(Icons.shopping_cart),
                      // onPressed: (){
                      //   Navigator.pushNamed(context, "/shoping");
                      // },
                      
                    //),
                    
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
                  width: 340,
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
                        decoration: InputDecoration(
                          hintText: 'Choose a drug',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          suffixIcon: fieldTextEditingController.text.isNotEmpty
                              ? Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        offset: const Offset(3, 3),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(-3, -3),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white70,
                                        Colors.grey.shade300,
                                      ],
                                    ),
                                  ),
                                  child: IconButton(
                                    constraints: const BoxConstraints(
                                      minWidth: 28,
                                      minHeight: 28,
                                    ),
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.clear, size: 18, color: Colors.black54),
                                    onPressed: () {
                                      fieldTextEditingController.clear();
                                      setState(() {
                                        selectedDrug = null;
                                        selectedForm = null;
                                      });
                                    },
                                  ),
                                )
                              : null,
                        ),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        onChanged: (value) {
                          // Force rebuild to show/hide the clear button
                          setState(() {});
                        },
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
                            width: 230,
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
                  width: 340,
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
                      hintText: 'weight(Kg)',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 340,
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
                      hintText: 'Age(years old)',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 70, right: 70),
                  child: Divider(),
                ),
                if (result != null)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      result!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: Divider(),
                ),
                const Spacer(),
                const Text(
                  'Join the community',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('🫧 !Tell your friends about us', style: TextStyle(fontWeight: FontWeight.w800),),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    IconButton(
                      icon: Icon(Icons.telegram, size: 17),
                      onPressed: () => _launchURL('https://t.me/TA_pharmacy'),
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.twitter, size: 17),
                      onPressed: () => _launchURL("https://x.com/amrqhz"),
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