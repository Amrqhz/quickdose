class Drug {
  final String name;
  final String concentration;
  final String dosageform;
  final String? note;
  final String calculationType;
  final Map<String, dynamic>? parameters;

  Drug({
    required this.name,
    required this.concentration,
    required this.dosageform,
    this.note,
    required this.calculationType,
    this.parameters,
  });
}