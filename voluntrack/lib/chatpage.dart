import 'package:flutter/material.dart';

class GroupChatsPage extends StatefulWidget {
  @override
  _GroupChatsPageState createState() => _GroupChatsPageState();
}

class _GroupChatsPageState extends State<GroupChatsPage> {
  final List<Map<String, String>> groups = [
    {
      'initials': 'FA',
      'groupName': 'Family Group',
      'lastMessage': "Mom: Don't forget the family dinner tonight!",
      'time': '2m ago',
      'unread': '3',
    },
    {
      'initials': 'WO',
      'groupName': 'Work Team',
      'lastMessage': "Alice: I've uploaded the latest project files.",
      'time': '10m ago',
      'unread': '0',
    },
    {
      'initials': 'BO',
      'groupName': 'Book Club',
      'lastMessage': 'John: What did everyone think of chapter 5?',
      'time': '1h ago',
      'unread': '5',
    },
    {
      'initials': 'GY',
      'groupName': 'Gym Buddies',
      'lastMessage': "Sarah: Who's up for a run this weekend?",
      'time': '3h ago',
      'unread': '0',
    },
    {
      'initials': 'TR',
      'groupName': 'Travel Planning',
      'lastMessage': 'Mike: I found some great deals on flights!',
      'time': '1d ago',
      'unread': '2',
    },
  ];

  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Group Chats',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search groups...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                final bool isHovered = index == hoveredIndex;

                return MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      hoveredIndex = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      hoveredIndex = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            groupName: group['groupName']!,
                          ),
                        ),
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      color: isHovered ? Colors.grey[200] : Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Text(
                            group['initials']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        title: Text(
                          group['groupName']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(group['lastMessage']!),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(group['time']!,
                                style: TextStyle(fontSize: 12)),
                            if (group['unread'] != '0')
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  group['unread']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String groupName;

  ChatScreen({required this.groupName});

  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Alice',
      'text': "Hey everyone! How's it going?",
      'time': '10:00 AM',
      'isMe': false
    },
    {
      'sender': 'Bob',
      'text': 'Hi Alice! All good here. How about you?',
      'time': '10:02 AM',
      'isMe': false
    },
    {
      'sender': 'You',
      'text': "Hello! I'm doing great, thanks for asking!",
      'time': '10:05 AM',
      'isMe': true
    },
    {
      'sender': 'Charlie',
      'text': 'Has anyone started on the project yet?',
      'time': '10:10 AM',
      'isMe': false
    },
    {
      'sender': 'You',
      'text': "I've made some progress. We can discuss it in our next meeting.",
      'time': '10:12 AM',
      'isMe': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['isMe'];
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['text'],
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          message['time'],
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Handle send action
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
