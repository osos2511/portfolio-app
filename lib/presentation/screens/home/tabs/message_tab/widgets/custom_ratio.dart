import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedOption == value;

    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5),
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
            const SizedBox(width: 10),
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
