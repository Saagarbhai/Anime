import 'package:anime/core/utils/app_export.dart';

class WebViewBloc extends Bloc<WebViewEvent, WebViewState> {
  WebViewBloc() : super(WebViewState()) {
    on<LoadWebView>(_loadWebView);
  }
  Future<void> _loadWebView(LoadWebView event, Emitter emit) async {
    emit(state.copyWith(webViewStatus: Status.loading));
    final isValid = Uri.tryParse(event.url)?.isAbsolute ?? false;
    if (isValid) {
      emit(state.copyWith(webViewStatus: Status.success));
    } else {
      emit(state.copyWith(
          webViewStatus: Status.failure, errorMessage: 'not valid'));
    }
  }
}
