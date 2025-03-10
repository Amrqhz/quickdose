import '../models/drug.dart';

final List<Drug> drugs = [


  Drug(
    name: "Acetaminophen",
    dosageform: "Syr",
    concentration: "120mg/5ml",
    calculationType: "weightBased",
    parameters: {
      "dosePerKg": 15.0, // 15mg per kg
      "maxDose": 1000.0, // 1000mg maximum
      "frequency": 6, // every 6 hours
    },
    //forms: ["شربت", "قرص"],
    note: "بیشتر از 4 دوز در طی 24 ساعت مصرف نگردد",
  ),

  Drug(
    name: "Acetaminophen(parakid)",
    concentration: "100mg/1ml", 
    dosageform: "Syr", 
    calculationType: "weightDivision",
    parameters: {
      "divisor": 2.0,
      "maxDose": 4000.0,
      "frequency":8,
    },
  ),


  Drug(
    name: "Amoxicillin",
    concentration: "125mg/5ml",
    calculationType: "weightBased",
    dosageform: "Susp",
    parameters: {
      "dosePerKg": 25.0, // 25mg per kg
      "maxDose": 1000.0, // 500mg maximum
      "frequency": 8, // every 8 hours
    },
    //note: "",
  ),

  Drug(
    name: "Amoxicillin (فارنژیت، سینوزیت)",
    dosageform: "Syr",
    concentration: "250mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 3.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 8, // every 6 hours
    },
  ),
                                                                      
  Drug(                 
    name: "Amoxicillin (AOM)",
    dosageform: "Susp",
    concentration: "250mg/5ml",
    calculationType: "weightBased",
    parameters: {
      "dosePerKg": 80.0, // 25mg per kg
      "maxDose": 1000.0, // 500mg maximum
      "frequency": 12, // every 8 hours
    },
  ),
  Drug(
    name: "Ampicillin",
    dosageform: "Susp",
    concentration: "125mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 2.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 6, // every 6 hours
    },
  ),
  Drug(
    name: "Co-Amoxiclav",
    dosageform: "Syr",
    concentration: "156mg/5ml",
    calculationType: "volumebased",
    parameters: {
      "volume": 1.6,
      "ds": 3.0, // 
      "frequency": 8, // every 6 hours
    },
    note: "در روز اول دو برابر دوز مصرف گردد"
  ),

  Drug(
    name: "Azithromycin",
    dosageform: "Syr",
    concentration: "100mg/5ml",
    calculationType: "volumebased",
    parameters: {
      "volume": 0.25,
      "ds": 3.0, // 
      "frequency": 8, // every 6 hours
    },
    note: "در روز اول دو برابر دوز مصرف گردد"
  ),
  Drug(
    name: "Azithromycin",
    dosageform: "Syr",
    concentration: "200mg/5ml",
    calculationType: "weightBased",
    parameters: {
      "dosePerKg": 10.0, //10mg/kg
      "frequency": 24,
      "maxDose": 500.0, //daily
    },
    note: "در روز اول، دو برابر دوز مصرف شود",
  ),
  Drug(
    name: "Cefixime",
    dosageform: "Susp",
    concentration: "100mg/5ml",
    calculationType: "volumebased",
    parameters: {
      "volume": 0.2,
      "ds": 2.0, // 
      "frequency": 12, // every 6 hours
    },
    note: "در روز اول دو برابر دوز مصرف گردد"
  ),

  Drug(
    name: "Cephalexin",
    dosageform: "Syr",
    concentration: "125mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 2.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 6, // every 6 hours
    },
  ),
  Drug(
    name: "Cephalexin",
    dosageform: "Syr",
    concentration: "250mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 4.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 6, // every 6 hours
    },
  ),

  Drug(
    name: "Dextromethorphan",
    dosageform: "Syr",
    concentration: "15mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 10.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 6, // every 6 hours
    },
    
  ),
  Drug(
    name: "Diphenhydramine",
    dosageform: "Syr",
    concentration: "12.5mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 2.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 6, // every 6 hours
    },
    
    note: "در درمان OTC طول دوره درمان با استامینوفن در نوزادان 3 روز و در نوجوانان 5 روز است.",
  ),
  Drug(
    name: "Diphenhydramine Compound",
    dosageform: "Syr",
    concentration: "12.5mg/5ml",
    calculationType: "standard",
  ),

  Drug(
    name: "EXPECTORANT",
    dosageform: "Syr",
    concentration: "100mg/2mg/30mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 6.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 8, // every 6 hours
    },
  ),
  Drug(
    name: "Hydroxizine TDS",
    dosageform: "Syr",
    concentration: "10mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 3.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 8, // every 6 hours
    },
  ),
  Drug(
    name: "Hydroxizine BD",
    dosageform: "Syr",
    concentration: "10mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 2.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 12, // every 6 hours
    },
  ),

  Drug(
    name: "Ibuprofen",
    dosageform: "Syr",
    concentration: "100mg/5ml",
    calculationType: "weightAndAge",
    parameters: {
      "childDosePerKg": 10.0, // 10mg per kg for children
      "adultDose": 400.0, // 400mg for adults
      "minAge": 3, // minimum age in years
      "frequency": 8, // every 8 hours
    },
    note: "همراه با غذا مصرف گردد. در موارد خونریزی گوارشی همراه با پنتاپرازول یا امپرازول تجویز گردد",
  ),
  Drug(
    name: "Ketotifen",
    dosageform: "Syr",
    concentration: "1mg/5ml",
    calculationType: "standard",
    note: "در روز اول دو برابر دوز مصرف گردد"
  ),
  Drug(
    name: "Lactolose",
    dosageform: "Syr",
    concentration: "10g/15ml",
    calculationType: "standard",
    //dosageCalculation: "weight/4",
    note: "میتوان تا حجم 60 میلی لیتر در روز افزایش داد",
    //forms: ["شربت", "قرص"],
  ),
  Drug(
    name: "Pedilact",
    dosageform: "Syr",
    concentration: "10g/15ml",
    calculationType: "standard",
    //dosageCalculation: "weight/4",
    parameters: {
      "minAge": 2,
    },
    //forms: ["شربت", "قرص"],
  ),

  Drug(
    name: "Pediatric Grippe",
    dosageform: "Syr",
    concentration: "0.67mg/10ml",
    calculationType: "standard",
    note: "در روز اول دو برابر دوز مصرف گردد"
  ),

  Drug(
    name: "Promethzine",
    dosageform: "Syr",
    concentration: "5mg/5ml",
    calculationType: "weightDivision",
    parameters: {
      "divisor": 10.0, // 
      "maxDose": 4000.0, // 1000mg maximum
      "frequency": 6, // every 6 hours
    },
  ),
  // Add more drugs as needed
];
