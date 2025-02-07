import 'package:flutter/material.dart';
import "MoreOptionsScreen.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _currentMonthIndex = DateTime.now().month - 1; // Default to current month

  DateTime _selectedDate = DateTime.now();
  List<Map<String, String>> pinnedEvents = []; // Liste des événements épinglés
  List<Map<String, String>> taskList = []; // Liste des tâches normales

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Student Planner"),
        ),
        leading: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MoreOptionsScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today), // Icône calendrier en haut à droite
             onPressed: _showDatePicker, // ✨ Ajoute ta propre méthode ici
          ),
        ],
      ),
      body: Column(
        children: [
          _buildPinnedEventsSection(), // Affichage des événements épinglés sous forme de cartes
          Expanded(child: _buildTaskList()), // Affichage des tâches sous forme de liste
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTasDialog(context), // ✨ Afficher le dialogue d'ajout de tâche
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scanner'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'My Files'),
        ],
      ),
    );
  }

  // 🔹 Section des événements épinglés sous forme de cartes horizontales
  Widget _buildPinnedEventsSection() {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...pinnedEvents.map((event) => _buildPinnedEventCard(event)).toList(),
          _buildAddEventButton(),
        ],
      ),
    );
  }

  // 🔹 Carte d'un événement épinglé
  Widget _buildPinnedEventCard(Map<String, String> event) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(event["title"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(event["description"]!, style: const TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 5),
          Text(event["location"]!, style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
        ],
      ),
    );
  }

  // 🔹 Bouton pour ajouter un événement épinglé
  Widget _buildAddEventButton() {
    return GestureDetector(
      onTap: () => _showTaskDialog(context, isPinnedEvent: true),
      child: Container(
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26),
        ),
        child: const Center(child: Icon(Icons.add, size: 40, color: Colors.black54)),
      ),
    );
  }

  // 🔹 Liste verticale des tâches normales
  Widget _buildTaskList() {
    return taskList.isEmpty
        ? const Center(child: Text("No tasks added", style: TextStyle(fontSize: 16)))
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return _buildTaskItem(taskList[index]);
            },
          );
  }

  // 🔹 Élément de tâche affiché en liste avec une icône à droite
  Widget _buildTaskItem(Map<String, String> task) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(task['title']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task['description']!, style: const TextStyle(fontSize: 14, color: Colors.black54)),
            Text(task['location']!, style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
          ],
        ),
        trailing: Icon(_getTaskIcon(task['type']!)), // Ajout de l’icône appropriée
      ),
    );
  }

  // 🔹 Boîte de dialogue pour ajouter une tâche (sans champ date)
  void _showTaskDialog(BuildContext context, {bool isPinnedEvent = false}) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    String selectedTaskType = "Devoir";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(isPinnedEvent ? "Add Pinned Event" : "Add Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleController, decoration: const InputDecoration(labelText: "Title")),
              TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
              TextField(controller: locationController, decoration: const InputDecoration(labelText: "Location")),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  (isPinnedEvent ? pinnedEvents : taskList).add({
                    "title": titleController.text,
                    "description": descriptionController.text,
                    "location": locationController.text,
                    "type": selectedTaskType,
                  });
                });
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // 🔹 Sélection de l’icône en fonction du type de tâche
  IconData _getTaskIcon(String taskType) {
    return {
      "Devoir": Icons.menu_book,
      "Cours": Icons.book,
      "Examen": Icons.description,
    }[taskType] ?? Icons.event_note;
  }

// Affiche la boîte de dialogue pour ajouter une tâche
  void _showTasDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    String selectedTaskType = "Devoir"; // Valeur par défaut

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text("Add Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleController, decoration: const InputDecoration(labelText: "Title")),
              TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
              TextField(controller: locationController, decoration: const InputDecoration(labelText: "Location")),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedTaskType,
                decoration: const InputDecoration(labelText: "Task Type"),
                items: ["Devoir", "Cours", "Examen"].map((String category) {
                  return DropdownMenuItem(value: category, child: Text(category));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTaskType = newValue!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  taskList.add({
                    "title": titleController.text,
                    "description": descriptionController.text,
                    "location": locationController.text,
                    "type": selectedTaskType, // Stockage du type pour l’icône
                  });
                });
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _currentMonthIndex = pickedDate.month - 1;
      });
    }
  }  

}
