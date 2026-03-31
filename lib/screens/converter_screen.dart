import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/unit.dart';
import '../providers/converter_provider.dart';
import '../widgets/category_tabs.dart';
import '../widgets/value_input.dart';
import '../widgets/unit_dropdown.dart';
import '../widgets/swap_button.dart';
import '../widgets/result_display.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    final units = getUnits(provider.category);

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Unit Converter',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CategoryTabs(),
            const ValueInput(),
            UnitDropdown(
              label: 'From',
              selectedValue: provider.fromUnit,
              units: units,
              onChanged: (val) =>
                  context.read<ConverterProvider>().setFromUnit(val),
            ),
            const SwapButton(),
            UnitDropdown(
              label: 'To',
              selectedValue: provider.toUnit,
              units: units,
              onChanged: (val) =>
                  context.read<ConverterProvider>().setToUnit(val),
            ),
            const ResultDisplay(),
          ],
        ),
      ),
    );
  }
}