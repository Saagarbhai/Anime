import 'package:anime/core/utils/app_export.dart';

class WebViewState extends Equatable {
  final Status webViewStatus;
  final String errorMessage;

  const WebViewState(
      {this.webViewStatus = Status.init, this.errorMessage = ''});

  WebViewState copyWith({Status? webViewStatus, String? errorMessage}) {
    return WebViewState(
        webViewStatus: webViewStatus ?? this.webViewStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [webViewStatus, errorMessage];
}
