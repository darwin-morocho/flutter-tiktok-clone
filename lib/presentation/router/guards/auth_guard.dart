import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../global/blocs/session_bloc.dart';
import '../routes/sign_in.dart';

Future<String?> authGuard(BuildContext context, GoRouterState state) async {
  final authenticatedUser = sessionProvider.read().state;
  if (authenticatedUser == null) {
    final redirect = Uri.encodeComponent(state.uri.toString());
    return '${SignInRoute.path}?redirect=$redirect';
  }
  return null;
}
