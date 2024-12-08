import 'package:flutter/material.dart';

class RadioLevelsLabel extends StatefulWidget {
  final String question;
  final List<String> options;
  final int selectedIndex; // To track the selected index
  final ValueChanged<int> onChanged; // Callback for when an option is tapped

  const RadioLevelsLabel({
    Key? key,
    required this.question,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RadioLevelsLabelState createState() => _RadioLevelsLabelState();
}

class _RadioLevelsLabelState extends State<RadioLevelsLabel> {
  late int selectedValue; // Using int to track the selected index

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedIndex; // Initialize with the selected index
  }

  void _handleOptionTap(int index) {
    setState(() {
      selectedValue = index; // Update selected value
    });
    widget.onChanged(index); // Notify parent of the change
  }

  @override
  Widget build(BuildContext context) {
    double width = (WidgetsBinding.instance.window.physicalSize.width /
                WidgetsBinding.instance.window.devicePixelRatio) >
            1300
        ? 200
        : 450;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: width,
          child: Text(
            widget.question,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Container(
          width: widget.options.length * 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.options.length, (index) {
              return GestureDetector(
                onTap: () {
                  _handleOptionTap(index); // Handle tap event
                },
                child: SizedBox(
                  width: 95,
                  child: Text(
                    widget.options[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedValue == index
                          ? const Color(0xFF0062FF) // Change color if selected
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
