import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/unit.dart';
import '../providers/converter_provider.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    const primary = Color(0xFF1565C0);

    final tabs = [
      (label: 'Length', value: ConversionCategory.length),
      (label: 'Weight', value: ConversionCategory.weight),
      (label: 'Temp', value: ConversionCategory.temperature),
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: tabs.map((tab) {
          final isActive = provider.category == tab.value;
          return Expanded(
            child: GestureDetector(
              onTap: () =>
                  context.read<ConverterProvider>().setCategory(tab.value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: isActive
                      ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    )
                  ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    tab.label,
                    style: TextStyle(
                      color: isActive ? primary : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}