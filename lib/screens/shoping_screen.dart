import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopingScreen extends StatefulWidget {
  const ShopingScreen({super.key});

  @override
  State<ShopingScreen> createState() => _ShopingScreenState();
}

class _ShopingScreenState extends State<ShopingScreen> {
  int selectedPlanIndex = 0; // Default to free Plan
  int selectedDurationIndex = 0; // Default to first duration option
  
  // Duration options
  final List<String> durationOptions = ["1 month","3 months", "6 months", "12 months"];
  final List<int> durationValues = [1, 3, 6, 12];

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
          // Reset duration selection when changing plans
          selectedDurationIndex = 0;
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
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
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
        
        // Calculate price based on duration with discounts
        int months = durationValues[selectedDurationIndex];
        double monthlyPrice = 100.0;
        double discount = 0;
        
        if (months == 6) discount = 0.05;
        if (months == 12) discount = 0.15;
        
        double totalPrice = monthlyPrice * months * (1 - discount);
        
        price = totalPrice.toStringAsFixed(0);
        time = durationOptions[selectedDurationIndex];
        if (discount > 0) {
          time += " (${(discount * 100).toInt()}% off)";
        }
        
        features = ["More than 50 drugs ", "Pediatrics and Adults", "Any types of dosageform", "Based on IRC-FDA drug list"];
        startColor = const Color.fromARGB(255, 28, 76, 116);
        endColor = const Color.fromARGB(255, 204, 163, 211);
        break;
      case 2:
        title = "Enterprise Plan";
        
        // Calculate price based on duration with discounts
        int months = durationValues[selectedDurationIndex];
        double monthlyPrice = 200.0;
        double discount = 0;
        
        if (months == 6) discount = 0.05;
        if (months == 12) discount = 0.15;
        
        double totalPrice = monthlyPrice * months * (1 - discount);
        
        price = "\$${totalPrice.toStringAsFixed(0)}";
        time = durationOptions[selectedDurationIndex];
        if (discount > 0) {
          time += " (${(discount * 100).toInt()}% off)";
        }
        
        features = ["Custom Drug selection", "More than 50 drugs ", "Pediatrics and Adults", "Any types of dosageform", "Based on IRC-FDA drug list"];
        startColor = const Color.fromARGB(255, 216, 64, 84);
        endColor = const Color.fromARGB(255, 203, 121, 155);
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
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          
          // Only show duration selection for paid plans (inside the card)
          if (selectedPlanIndex > 0) 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select subscription period:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      durationOptions.length,
                      (index) => _buildDurationChip(index),
                    ),
                  ),
                ],
              ),
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
              final url = "https://t.me/amrqhz";
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
            child: const Center(child: Text("Buy Now", style: TextStyle(fontWeight: FontWeight.w600))),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDurationChip(int index) {
    bool isSelected = selectedDurationIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDurationIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          durationOptions[index],
          style: TextStyle(
            color: isSelected ? startColorForPlan(selectedPlanIndex) : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
  
  // Helper method to get start color for the selected plan
  Color startColorForPlan(int planIndex) {
    switch (planIndex) {
      case 1:
        return const Color.fromARGB(255, 28, 76, 116);
      case 2:
        return const Color.fromARGB(255, 89, 216, 64);
      default:
        return const Color.fromARGB(255, 65, 63, 63);
    }
  }
}