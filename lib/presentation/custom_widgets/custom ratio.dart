import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';  // Import the ColorsManager

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.selectedOption,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedOption == value;

    return GestureDetector(
      onTap: () {
        onChanged(value);  // Notify the parent about the change
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.yellow : ColorsManager.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? ColorsManager.yellow : ColorsManager.white,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? ColorsManager.white : ColorsManager.yellow,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? ColorsManager.white : ColorsManager.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
