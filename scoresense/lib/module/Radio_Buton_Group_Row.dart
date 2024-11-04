import 'package:flutter/material.dart';

class RadioButtonGroupRow extends StatefulWidget {
  final String label;
  final List<String> options;
  final String initialSelectedValue;
  final Function(String) onChanged;

  const RadioButtonGroupRow({
    Key? key,
    required this.label,
    required this.options,
    required this.initialSelectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RadioButtonGroupRowState createState() => _RadioButtonGroupRowState();
}

class _RadioButtonGroupRowState extends State<RadioButtonGroupRow> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialSelectedValue;
  }

  void _handleOptionTap(String option) {
    setState(() {
      selectedValue = option;
    });
    widget.onChanged(option);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      children: [
        SizedBox(
          width: 250,
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0062FF)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            children: widget.options.map((option) {
              return GestureDetector(
                onTap: () => _handleOptionTap(option),
                child: Container(
                  padding: option.length < 4
                      ? const EdgeInsets.symmetric(horizontal: 36, vertical: 8)
                      : const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedValue == option
                        ? const Color(0xFF0062FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      color: selectedValue == option ? Colors.white : Colors.black,
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