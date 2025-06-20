import 'package:anime/core/utils/app_export.dart';

class FilterPopupButton extends StatelessWidget {
  const FilterPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      icon: Icon(Icons.filter_alt_outlined),
      iconColor: MyAppThemeHelper.primary,
      color: MyAppThemeHelper.white,
      itemBuilder: (context) => [
        _buildMenuItem(context, "ALL"),
        _buildMenuItem(context, "TV"),
        _buildMenuItem(context, "MOVIE"),
        _buildMenuItem(context, "MANGA"),
        _buildMenuItem(context, "ORIGINAL"),
        _buildMenuItem(context, "EPISODE"),
        _buildMenuItem(context, "RATING"),
        _buildMenuItem(context, "RANK"),
        _buildMenuItem(context, "FAVORITES"),
        _buildMenuItem(context, "MEMBERS"),
        _buildMenuItem(context, "POPULARITY"),
      ],
    );
  }

  PopupMenuItem _buildMenuItem(BuildContext context, String label) {
    return PopupMenuItem(
      onTap: () {
        context.read<SearchBloc>().add(
              OnFilterChangeEvent(filter: label),
            );
        FocusNode().unfocus();
      },
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, letterSpacing: 1),
        ),
      ),
    );
  }
}
