import 'package:anime/core/utils/app_export.dart';

class Animecard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;

  const Animecard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Icon
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                imagePath,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),

            // App Info Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        rating.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.star, size: 16, color: Colors.black54),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
