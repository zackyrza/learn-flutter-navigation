import 'package:go_router/go_router.dart';

import '../pages/error.dart';
import '../pages/home.dart';
import '../pages/setting.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: "/",
      builder: (context, state) => const HomePage(),
      redirect: (context, state) {
        const userIsNotLoggedIn = false;
        if (userIsNotLoggedIn) {
          return "/login";
        }
        return "/";
      },
    ),
    GoRoute(
      name: 'settings',
      path: "/settings/:name",
      builder: (context, state) {
        state.queryParams.forEach(
          (key, value) {
            print("$key:$value");
          },
        );
        return SettingsPage(
          name: state.params["name"]!,
        );
      },
    )
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
