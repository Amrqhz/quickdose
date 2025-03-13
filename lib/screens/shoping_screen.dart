import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopingScreen extends StatefulWidget {
  const ShopingScreen({super.key});

  @override
  State<ShopingScreen> createState() => _ShopingScreenState();
}

class _ShopingScreenState extends State<ShopingScreen> {
  int selectedPlanIndex = 0; // Default to Pro Plan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Back", style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Pick your Plan",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              // Plan selection tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPlanTab("Free Plan", 0),
                  _buildPlanTab("Pro Plan", 1),
                  _buildPlanTab("Enterprise", 2),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Selected plan details
              _buildSelectedPlanDetails(),
              
              //const SizedBox(height: 20),
              
              // Feature cards grid
              // Expanded(
              //   child: GridView.count(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 15,
              //     crossAxisSpacing: 15,
              //     children: [
              //       _buildFeatureCard(
              //         "Unlimited Data, Calls, and Voice notes",
              //         Colors.pink.shade100,
              //         Colors.pink.shade200,
              //       ),
              //       _buildFeatureCard(
              //         "Fast international data roaming",
              //         Colors.blue.shade100,
              //         Colors.blue.shade200,
              //       ),
              //       _buildFeatureCard(
              //         "Full access additional",
              //         Colors.green.shade100,
              //         Colors.lime.shade300,
              //       ),
              //       _buildFeatureCard(
              //         "eSim protection and",
              //         Colors.blue.shade100,
              //         Colors.blue.shade200,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanTab(String title, int index) {
    bool isSelected = selectedPlanIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlanIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : const Color(0xFF000000),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedPlanDetails() {
    // Different plan details based on selection
    String title = "";
    String price = "";
    String time = "";
    List<String> features = [];
    Color startColor = Colors.blue.shade300;
    Color endColor = Colors.purple.shade300;

    switch (selectedPlanIndex) {
      case 0:
        title = "Free Plan";
        price = "Free";
        time = "Depends on your referal code";
        features = ["Basic Calculation", "Limited Drugs", "20 minutes per each referal code"];
        startColor = const Color.fromARGB(255, 65, 63, 63);
        endColor = Colors.grey.shade400;
        break;
      case 1:
        title = "Upgrade to Pro";
        price = "800/month";
        time = "Depends on your referal code";
        features = ["More than 20 drugs ", "Not only for Pediatrics"];
        startColor = const Color.fromARGB(255, 28, 76, 116);
        endColor = const Color.fromARGB(255, 204, 163, 211);
        break;
      case 2:
        title = "Enterprise Plan";
        price = "500/month";
        time = "Depends on your referal code";
        features = ["Custom Drug selection"];
        startColor = Colors.indigo.shade300;
        endColor = Colors.indigo.shade500;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            children: [ 
              Text(
                price,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15,),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],

          ),
          const SizedBox(height: 12),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                const Icon(Icons.circle, size: 8, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  feature,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          )),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () async {
              final url = "https://x.com/amrqhz";
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Unable to launch URL")),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Center(child: Text("Buy Now")),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, Color startColor, Color endColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}