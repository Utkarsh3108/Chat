import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName; // Variable to store the username
  final String status; // Variable to store the user's status

  const ChatScreen({
    super.key,
    required this.userName,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final initial = userName.isNotEmpty
        ? userName[0]
        : '?'; // Initial for the avatar

    // Example chat messages (to be replaced with actual data)
    final List<Map<String, String>> chatMessages = [
      {'type': 'receiver', 'message': 'Hello! How are you?', 'time': '2:15 PM'},
      {
        'type': 'sender',
        'message': 'I\'m good, thanks! What about you?',
        'time': '2:16 PM',
      },
      {
        'type': 'receiver',
        'message': 'I\'m doing well! Working on a project.',
        'time': '2:17 PM',
      },
      {
        'type': 'sender',
        'message': 'That\'s great! Keep it up!',
        'time': '2:18 PM',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Row(
          children: [
            // Avatar with the same gradient as the user row
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  initial,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12), // Space between the avatar and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName, // User's name
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4), // Space between name and status
                Text(
                  status, // User's status (online, 5 mins ago, etc.)
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(
                      117,
                      117,
                      117,
                      1,
                    ), // Lighter color for the status
                  ),
                ),
              ],
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            thickness: 1,
            color: Color.fromARGB(255, 245, 245, 245),
            height: 0.1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: chatMessages.length,
          itemBuilder: (context, index) {
            final message = chatMessages[index];
            final isSender = message['type'] == 'sender';
            final messageTime = message['time'];
            final messageText = message['message'];

            return Align(
              alignment: isSender
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isSender)
                      // Receiver's Avatar (left)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            initial, // Use the receiver's initial
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    // Chat bubble
                    Column(
                      crossAxisAlignment: isSender?CrossAxisAlignment.end:CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6,
                          ),
                          decoration: BoxDecoration(
                            color: isSender
                                ? Colors.blue
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(isSender ? 16 : 4),
                              topRight: Radius.circular(isSender ? 4 : 16),
                              bottomLeft: const Radius.circular(16),
                              bottomRight: const Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messageText!,
                                style: TextStyle(
                                  color: isSender ? Colors.white : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Time for the message
                              if (messageTime != null)
                                Text(
                                  messageTime,
                                  style: const TextStyle(
                                    color: Colors.grey, // Time in black
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSender) const SizedBox(width: 8),
                    if (isSender)
                      // Sender's Avatar (right)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            initial, // Use the sender's initial
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
