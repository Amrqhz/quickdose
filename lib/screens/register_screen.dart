import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_text_field.dart';
import '../services/api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;

  // Plan selection
  int selectedPlanIndex = 0; // Default to free Plan
  final List<String> planTypes = ["free", "pro", "enterprise"];
  final List<String> planNames = ["Free Plan", "Pro Plan", "Enterprise"];
  final List<String> planDescriptions = [
    "• Basic Calculation \n• Limited Drugs \n• 20 minutes per each referal code",
    "• More than 50 drugs \n• Pediatrics and Adults \n• Any types of dosageform \n• Based on IRC-FDA drug list \n• Advanced features with priority support",
    "• More than 50 drugs \n• Pediatrics and Adults \n• Any types of dosageform \n• Based on IRC-FDA drug list \n• Advanced features with priority support"
  ];


  // Duration selection
  int selectedDuration = 1; // Default to 1 month
  final List<int> durations = [1, 3, 6, 12]; // Duration options in months

  final ApiService _apiService = ApiService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _apiService.registerUser(
          _emailController.text,
          _usernameController.text,
          _passwordController.text,
          planTypes[selectedPlanIndex],
          selectedDuration,
        );
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful! Please login.'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to the next screen upon successful registration
        Navigator.pushReplacementNamed(context, '/login');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration failed: ${e.toString()}"),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  
  void _showDurationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Subscription Duration"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: durations.map((months) {
              return ListTile(
                title: Text("$months ${months == 1 ? 'Month' : 'Months'}"),
                subtitle: months > 1
                    ? Text("Save ${(months * 5)}% compared to monthly")
                    : null,
                leading: Radio<int>(
                  value: months,
                  groupValue: selectedDuration,
                  activeColor: const Color(0xFF67B639),
                  onChanged: (int? value) {
                    setState(() {
                      selectedDuration = value!;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                onTap: () {
                  setState(() {
                    selectedDuration = months;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPlanCard(int index) {
    bool isSelected = selectedPlanIndex == index;
    final String duration = "$selectedDuration ${selectedDuration == 1 ? 'Month' : 'Months'}";
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlanIndex = index;
        });
      },
      child: Container(
        width: 95,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(
          //   color: isSelected ? const Color(0xFF67B639) : Colors.grey[300]!,
          //   width: 2,
          // ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              planNames[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: isSelected ? Colors.black : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              duration,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[900],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF67B639),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: _showDurationDialog,
        icon: const Icon(Icons.schedule, size: 18),
        label: Text(
          "Duration: $selectedDuration ${selectedDuration == 1 ? 'Month' : 'Months'}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF67B639),
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Builder(
                      builder: (BuildContext context) => TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text("Back", style: TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                    ),
                  ),
                  Image.asset("./assets/register2.png"),
                  // const Icon(
                  //   Icons.app_registration,
                  //   size: 48,
                  // ),
                  const SizedBox(height: 10),
                  Text(
                    'Register',
                    style: GoogleFonts.roboto(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    label: 'Email:',
                    isPassword: false,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Password:',
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 4 ){
                        return 'password must be at least 4 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'ID:',
                    isPassword: false,
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  
                  // New plan selection section
                  Container(
                    width: 400, //double.infinity,
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Pick your plan",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Choose the plan that works best for you",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildPlanCard(0),
                            _buildPlanCard(1),
                            _buildPlanCard(2),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Divider(
                            color: Color(0xFF90A4AE),
                          ),
                        ),
                        // Plan description
                        Container(
                          width: 300,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            //border: Border.all(color: const Color(0xFF67B639)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    planNames[selectedPlanIndex],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                planDescriptions[selectedPlanIndex],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 30),
                              _buildDurationButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('I am a member !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('Go to login page', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),                
                  ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF67B639),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: _isLoading 
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}