import 'package:flutter/material.dart';
import '../models/compte.dart';
import '../services/api_service.dart';
import 'add_compte_page.dart';
import 'update_compte_page.dart';
import '../widgets/compte_card.dart';

class ComptesPage extends StatefulWidget {
  const ComptesPage({super.key});

  @override
  _ComptesPageState createState() => _ComptesPageState();
}

class _ComptesPageState extends State<ComptesPage> {
  final ApiService apiService = ApiService();
  late Future<List<Compte>> comptes;
  String format = 'JSON'; // Default format

  @override
  void initState() {
    super.initState();
    comptes = apiService.fetchComptes();
  }

  void refreshList() {
    setState(() {
      comptes = apiService.fetchComptes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liste des Comptes')),
      body: Column(
        children: [
          // Card for JSON/XML toggle
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('JSON'),
                      value: 'JSON',
                      groupValue: format,
                      onChanged: (value) {
                        setState(() {
                          format = value!;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('XML'),
                      value: 'XML',
                      groupValue: format,
                      onChanged: (value) {
                        setState(() {
                          format = value!;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // List of comptes
          Expanded(
            child: FutureBuilder<List<Compte>>(
              future: comptes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Erreur : ${snapshot.error}'));
                }

                final comptesList = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: comptesList.length,
                  itemBuilder: (context, index) {
                    final compte = comptesList[index];
                    return CompteCard(
                      compte: compte,
                      onDelete: () async {
                        await apiService.deleteCompte(compte.id!);
                        refreshList();
                      },
                      onEdit: () async { // <--- added edit
                        bool updated = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UpdateComptePage(compte: compte),
                          ),
                        );
                        if (updated == true) refreshList();
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Open Add Compte page and refresh list after adding
          bool added = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddComptePage()),
          );
          if (added == true) refreshList();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
