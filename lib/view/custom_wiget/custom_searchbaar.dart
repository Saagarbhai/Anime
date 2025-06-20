import 'package:anime/core/utils/app_export.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;

  const CustomSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: MyAppThemeHelper.primary,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: MyAppThemeHelper.primary,
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: MyAppThemeHelper.primary,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: MyAppThemeHelper.primary,
            width: 1.5.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5.w,
          ),
        ),
        hintText: Lang.of(context).search_hint,
        hintStyle: MyAppThemeHelper.lightTheme.textTheme.labelSmall!.copyWith(
          color: MyAppThemeHelper.grey,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        filled: true,
        fillColor: MyAppThemeHelper.white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.search,
          color: MyAppThemeHelper.primary,
          size: 20.sp,
        ),
        suffixIcon: const FilterPopupButton(),
      ),
      onChanged: (value) {
        context.read<SearchBloc>().add(OnSearchTextChangeEvent(value));
      },
    );
  }
}
