import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wizard_provider.dart';

class WizardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wizardProvider = Provider.of<WizardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des sorciers'),
      ),
      body: FutureBuilder(
        future: wizardProvider.fetchWizards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('Une erreur est survenue.'));
          } else {
            return ListView.builder(
              itemCount: wizardProvider.wizards.length,
              itemBuilder: (ctx, index) {
                final wizard = wizardProvider.wizards[index];
                return Card(
                  child: ListTile(
                    title: Text('${wizard.firstName} ${wizard.lastName}'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/wizard-detail',
                        arguments: wizard.id,
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
