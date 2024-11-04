import 'package:flutter/material.dart';

class RadioButtonGroup extends StatefulWidget {
  final String label;
  final List<String> options;
  final String initialSelectedValue;
  final Function(String) onChanged;

  const RadioButtonGroup({
    Key? key,
    required this.label,
    required this.options,
    required this.initialSelectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
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
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF0062FF),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedValue == option
                              ? const Color(0xFF0062FF)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedValue == option
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
          ),
        ],
      ),
    );
  }
}
