import 'package:flutter/material.dart';

class CommunityForumPage extends StatefulWidget {
  @override
  _CommunityForumPageState createState() => _CommunityForumPageState();
}

class _CommunityForumPageState extends State<CommunityForumPage> {
  final List<Map<String, dynamic>> discussions = [
    {"question": "What is the best EV for long trips?", "answers": ["Tesla Model S is great🔥", "Try Lucid Air. 😊"], "likes": 10},
    {"question": "How to increase EV battery life?", "answers": ["Avoid fast charging often. ⚡", "Keep battery between 20-80%. 👍"], "likes": 7},
    {"question": "Best affordable EVs in 2025?", "answers": ["Nissan Leaf 🚗", "Chevy Bolt 💰"], "likes": 8},
    {"question": "What are the best home charging solutions?", "answers": ["Level 2 chargers are ideal. 🔌", "Tesla Wall Connector. ⚡"], "likes": 4},
    {"question": "EV insurance – What should I consider?", "answers": ["Look for battery coverage. 🛡️", "Compare multiple providers. 📑"], "likes": 3},
  ];

  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();

  void _likePost(int index) {
    setState(() {
      discussions[index]['likes']++;
    });
  }

  void _addQuestion() {
    if (_questionController.text.isNotEmpty) {
      setState(() {
        discussions.insert(0, {"question": _questionController.text, "answers": [], "likes": 0});
        _questionController.clear();
      });
    }
  }

  void _addReply(int index) {
    if (_replyController.text.isNotEmpty) {
      setState(() {
        discussions[index]['answers'].add(_replyController.text);
        _replyController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Community Forum', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.cyan, blurRadius: 10)])),
        backgroundColor: Colors.cyan[900],
        elevation: 5,
        shadowColor: Colors.cyanAccent.withOpacity(0.6),
      ),
      body: Column(
        children: [
          // Question Input
         Padding(
  padding: EdgeInsets.all(10),
  child: Row(
    children: [
      Expanded(
        child: TextField(
          controller: _questionController,
          decoration: InputDecoration(
            hintText: 'Ask a question...',
            hintStyle: TextStyle(color: Colors.deepPurpleAccent), // Hint Text in Purple
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2), // Purple Border
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 3), // Glow Effect
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.black.withOpacity(0.6), // Background Darkened
          ),
          style: TextStyle(color: Colors.white), // Input Text Color
        ),
      ),
      IconButton(
        icon: Icon(Icons.send, color: Colors.purpleAccent), // Send Icon in Purple
        onPressed: _addQuestion,
      ),
    ],
  ),
),

          
          // Discussion List
          Expanded(
            child: ListView.builder(
              itemCount: discussions.length,
              itemBuilder: (context, index) {
                return _buildNeonCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Neon-Themed Discussion Card
  Widget _buildNeonCard(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  border: Border.all(color: Colors.cyanAccent, width: 1.5), // Change Border Color
  boxShadow: [BoxShadow(color: Colors.blueAccent.withOpacity(0.4), blurRadius: 15)], // Glow Effect
  gradient: const LinearGradient(
    colors: [Colors.black, Colors.blueGrey], // Background Gradient
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
),

      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question
            Text(
              discussions[index]['question'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 5),

            // Answers List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (discussions[index]['answers'] as List<String>).map((answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      const Icon(Icons.comment, color: Colors.greenAccent, size: 18),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(answer, style: const TextStyle(color: Colors.white70)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // Like and Reply Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Like Button with Animation
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _likePost(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: Matrix4.identity()..scale(discussions[index]['likes'] > 0 ? 1.2 : 1.0),
                        child: const Icon(Icons.favorite, color: Colors.red, size: 24),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(discussions[index]['likes'].toString(), style: const TextStyle(color: Colors.white70)),
                  ],
                ),

                // Reply Input Field
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _replyController,
                          decoration: InputDecoration(
                            hintText: 'Reply...',
                            hintStyle: const TextStyle(color: Colors.white54),
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.cyanAccent),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.cyanAccent),
                        onPressed: () => _addReply(index),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
