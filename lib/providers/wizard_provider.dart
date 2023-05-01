import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/wizard.dart';

class WizardProvider with ChangeNotifier {
  List<Wizard> _wizards = [];

  List<Wizard> get wizards {
    return [..._wizards];
  }

  Future<void> fetchWizards() async {
    const url = 'https://wizard-world-api.herokuapp.com/wizards';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body) as List<dynamic>;
      _wizards = responseJson.map((json) => Wizard.fromJson(json)).toList();
      print(_wizards);
      notifyListeners();
    } else {
      throw Exception('Failed to load wizards');
    }
  }
}
