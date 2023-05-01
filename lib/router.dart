import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'providers/wizard_provider.dart';
import 'screens/wizard_detail_screen.dart';
import 'screens/wizard_list_screen.dart';

GoRouter setupGoRouter() {
  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: WizardListScreen());
        },
      ),
      GoRoute(
        path: '/wizard-detail/:id',
        pageBuilder: (context, state) {
          final wizardId = state.params['id']!;
          return MaterialPage(child: WizardDetailScreen(id: wizardId));
        },
      ),
    ],
  );

  return goRouter;
}
