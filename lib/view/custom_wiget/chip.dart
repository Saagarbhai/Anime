import 'package:anime/core/utils/app_export.dart';

class WebLinkChip extends StatelessWidget {
  final String name;
  final String url;

  const WebLinkChip({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await Navigator.pushNamed(
            context,
            AppConstants.webViewRoute,
            arguments: url,
          );
        } catch (e) {
          debugPrint('Navigation error: $e');
        }
      },
      child: Chip(
        label: Text(
          name,
          style: TextStyle(
            fontFamily: Lang.of(context).text_poppins,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
