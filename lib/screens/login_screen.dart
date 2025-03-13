
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import '../data/user_data.dart';
import 'package:url_launcher/url_launcher.dart';

//class UserData {
  //static String id = '';
  //static String password = '';
//}




class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}):super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();




  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically verify the credentials with your backend
      // For this example, we'll just set the UserData and navigate
      
      final UserData = Provider.of<UserDataProvider>(context, listen: false);
      UserData.setUserData(_emailController.text, _passwordController.text);


      // In a real app, you would typically not print the password
      // print("Login: Password set to ${UserData.password}");

      Navigator.of(context).pushNamedAndRemoveUntil('/calculator', (Route<dynamic> route) => false);
    } else {
      ('Please provide valid input');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        Navigator.of(context).pop();
                      },
                      child: Text("Back", style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                ),
            
                const SizedBox(height: 40),
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
                const SizedBox(height: 40),
                CustomTextField(
                  label: 'Email:',
                  isPassword: false,
                  controller: _emailController,
                  validator: (value){
                    return value == "" 
                        ?  'Please enter your Email'
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
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text("Forgot your Email or password?", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text('Register here!', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                                launchUrl(Uri.parse('https://t.me/Amrqhz'));
                                              },
                                            ),
                                            IconButton(
                                              icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                                              onPressed: () {
                                                // Open LinkedIn link
                                                launchUrl(Uri.parse('https://www.linkedin.com/in/yourhandle'));
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
                const Spacer(),
                TextButton(
                    onPressed: _login, 
                    child: const Text('Welcome 🫧', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                  ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}