import 'package:flutter/material.dart';
import '../models/compte.dart';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Padding(
  final VoidCallback onDelete;
  final VoidCallback? onEdit; // <--- added edit callback

  const CompteCard({
            Text('ID: ${compte.id}', style: const TextStyle(fontWeight: FontWeight.w600)),
    required this.compte,
            Text('Solde: ${compte.solde.toStringAsFixed(2)}'),
    this.onEdit,
            Text('Type: ${compte.type}'),

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
                    child: const Text('Modifier'),
          crossAxisAlignment: CrossAxisAlignment.start,
                      backgroundColor: Colors.green,
            Text('ID: ${compte.id}'),
            SizedBox(height: 8),
            Text('Solde: ${compte.solde.toStringAsFixed(2)}'),
            SizedBox(height: 8),
            Text('Type: ${compte.type}'),
                  child: const Text('Supprimer'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onEdit != null)
                  ElevatedButton(
                    onPressed: onEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('Modifier'),
                  ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('Supprimer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
