import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  final String name;
  final String role;
  final String message;
  final String imagePath;

  const ChatBot({
    Key? key,
    required this.name,
    required this.role,
    required this.message,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 199, 169),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 65,
        backgroundColor: const Color.fromARGB(255, 190, 236, 195),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Image.asset(
              'assets/logo.png',
              height: 50,
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    size: 28,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context,'/Profile');
                  },
                ),
                const Text(
                  "Vicky",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.imagePath, height: 20),
                const SizedBox(width: 10),
                Text(
                  widget.role,
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Stack(
              children: [
                // Chat Area
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfa90fde9), // Chat area background color
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(top: 40), // Add padding for user info
                  child: Column(
                    children: [
                      // Chat Messages Section
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _messages.length,
                          itemBuilder: (context, index) {
                            final message = _messages[index];
                            final isUser = message['sender'] == 'user';
                            return Align(
                              alignment: isUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: isUser ? Colors.blue[100] : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  message['text']!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (_isTyping)
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Typing...",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      // Input Field Section - Fixed at the Bottom
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White background for input area
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                decoration: const InputDecoration(
                                  hintText: "Type your message...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.send,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                final userMessage = _controller.text.trim();
                                if (userMessage.isNotEmpty) {
                                  setState(() {
                                    _messages.add(
                                        {"sender": "user", "text": userMessage});
                                    _controller.clear();
                                    _isTyping = true;
                                  });

                                  Future.delayed(const Duration(seconds: 2), () {
                                    setState(() {
                                      _messages.add({
                                        "sender": "bot",
                                        "text": widget.message
                                      });
                                      _isTyping = false;
                                    });
                                    _scrollController.animateTo(
                                      _scrollController.position.maxScrollExtent,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // User Info Section - Overlays Chat Area
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            child: Image.asset(widget.imagePath, width: 30, height: 30),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Joined the Chat',
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "(c) Mpuza Inc",
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
