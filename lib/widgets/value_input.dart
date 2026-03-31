import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/converter_provider.dart';

class ValueInput extends StatefulWidget {
  const ValueInput({super.key});

  @override
  State<ValueInput> createState() => _ValueInputState();
}

class _ValueInputState extends State<ValueInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final initial = context.read<ConverterProvider>().inputValue;
    _controller = TextEditingController(text: initial);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final providerVal = context.read<ConverterProvider>().inputValue;
    if (_controller.text != providerVal) {
      _controller.text = providerVal;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Value',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8A9BB0),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _controller,
            keyboardType:
            const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
            ],
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: const TextStyle(color: Color(0xFF8A9BB0)),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFD8E3EE)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFD8E3EE)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                const BorderSide(color: Color(0xFF1565C0), width: 1.5),
              ),
            ),
            onChanged: (val) {
              context.read<ConverterProvider>().setInput(val);
            },
          ),
        ],
      ),
    );
  }
}