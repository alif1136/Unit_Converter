import 'package:flutter/material.dart';
import '../models/unit.dart';

class UnitDropdown extends StatelessWidget {
  final String label;
  final String selectedValue;
  final List<ConversionUnit> units;
  final ValueChanged<String> onChanged;

  const UnitDropdown({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.units,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selected = units.firstWhere(
          (u) => u.value == selectedValue,
      orElse: () => units.first,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8A9BB0),
            ),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () => _showPicker(context),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFD8E3EE)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selected.label,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF8A9BB0),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD8E3EE),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Select $label Unit',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1565C0),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(color: Color(0xFFD8E3EE), height: 1),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.45,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: units.length,
                  itemBuilder: (ctx, i) {
                    final unit = units[i];
                    final isSelected = unit.value == selectedValue;
                    return ListTile(
                      title: Text(
                        unit.label,
                        style: TextStyle(
                          fontSize: 15,
                          color: isSelected
                              ? const Color(0xFF1565C0)
                              : const Color(0xFF0a0a0a),
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_rounded,
                          color: Color(0xFF1565C0), size: 18)
                          : null,
                      tileColor: isSelected
                          ? const Color(0xFFE3EBF6)
                          : Colors.transparent,
                      onTap: () {
                        onChanged(unit.value);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}