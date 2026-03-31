import 'package:flutter/foundation.dart';
import '../models/unit.dart';
import '../utils/converter.dart';

class ConverterProvider extends ChangeNotifier {
  ConversionCategory _category = ConversionCategory.length;
  String _inputValue = '';
  String _fromUnit = 'm';
  String _toUnit = 'km';

  ConversionCategory get category => _category;
  String get inputValue => _inputValue;
  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;

  double? get result {
    final parsed = double.tryParse(_inputValue);
    if (parsed == null || _inputValue.isEmpty) return null;
    return convert(parsed, _fromUnit, _toUnit, _category);
  }

  String get resultText {
    final r = result;
    if (r == null) return '—';
    return formatResult(r);
  }

  String get toUnitLabel {
    final units = getUnits(_category);
    return units
        .firstWhere(
          (u) => u.value == _toUnit,
      orElse: () => ConversionUnit(label: _toUnit, value: _toUnit),
    )
        .label;
  }

  void setCategory(ConversionCategory category) {
    _category = category;
    _inputValue = '';
    switch (category) {
      case ConversionCategory.length:
        _fromUnit = 'm';
        _toUnit = 'km';
        break;
      case ConversionCategory.weight:
        _fromUnit = 'kg';
        _toUnit = 'g';
        break;
      case ConversionCategory.temperature:
        _fromUnit = 'C';
        _toUnit = 'F';
        break;
    }
    notifyListeners();
  }

  void setInput(String value) {
    _inputValue = value;
    notifyListeners();
  }

  void setFromUnit(String unit) {
    _fromUnit = unit;
    notifyListeners();
  }

  void setToUnit(String unit) {
    _toUnit = unit;
    notifyListeners();
  }

  void swapUnits() {
    final temp = _fromUnit;
    _fromUnit = _toUnit;
    _toUnit = temp;
    notifyListeners();
  }
}