import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/messages/friends_view.dart';

class MessagesRoute {
  static const path = '/messages';
  static const name = 'Messages';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      builder: (_, state) => const MessagesView(),
    );
  }
}
