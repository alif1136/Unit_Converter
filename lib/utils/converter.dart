import '../models/unit.dart';

const Map<String, double> _lengthToMeter = {
  'mm': 0.001,
  'cm': 0.01,
  'm': 1.0,
  'km': 1000.0,
  'in': 0.0254,
  'ft': 0.3048,
  'yd': 0.9144,
  'mi': 1609.344,
};

const Map<String, double> _weightToGram = {
  'mg': 0.001,
  'g': 1.0,
  'kg': 1000.0,
  't': 1000000.0,
  'oz': 28.3495,
  'lb': 453.592,
};

double _convertLength(double value, String from, String to) {
  final inMeters = value * (_lengthToMeter[from] ?? 1.0);
  return inMeters / (_lengthToMeter[to] ?? 1.0);
}

double _convertWeight(double value, String from, String to) {
  final inGrams = value * (_weightToGram[from] ?? 1.0);
  return inGrams / (_weightToGram[to] ?? 1.0);
}

double _convertTemperature(double value, String from, String to) {
  if (from == to) return value;

  double celsius;
  switch (from) {
    case 'C':
      celsius = value;
      break;
    case 'F':
      celsius = (value - 32) * 5 / 9;
      break;
    case 'K':
      celsius = value - 273.15;
      break;
    default:
      celsius = value;
  }

  switch (to) {
    case 'C':
      return celsius;
    case 'F':
      return celsius * 9 / 5 + 32;
    case 'K':
      return celsius + 273.15;
    default:
      return celsius;
  }
}

double convert(double value, String from, String to, ConversionCategory category) {
  if (from == to) return value;
  switch (category) {
    case ConversionCategory.length:
      return _convertLength(value, from, to);
    case ConversionCategory.weight:
      return _convertWeight(value, from, to);
    case ConversionCategory.temperature:
      return _convertTemperature(value, from, to);
  }
}

String formatResult(double value) {
  final abs = value.abs();
  if (abs == 0) return '0';
  if (abs >= 1e9 || (abs > 0 && abs < 0.0001)) {
    return value.toStringAsExponential(4);
  }
  final str = double.parse(value.toStringAsPrecision(8)).toString();
  return str;
}