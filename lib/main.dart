import 'package:avua/logic/admin_login/admin_login_bloc.dart';
import 'package:avua/logic/blog_list/blog_list_bloc.dart';
import 'package:avua/logic/blog_view/blog_view_bloc.dart';

import 'package:avua/logic/save_email/save_email_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SaveEmailBloc(),
        ),
        BlocProvider(
          create: (context) => BlogListBloc(),
        ),
        BlocProvider(
          create: (context) => BlogViewBloc(),
        ),
        BlocProvider(
          create: (context) => AdminLoginBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: "avua",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: true,
            fontFamily: GoogleFonts.nunitoSans().fontFamily),
        routeInformationParser: RouteConfig.router.routeInformationParser,
        routeInformationProvider: RouteConfig.router.routeInformationProvider,
        routerDelegate: RouteConfig.router.routerDelegate,
      ),
    );
  }
}
