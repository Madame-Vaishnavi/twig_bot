import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final List<Map<String,dynamic>> messages;
  const MessageScreen({Key? key, required this.messages}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context,index){
        bool isUserMessage = widget.messages[index]['isUserMessage'];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isUserMessage) ...[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xFF2D5F3F),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'X',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isUserMessage 
                        ? Color(0xFF4CAF50) 
                        : Color(0xFF1E4D2E),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  child: Text(
                    widget.messages[index]['message'].text.text[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              if (isUserMessage) ...[
                SizedBox(width: 8),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ],
          ),
        );
      },
      separatorBuilder: (_,i)=> SizedBox(height: 8),
      itemCount: widget.messages.length,
    );
  }
}
