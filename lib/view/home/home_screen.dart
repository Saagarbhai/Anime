import 'package:anime/core/utils/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Home'),
      ),
      body: Center(
        child: Text(Lang.of(context).apptitle),
      ),
    );
  }
}
