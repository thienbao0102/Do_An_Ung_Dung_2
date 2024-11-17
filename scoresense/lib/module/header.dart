import 'package:flutter/material.dart';
import 'package:scoresense/pages/choosepredictmethod.dart';
import 'package:scoresense/pages/importfitmodel.dart';

class Header extends StatefulWidget {
  final Color setColor;
  const Header({super.key, required this.setColor});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  // Danh sách trạng thái hover cho từng mục
  final List<bool> isHoveredList = [false, false, false, false, false];
  // bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 20, left: 100, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                // Home Page
                _buildNavItem(
                  context,
                  "Home",
                  0,
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                // Predict Score
                _buildNavItem(
                  context,
                  "Prediction",
                  1,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Choosepredictmethod()),
                    );
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                // Fit Model
                _buildNavItem(
                  context,
                  "Fit Model",
                  2,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImportFileFitModel()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Sign in
                  _buildNavItem(
                    context,
                    "Sign In",
                    3,
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                  //Sign in
                  _buildNavItem(
                    context,
                    "Sign Up",
                    4,
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }

  // Widget cho từng mục trong nav bar
  Widget _buildNavItem(BuildContext context, String title, int index,
      {required VoidCallback onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHoveredList[index] = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHoveredList[index] = false;
        });
      },
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 90,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: isHoveredList[index]
                              ? BorderSide(width: 2, color: widget.setColor)
                              : const BorderSide(
                                  width: 2, color: Colors.transparent))),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.setColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
