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

//  Drug(
//    name: "ACETAMINOPHEN",
//    concentration: "100 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  ),
//  Drug(
//    name: "ACETAMINOPHEN",
//    concentration: "160 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  ),
//  Drug(
//    name: "ACETAMINOPHEN / CHLORPHENIRAMINE / DEXTROMETHORPHAN / PHENYLEPHRINE",
//    concentration: "160 mg/1 mg/5 mg/2.5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ACETAMINOPHEN / DIPHENHYDRAMINE / PHENYLEPHRINE",
//    concentration: "160 mg/12.5 mg/2.5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ACETAMINOPHEN / GUAIFENESIN / PHENYLEPHRINE",
//    concentration: "125 mg/50 mg/2.5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ACICLOVIR",
//    concentration: "200 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ACICLOVIR",
//    concentration: "200 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ADULT COLD PREPARATIONS (1-4)",
//    concentration: "650 mg/10 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ADULT COLD PREPARATIONS (4-12)",
//    concentration: "650 mg/10 mg/25 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ADULT COLD PREPARATIONS (4-13)",
//    concentration: "500 mg/10 mg/4 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ADULT COLD PREPARATIONS (5-4)",
//    concentration: "650 mg/20 mg/10 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ALENDRONATE (AS SODIUM)",
//    concentration: "70 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ALUMINIUM HYDROXIDE / MAGNESIUM HYDROXIDE",
//    concentration: "225 mg/200 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ALUMINIUM HYDROXIDE / MAGNESIUM HYDROXIDE",
//    concentration: "564 mg/174 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "AMOXICILLIN",
//    concentration: "500 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "AMOXICILLIN",
//    concentration: "200 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "AMOXICILLIN",
//    concentration: "400 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "AZITHROMYCIN",
//    concentration: "2 g",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "AZITHROMYCIN",
//    concentration: "100 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "AZITHROMYCIN",
//    concentration: "1 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "BACLOFEN",
//    concentration: "5 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "BARIUM SULFATE",
//    concentration: "1 g",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "BELLADONNA PB",
//    concentration: "19.4 ug/6.5 ug/103.7 ug/16.2 mg",
//    dosageform: "Elixir",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "BETAINE",
//    concentration: "1 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "BILASTINE",
//    concentration: "",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "C-14 UREA",
//    concentration: "1 mCi",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CAFFEINE (AS CITRATE)",
//    concentration: "10 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CARBAMAZEPINE",
//    concentration: "100 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CEFIXIME",
//    concentration: "50 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CEFUROXIME (AS AXETIL)",
//    concentration: "250 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CEFUROXIME (AS AXETIL)",
//    concentration: "125 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CETIRIZINE HYDROCHLORIDE",
//    concentration: "1 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHARCOAL ACTIVATED",
//    concentration: "200 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLORAL HYDRATE",
//    concentration: "50 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLORAMPHENICOL",
//    concentration: "30 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLOROQUINE",
//    concentration: "10 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLOROQUINE",
//    concentration: "5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLOROQUINE (AS PHOSPHATE)",
//    concentration: "50 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLOROQUINE PHOSPHATE",
//    concentration: "80 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLORPHENIRAMINE / DEXTROMETHORPHAN / PHENYLEPHRINE",
//    concentration: "2 mg/15 mg/5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHLORPHENIRAMINE MALEATE",
//    concentration: "2 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHOLERA VACCINE INACTIVATED",
//    concentration: "",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CHOLESTYRAMINE",
//    concentration: "4 g",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CIMETIDINE",
//    concentration: "200 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CIPROFLOXACIN",
//    concentration: "50 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CITALOPRAM",
//    concentration: "40 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CLARITHROMYCIN",
//    concentration: "250 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CLARITHROMYCIN",
//    concentration: "125 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CLINDAMYCIN (AS PALMITATE HYDROCHLORIDE)",
//    concentration: "75 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CLOBAZAM",
//    concentration: "2.5 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CO-AMOXICLAV",
//    concentration: "125 mg/31.25 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CO-AMOXICLAV",
//    concentration: "250 mg/62.5 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CO-AMOXICLAV",
//    concentration: "250 mg/62.5 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CO-AMOXICLAV",
//    concentration: "125 mg/31.25 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CO-AMOXICLAV",
//    concentration: "400 mg/57 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CO-AMOXICLAV",
//    concentration: "200 mg/28.5 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CODEINE PHOSPHATE / GUAIFENESIN",
//    concentration: "7.5 mg/225 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CODEINE PHOSPHATE / GUAIFENESIN",
//    concentration: "8 mg/200 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CODEINE PHOSPHATE / GUAIFENESIN",
//    concentration: "10 mg/100 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CODEINE PHOSPHATE / GUAIFENESIN / PHENYLEPHRINE",
//    concentration: "10 mg/100 mg/5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "CYPROHEPTADINE HYDROCHLORIDE",
//    concentration: "2 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DESLORATADINE",
//    concentration: "2.5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXAMETHASONE",
//    concentration: "0.5 mg",
//    dosageform: "Elixir",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN / GUAIFENESIN",
//    concentration: "5 mg/100 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN / GUAIFENESIN / PHENYLEPHRINE",
//    concentration: "15 mg/350 mg/10 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN / GUAIFENESIN / PHENYLEPHRINE",
//    concentration: "20 mg/100 mg/10 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN / GUAIFENESIN / PHENYLEPHRINE",
//    concentration: "30 mg/200 mg/10 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN / GUAIFENESIN / PHENYLEPHRINE",
//    concentration: "10 mg/100 mg/5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN / GUAIFENESIN / PSEUDOEPHEDRINE",
//    concentration: "15 mg/200 mg/30 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN / PSEUDOEPHEDRINE",
//    concentration: "15 mg/30 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DEXTROMETHORPHAN HYDROBROMIDE",
//    concentration: "4 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DICYCLOMINE HYDROCHLORIDE",
//    concentration: "10 mg",
//    dosageform: "Elixir",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DIGOXIN",
//    concentration: "0.5 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DIHYDROTACHYSTEROL",
//    concentration: "1 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DIHYDROTACHYSTEROL",
//    concentration: "0.25 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DIPHENHYDRAMINE / AMMONIUM CHLORIDE",
//    concentration: "12.5 mg/125 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DOMPERIDONE",
//    concentration: "1 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "DOMPERIDONE (AS MALEATE)",
//    concentration: "1 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "EFAVIRENZ",
//    concentration: "30 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "EXPECTORANT",
//    concentration: "100 mg/2 mg/30 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "EXPECTORANT CODEINE",
//    concentration: "100 mg/30 mg/10 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "FAMOTIDINE",
//    concentration: "40 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "FEXOFENADINE HYDROCHLORIDE",
//    concentration: "30 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "FLUCONAZOLE",
//    concentration: "40 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "FLUCONAZOLE",
//    concentration: "10 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "FOSFOMYCIN (AS TROMETAMOL)",
//    concentration: "3 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "FURAZOLIDONE",
//    concentration: "50 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "FUROSEMIDE",
//    concentration: "40 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "GALANTAMINE (AS HYDROBROMIDE)",
//    concentration: "4 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "GLYCERIN",
//    concentration: "100 %",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "GUAIFENESIN",
//    concentration: "100 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "GUAIFENESIN / CHLORPHENIRAMINE / PHENYLEPHRINE",
//    concentration: "100 mg/2 mg/5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "IBUPROFEN",
//    concentration: "40 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "IOPAMIDOL",
//    concentration: "300 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "IPECAC",
//    concentration: "0.14 %",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "IRON",
//    concentration: "25 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "KETOTIFEN (AS FUMARATE)",
//    concentration: "1 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "KETOTIFEN (AS FUMARATE)",
//    concentration: "1 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "L-CARNITINE",
//    concentration: "100 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LACOSAMIDE",
//    concentration: "10 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LACTULOSE",
//    concentration: "10 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LACTULOSE",
//    concentration: "10 g",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LAMIVUDINE",
//    concentration: "10 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LAMOTRIGINE",
//    concentration: "10 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LEVAMISOLE",
//    concentration: "40 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LEVETIRACETAM",
//    concentration: "100 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LEVOCETIRIZINE DIHYDROCHLORIDE",
//    concentration: "",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LEVOFLOXACIN",
//    concentration: "",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LEVOTHYROXINE SODIUM",
//    concentration: "20 ug",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LINEZOLID",
//    concentration: "100 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LOPERAMIDE HYDROCHLORIDE",
//    concentration: "1 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LOPINAVIR / RITONAVIR",
//    concentration: "80 mg/20 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "LORATADINE",
//    concentration: "5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "MAGNESIUM HYDROXIDE",
//    concentration: "8 %",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "MEGESTROL ACETATE",
//    concentration: "40 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "MEGLUMINE COMPOUND",
//    concentration: "66 %/10 %",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "MEMANTINE HYDROCHLORIDE",
//    concentration: "10 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "MEMANTINE HYDROCHLORIDE",
//    concentration: "2 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "METFORMIN HYDROCHLORIDE",
//    concentration: "500 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "METHADONE HYDROCHLORIDE",
//    concentration: "25 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "METHADONE HYDROCHLORIDE",
//    concentration: "5 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "METOCLOPRAMIDE HYDROCHLORIDE",
//    concentration: "4 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "METRONIDAZOLE (AS BENZOATE)",
//    concentration: "125 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "MIDAZOLAM",
//    concentration: "2 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "NALIDIXIC ACID",
//    concentration: "300 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "NAPROXEN",
//    concentration: "",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "NEOMYCIN SULFATE",
//    concentration: "125 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "NEVIRAPINE",
//    concentration: "50 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "NITROFURANTOIN",
//    concentration: "25 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "NYSTATIN",
//    concentration: "100000 [iU]",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "OMEPRAZOLE",
//    concentration: "2 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "OMEPRAZOLE",
//    concentration: "20 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "OMEPRAZOLE / SODIUM BICARBONATE",
//    concentration: "20 mg/1680 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "OMEPRAZOLE / SODIUM BICARBONATE",
//    concentration: "40 mg/1680 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ONDANSETRON",
//    concentration: "4 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ORS",
//    concentration: "",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "OSELTAMIVIR (AS PHOSPHATE)",
//    concentration: "30 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "OSELTAMIVIR (AS PHOSPHATE)",
//    concentration: "60 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "OTHER COLD PREPARATIONS",
//    concentration: "650 mg/10 mg/20 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PAROMOMYCIN",
//    concentration: "125 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PEDIATRIC GRIPPE",
//    concentration: "0.67 mg/10 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PENICILLIN V (AS POTASSIUM)",
//    concentration: "125 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PENICILLIN V (AS POTASSIUM)",
//    concentration: "250 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PENICILLIN V BENZATHINE",
//    concentration: "200000 [iU]",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PENICILLIN V BENZATHINE",
//    concentration: "400000 [iU]",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PERAMPANEL",
//    concentration: "0.5 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PHENOBARBITAL",
//    concentration: "15 mg",
//    dosageform: "ELIXIR",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PHENYLEPHRINE / CHLORPHENIRAMINE",
//    concentration: "1 mg/2.5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PHENYTOIN",
//    concentration: "30 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PHENYTOIN",
//    concentration: "125 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PIPERAZINE",
//    concentration: "750 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PIRACETAM",
//    concentration: "20 %",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PIRACETAM",
//    concentration: "33.33 %",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "POLYETHYLENE GLYCOL - ELECTROLYTE",
//    concentration: "13.125 g/0.3508 g/0.1786 g/0.0502 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "POLYETHYLENE GLYCOL - ELECTROLYTE 1",
//    concentration: "13.125 g/0.3507 g/0.1785 g/0.0466 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "POLYETHYLENE GLYCOL - ELECTROLYTE 2",
//    concentration: "17.6 mmol/1.46 g/1.68 g/0.745 g/5.68 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "POSACONAZOLE",
//    concentration: "40 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "POTASSIUM CHLORIDE",
//    concentration: "20 meq",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "POTASSIUM CHLORIDE",
//    concentration: "40 meq",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PREDNISOLONE (AS SODIUM PHOSPHATE)",
//    concentration: "15 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PRIMIDONE",
//    concentration: "125 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PRIMIDONE",
//    concentration: "125 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PRIMIDONE",
//    concentration: "250 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PRIMIDONE",
//    concentration: "50 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PROMETHAZINE",
//    concentration: "5 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PROPRANOLOL HYDROCHLORIDE",
//    concentration: "4.28 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PSEUDOEPHEDRINE HYDROCHLORIDE",
//    concentration: "30 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PYRANTEL",
//    concentration: "250 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "PYRVINIUM",
//    concentration: "50 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "RANITIDINE",
//    concentration: "75 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "RIFAMPICIN",
//    concentration: "20 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "RIFAMPICIN",
//    concentration: "20 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "RIFAMPICIN",
//    concentration: "153 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "RISDIPLAM",
//    concentration: "0.75 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "RISPERIDONE",
//    concentration: "1 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "RIVASTIGMINE (AS HYDROGEN TARTRATE)",
//    concentration: "2 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ROTAVIRUS VACCINE, MONOVALENT, LIVE ATTENUATED",
//    concentration: "",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ROTAVIRUS VACCINE, PENTAVALENT, LIVE",
//    concentration: "",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SALBUTAMOL (AS SULFATE)",
//    concentration: "2 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SEVELAMER CARBONATE",
//    concentration: "2.4 g",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SEVELAMER CARBONATE",
//    concentration: "800 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SIMETHICONE (DIMETHICONE ACTIVATED)",
//    concentration: "41.2 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SIMETHICONE (DIMETHICONE ACTIVATED)",
//    concentration: "40 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM FLUORIDE",
//    concentration: "0.003 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM FLUORIDE",
//    concentration: "1.1 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM IODIDE (SUP123/SUPI)",
//    concentration: "3.5 mCi",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM IODIDE (SUP123/SUPI)",
//    concentration: "0.2 mCi",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM IODIDE (SUP131/SUPI)",
//    concentration: "100 mCi",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM IODIDE (SUP131/SUPI)",
//    concentration: "150 mCi",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM IODIDE (SUP131/SUPI)",
//    concentration: "200 mCi",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM PHOSPHATE (SUP32/SUPP)",
//    concentration: "5 mCi",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM PICOSULFATE",
//    concentration: "7.5 mg",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM PICOSULFATE / MAGNESIUM OXIDE / CITRIC ACID",
//    concentration: "10 mg/3.5 g/12 g",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM POLYSTYRENE SULFONATE",
//    concentration: "454 g",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SODIUM POLYSTYRENE SULFONATE",
//    concentration: "15 g",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SORBITOL",
//    concentration: "70 %",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SOTALOL HYDROCHLORIDE",
//    concentration: "5 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "SPIRONOLACTONE",
//    concentration: "25 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "STAVUDINE",
//    concentration: "5 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "THEOPHYLLINE / GUAIFENESIN",
//    concentration: "50 mg/30 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "TRIMIPRAMINE (AS MALEATE)",
//    concentration: "4 %",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "URSODEOXYCHOLIC ACID",
//    concentration: "250 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "URSODEOXYCHOLIC ACID",
//    concentration: "250 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VALGANCICLOVIR (AS HYDROCHLORIDE)",
//    concentration: "50 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VALPROATE SODIUM",
//    concentration: "200 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VALPROATE SODIUM",
//    concentration: "300 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VANCOMYCIN (AS HYDROCHLORIDE)",
//    concentration: "25 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VANCOMYCIN (AS HYDROCHLORIDE)",
//    concentration: "500 mg",
//    dosageform: "Susp",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VANCOMYCIN (AS HYDROCHLORIDE)",
//    concentration: "50 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VITAMIN A",
//    concentration: "50000 [iU]",
//    dosageform: "Drops",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VITAMIN D3",
//    concentration: "25000 [iU]",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VITAMIN D3",
//    concentration: "50000 [iU]",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "VITAMIN D3",
//    concentration: "100000 mg",
//    dosageform: "Solution",
//    calculationType: "",
//    note: ""
//  )

// ,
//  Drug(
//    name: "ZIDOVUDINE",
//    concentration: "50 mg",
//    dosageform: "Syr",
//    calculationType: "",
//    note: ""
//  ),

];
