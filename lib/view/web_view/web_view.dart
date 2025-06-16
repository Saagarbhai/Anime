import 'package:anime/core/utils/app_export.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WebViewBloc()..add(LoadWebView(url)),
      child: Scaffold(
        appBar: _appbar(context),
        body: BlocBuilder<WebViewBloc, WebViewState>(builder: (context, state) {
          if (state.webViewStatus == Status.loading) {
            return ShimmerEffects.webViewShimmer();
          } else if (state.webViewStatus == Status.success) {
            final controller = WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(url));
            return WebViewWidget(controller: controller);
          } else if (state.webViewStatus == Status.failure) {
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      title: Text(
        Lang.of(context).appbar_title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: Lang.of(context).text_poppins,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
