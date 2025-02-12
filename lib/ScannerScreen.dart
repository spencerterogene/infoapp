import 'package:flutter/material.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool isGridView = false;
  List<Map<String, dynamic>> items = []; // Liste des fichiers/dossiers

  void _addItem(String type, {String? name}) {
    setState(() {
      items.add({
        "type": type,
        "name": name ?? type,
        "icon": _getIconForType(type),
      });
    });
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case "File":
        return Icons.insert_drive_file;
      case "Folder":
        return Icons.folder;
      case "Cloud":
        return Icons.cloud_download;
      case "Storage":
        return Icons.sd_storage;
      case "PDF":
        return Icons.picture_as_pdf;
      case "Word":
        return Icons.description;
      default:
        return Icons.help_outline;
    }
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Créer un élément"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogOption("Créer un fichier", Icons.insert_drive_file, "File"),
              _dialogOption("Créer un dossier", Icons.folder, "Folder"),
              _dialogOption("Charger depuis le cloud", Icons.cloud_download, "Cloud"),
              _dialogOption("Sélectionner depuis le stockage", Icons.sd_storage, "Storage"),
            ],
          ),
        );
      },
    );
  }

  void _showScanDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Scanner un document"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogOption("Convertir en PDF", Icons.picture_as_pdf, "PDF"),
              _dialogOption("Convertir en Word", Icons.description, "Word"),
            ],
          ),
        );
      },
    );
  }

  Widget _dialogOption(String label, IconData icon, String type) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        _addItem(type);
      },
    );
  }

  void _copyItem(int index) {
    setState(() {
      items.add({
        "type": items[index]["type"],
        "name": "${items[index]["name"]} (copie)",
        "icon": items[index]["icon"],
      });
    });
  }

  void _moveItem(int index) {
    setState(() {
      final item = items.removeAt(index);
      items.insert(0, item); // Déplace en haut de la liste
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Retour à la page précédente
          },
        ),
        title: const Text("Search"),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search here..",
                  prefixIcon: Icon(Icons.search, color: Colors.teal),
                  suffixIcon: Icon(Icons.mic, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: isGridView
                  ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {
                            _showContextMenu(index);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(items[index]["icon"], size: 50, color: Colors.blue),
                              Text(items[index]["name"]),
                            ],
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(items[index]["icon"], color: Colors.blue),
                          title: Text(items[index]["name"]),
                          onLongPress: () {
                            _showContextMenu(index);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "scan",
            onPressed: _showScanDialog,
            child: const Icon(Icons.scanner),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "add",
            onPressed: _showAddDialog,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _showContextMenu(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.content_copy),
              title: const Text("Copier"),
              onTap: () {
                Navigator.pop(context);
                _copyItem(index);
              },
            ),
            ListTile(
              leading: const Icon(Icons.drive_file_move),
              title: const Text("Déplacer"),
              onTap: () {
                Navigator.pop(context);
                _moveItem(index);
              },
            ),
          ],
        );
      },
    );
  }
}
