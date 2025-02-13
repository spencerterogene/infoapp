import 'package:flutter/material.dart';



class MessageScreen extends StatefulWidget {
   const MessageScreen({super.key});
   
  @override
  _MessagescreenState createState() => _MessagescreenState();
}

class _MessagescreenState extends State<MessageScreen> {
  List<String> chatList = ["Alice", "Bob", "Charlie", "David", "Eve"];
  TextEditingController searchController = TextEditingController();

  void _showMoreOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Options"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text("Supprimer les chats"),
                onTap: () {
                  setState(() {
                    chatList.clear();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.group, color: Colors.blue),
                title: const Text("Créer un groupe"),
                onTap: () {
                  // Ajouter la logique de création de groupe ici
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text("Chats"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.more_vert), onPressed: _showMoreOptions),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Rechercher un chat...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Icon(Icons.mic, color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(chatList[index]),
                  subtitle: const Text("Dernier message..."),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(username: chatList[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          // Rediriger vers la liste de contacts pour ajouter un chat
        },
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String username;
  ChatScreen({required this.username});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messages = [];
  TextEditingController messageController = TextEditingController();

  void sendMessage(String type, {String? content}) {
    if (type == "text" && messageController.text.isEmpty) return;

    setState(() {
      messages.add({
        "type": type,
        "content": content ?? messageController.text,
        "isMe": true,
      });
    });

    messageController.clear();
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.image, color: Colors.green),
              title: const Text("Image"),
              onTap: () {
                sendMessage("image", content: "📷 Image");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_call, color: Colors.red),
              title: const Text("Vidéo"),
              onTap: () {
                sendMessage("video", content: "🎥 Vidéo");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.audiotrack, color: Colors.blue),
              title: const Text("Audio"),
              onTap: () {
                sendMessage("audio", content: "🎵 Audio");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.insert_drive_file, color: Colors.orange),
              title: const Text("Document"),
              onTap: () {
                sendMessage("document", content: "📄 Document");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.purple),
              title: const Text("Contact"),
              onTap: () {
                sendMessage("contact", content: "👤 Contact");
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    return Align(
      alignment: message["isMe"] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message["isMe"] ? Colors.blue[300] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(message["content"]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.username)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: _showAttachmentOptions,
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Écrire un message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () => sendMessage("text"),
                ),
                IconButton(
                  icon: const Icon(Icons.mic, color: Colors.green),
                  onPressed: () {
                    sendMessage("voice", content: "🎤 Voice message");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
