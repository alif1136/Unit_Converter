enum ConversionCategory { length, weight, temperature }

class ConversionUnit {
  final String label;
  final String value;

  const ConversionUnit({required this.label, required this.value});
}

const List<ConversionUnit> lengthUnits = [
  ConversionUnit(label: 'Millimeter', value: 'mm'),
  ConversionUnit(label: 'Centimeter', value: 'cm'),
  ConversionUnit(label: 'Meter', value: 'm'),
  ConversionUnit(label: 'Kilometer', value: 'km'),
  ConversionUnit(label: 'Inch', value: 'in'),
  ConversionUnit(label: 'Foot', value: 'ft'),
  ConversionUnit(label: 'Yard', value: 'yd'),
  ConversionUnit(label: 'Mile', value: 'mi'),
];

const List<ConversionUnit> weightUnits = [
  ConversionUnit(label: 'Milligram', value: 'mg'),
  ConversionUnit(label: 'Gram', value: 'g'),
  ConversionUnit(label: 'Kilogram', value: 'kg'),
  ConversionUnit(label: 'Metric Ton', value: 't'),
  ConversionUnit(label: 'Ounce', value: 'oz'),
  ConversionUnit(label: 'Pound', value: 'lb'),
];

const List<ConversionUnit> temperatureUnits = [
  ConversionUnit(label: 'Celsius', value: 'C'),
  ConversionUnit(label: 'Fahrenheit', value: 'F'),
  ConversionUnit(label: 'Kelvin', value: 'K'),
];

List<ConversionUnit> getUnits(ConversionCategory category) {
  switch (category) {
    case ConversionCategory.length:
      return lengthUnits;
    case ConversionCategory.weight:
      return weightUnits;
    case ConversionCategory.temperature:
      return temperatureUnits;
  }
}