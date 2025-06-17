import 'package:anime/core/utils/app_export.dart';

class LabeledValueWidget extends StatelessWidget {
  final String label;
  final String value;
  final double spacing;

  const LabeledValueWidget({
    super.key,
    required this.label,
    required this.value,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
        ),
        SizedBox(width: spacing),
        Text(
          value,
          style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
