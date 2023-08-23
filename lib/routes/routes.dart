import 'package:avua/routes/route_names.dart';

import 'package:avua/screens/admin/admin_dashboard.dart';
import 'package:avua/screens/admin/admin_login.dart';
import 'package:avua/screens/blog/blog.dart';

import 'package:avua/screens/landing_page/landing_page.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'error_screen.dart';

class RouteConfig {
  static final GoRouter router = GoRouter(
    // initialLocation: RoutesName.home,
    initialLocation: RoutesName.landingPage,
    routes: [
      GoRoute(
        path: "/",
        name: RoutesName.landingPage,
        builder: (context, state) => Material(
          key: state.pageKey,
          child: const LandingPage(),
        ),
      ),
      GoRoute(
        path: RoutesName.adminLogin,
        name: RoutesName.adminLogin,
        builder: (context, state) => Material(
          key: state.pageKey,
          child: const AdminLogin(),
        ),
      ),
      GoRoute(
        path: RoutesName.adminDashboard,
        name: RoutesName.adminDashboard,
        builder: (context, state) => Material(
          key: state.pageKey,
          child: const AdminDashboard(),
        ),
      ),
      GoRoute(
        path: RoutesName.blog,
        name: RoutesName.blog,
        builder: (context, state) => Material(
          key: state.pageKey,
          child: BlogPage(
            index: state.pathParameters["index"]!,
          ),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: ErrorScreen(
        state.error!,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          RotationTransition(
        turns: animation,
        child: ErrorScreen(
          state.error!,
        ),
      ),
    ),
    // redirect to the login page if the user is not logged in
  );
}
