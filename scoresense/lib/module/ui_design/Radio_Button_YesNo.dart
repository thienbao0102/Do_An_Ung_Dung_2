import 'package:flutter/material.dart';

class RadioButtonYesNo extends StatefulWidget {
  final String label;
  final List<String> options;
  final String initialSelectedValue;
  final ValueChanged<String> onChanged;

  const RadioButtonYesNo({
    Key? key,
    required this.label,
    required this.options,
    required this.initialSelectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RadioButtonYesNoState createState() => _RadioButtonYesNoState();
}

class _RadioButtonYesNoState extends State<RadioButtonYesNo> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialSelectedValue;
  }

  void _handleOptionTap(String option) {
    setState(() {
      selectedValue = option; // Update selected value
    });
    widget.onChanged(option); // Notify parent of the change
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(width: 155),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0062FF)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            children: widget.options.map((option) {
              return GestureDetector(
                onTap: () {
                  _handleOptionTap(option); // Call the method on tap
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: selectedValue == option // Check against selectedValue
                        ? const Color(0xFF0062FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      color: selectedValue == option // Check against selectedValue
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
