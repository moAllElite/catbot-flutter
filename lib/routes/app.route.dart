import 'package:catbot/views/chat_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../views/login_view.dart';

final GoRouter appRouter = GoRouter(
    routes: <RouteBase>[
        GoRoute(
            path:  '/',
            builder: (BuildContext context,GoRouterState state) {
                return const LoginView();
            },
            routes:[
                GoRoute(
                    path: '/chatbot',
                    builder: (BuildContext context,GoRouterState state) => const ChatView(title: 'ChatBot'),
                ),
            ]
        ),
    ],

);