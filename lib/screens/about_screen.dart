import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';


Future<void> _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

class AboutScreen extends StatelessWidget{
  const AboutScreen ({super.key});

  @override
Widget build(BuildContext context){
  return Scaffold(
    body: SingleChildScrollView(
      child: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Builder(
                  builder: (BuildContext context) => TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text("Back", style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ),
      
              //Image(
                //image: AssetImage("assets/doctors.png")
              //),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("About us  🫧",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      Text("Welcome to the Dose Calculator App, your essential tool for precision in OTC therapy. Our innovative application empowers pharmacists to calculate accurate drug doses tailored to each patient's unique profile. Simply input the patient's age and weight, and let our app do the rest. We've designed this tool to streamline your decision-making process, whether you're consulting in a pharmacy or working in other healthcare settings. By providing quick, reliable dosage calculations, we aim to enhance your efficiency and confidence in recommending OTC medications. The Dose Calculator App is more than just a tool – it's your partner in delivering personalized, safe, and effective patient care. \nJoin us in revolutionizing OTC therapy management and experience the future of pharmaceutical practice at your fingertips.",
                        style: TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          IconButton(
                            icon:  Icon(Icons.telegram, size: 20),
                            onPressed: () => _launchURL('https://t.me/TA_pharmacy'),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.email, size: 20),
                            onPressed: () => _launchURL("https://x.com/amrqhz"),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.share, size: 20),
                            onPressed: (){
                              Share.share("check out this awesome app: https://yourlink.com");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )
  );
}
}