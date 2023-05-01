import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wizard_provider.dart';

class WizardDetailScreen extends StatelessWidget {
  final String id;

  WizardDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    final wizard = Provider.of<WizardProvider>(context)
        .wizards
        .firstWhere((wizard) => wizard.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${wizard.firstName} ${wizard.lastName}'),
      ),
      body: ListView.builder(
        itemCount: wizard.elixirs.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(wizard.elixirs[index]),
          );
        },
      ),
    );
  }
}
