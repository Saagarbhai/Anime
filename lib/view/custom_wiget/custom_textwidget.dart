import 'package:anime/core/utils/app_export.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;

  const CustomTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Text(
        text,
        style: MyAppThemeHelper.lightTheme.textTheme.titleMedium,
      ),
    );
  }
}
