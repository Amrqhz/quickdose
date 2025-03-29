import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}):super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // If not using Provider:
        await _apiService.login(
          _emailController.text,
          _passwordController.text,
        );
        
        // Then check the active subscription
        final subscription = await _apiService.getActiveSubscription();
        
        // Check if subscription is expired
        if (_isSubscriptionExpired(subscription)) {
          // Show subscription expired dialog
          await _showSubscriptionExpiredDialog();
          return;
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );
        ('Attempting navigation to calculator');
        Navigator.pushReplacementNamed(context, '/calculator').then((_){
          ('Navigation completed');
        });
        
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
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
  
  // Helper method to check if subscription is expired
  bool _isSubscriptionExpired(Map<String, dynamic> subscription) {
    // Parse the subscription end date
    final endDate = DateTime.parse(subscription['end_date']);
    
    // Check if the end date is before the current date
    return endDate.isBefore(DateTime.now());
  }

  // Method to show subscription expired dialog
  Future<void> _showSubscriptionExpiredDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Subscription Expired',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Your subscription has expired.',
                  style: GoogleFonts.roboto(),
                ),
                SizedBox(height: 10),
                Text(
                  'Please renew your subscription to continue using the app.',
                  style: GoogleFonts.roboto(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Renew Subscription',
                style: GoogleFonts.roboto(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                // Navigate to subscription renewal page
                Navigator.of(context).pushNamed('/subscription');
              },
            ),
            TextButton(
              child: Text(
                'Logout',
                style: GoogleFonts.roboto(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                // Logout the user
                _apiService.logout();
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use resizeToAvoidBottomInset to prevent keyboard from causing overflow
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          // Add this to dismiss keyboard when tapping outside input fields
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            // Make the scroll view adjust to keyboard
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
                // Add extra padding at the bottom to account for keyboard
                bottom: 20.0 + MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Builder(
                    //     builder: (BuildContext context) => TextButton(
                    //       onPressed: () {
                    //         Navigator.of(context).pop();
                    //       },
                    //       child: Text("Back", style: TextStyle(fontSize: 16, color: Colors.black)),
                    //     ),
                    //   ),
                    // ),
                
                    const SizedBox(height: 30),
                    const Icon(
                      Icons.lock_outline,
                      size: 48,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'HELLO AGAIN',
                      style: GoogleFonts.roboto(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Welcome back, you've been missed!",
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      label: 'Email:',
                      isPassword: false,
                      controller: _emailController,
                      validator: (value){
                        return value == "" 
                            ? 'Please enter your Email'
                            : null;
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
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text("Forgot password?", 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text('Register here!', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (BuildContext context) => TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/about");
                              },
                              child: Text("About Us", 
                                style: TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                )
                              ),
                            ),
                          ),
                          Text("|"),
                          Builder(
                            builder: (BuildContext context) => TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Get in Touch",
                                              style: GoogleFonts.roboto(fontSize: 18 , fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  icon: const FaIcon(FontAwesomeIcons.twitter),
                                                  onPressed: () {
                                                    launchUrl(Uri.parse('https://x.com/amrqhz'));
                                                  },
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.telegram),
                                                  onPressed: () {
                                                    // Open Telegram link
                                                    launchUrl(Uri.parse('https://t.me/amrqhz'));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text("Contact US", 
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : TextButton(
                          onPressed: _login, 
                          child: const Text('Welcome 🫧', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),)
                        ),
                    // Add bottom padding to ensure content is visible when keyboard is open
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom > 0 ? 200 : 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}