import 'package:anime/core/utils/app_export.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final String? fromDate;
  final String? toDate;
  final String label;

  const DateWidget({
    super.key,
    required this.label,
    required this.fromDate,
    required this.toDate,
  });

  String _formatAiredDate(String? from, String? to) {
    if (from == null && to == null) return "Unknown";

    try {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');

      String? fromFormatted;
      String? toFormatted;

      if (from != null) {
        final fromParsed = DateTime.tryParse(from);
        if (fromParsed != null) {
          fromFormatted = formatter.format(fromParsed);
        }
      }

      if (to != null) {
        final toParsed = DateTime.tryParse(to);
        if (toParsed != null) {
          toFormatted = formatter.format(toParsed);
        }
      }

      if (fromFormatted != null && toFormatted != null) {
        return "$fromFormatted - $toFormatted";
      } else if (fromFormatted != null) {
        return "$fromFormatted - 00/00/0000";
      } else if (toFormatted != null) {
        return "00/00/0000 - $toFormatted";
      } else {
        return "Unknown";
      }
    } catch (e) {
      return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: ",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Expanded(
          child: Text(
            _formatAiredDate(fromDate, toDate),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
