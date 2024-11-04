import 'package:flutter/material.dart';

class RadioLevels extends StatefulWidget {
  final String question;
  final List<String> options;
  final int initialSelectedValue; // Use initialSelectedValue instead of selectedIndex
  final ValueChanged<int> onChanged;

  const RadioLevels({
    Key? key,
    required this.question,
    required this.options,
    required this.initialSelectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RadioLevelsState createState() => _RadioLevelsState();
}

class _RadioLevelsState extends State<RadioLevels> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedValue; // Initialize selectedIndex
  }

  void _handleOptionTap(int index) {
    setState(() {
      selectedIndex = index; // Update selected index
    });
    widget.onChanged(index); // Notify parent of the change
  }

  @override
  Widget build(BuildContext context) {
    double width = (WidgetsBinding.instance.window.physicalSize.width /
                    WidgetsBinding.instance.window.devicePixelRatio) >
                1300
        ? 200
        : 350;

    return Wrap(
      children: [
        SizedBox(
          width: width,
          child: Text(
            widget.question,
            style: TextStyle(
              fontSize: 16,
              color: (WidgetsBinding.instance.window.physicalSize.width /
                          WidgetsBinding.instance.window.devicePixelRatio) >
                      1300
                  ? Colors.black
                  : const Color(0xFF0062FF),
            ),
          ),
        ),
        Container(
          width: widget.options.length * 100,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0062FF)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.options.length, (index) {
              return Column(
                children: [
                  SizedBox(
                    width: 90,
                    child: Radio<int>(
                      value: index,
                      groupValue: selectedIndex,
                      activeColor: const Color(0xFF0062FF),
                      onChanged: (int? value) {
                        if (value != null) {
                          _handleOptionTap(index); // Call to handle the tap
                        }
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
