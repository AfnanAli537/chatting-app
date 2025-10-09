import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('A', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('alice_smith',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.sp)),
                Text('Online',
                    style: TextStyle(color: Colors.green, fontSize: 12.sp)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call_outlined, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.videocam_outlined, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 8),
        ],
      ),

      // 💬 Chat Body
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Center(
                  child: Text(
                    'Oct 7, 9:14 PM',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // Received message
                _buildMessageBubble(
                  message: "Hey! How are you doing?",
                  time: "1 minute ago",
                  isMe: false,
                ),
                SizedBox(height: 10.h),

                _buildMessageBubble(
                  message: "That's wonderful to hear! Want to grab coffee later?",
                  time: "16 minutes ago",
                  isMe: false,
                ),
                SizedBox(height: 10.h),

                // Sent message
                _buildMessageBubble(
                  message: "Hi Alice! I’m doing great, thanks for asking!",
                  time: "31 minutes ago",
                  isMe: true,
                ),
              ],
            ),
          ),

          // 🔽 Bottom Input Field
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message alice_smith...',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 16.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // 🔒 Encrypted message notice
          Padding(
            padding: EdgeInsets.only(bottom: 6.h, top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 14, color: Colors.grey),
                SizedBox(width: 4.w),
                Text(
                  'Messages are end-to-end encrypted',
                  style: TextStyle(color: Colors.grey[600], fontSize: 11.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({
    required String message,
    required String time,
    required bool isMe,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isMe ? Colors.black : Colors.grey.shade300,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                topRight: Radius.circular(14.r),
                bottomLeft:
                    isMe ? Radius.circular(14.r) : const Radius.circular(0),
                bottomRight:
                    isMe ? const Radius.circular(0) : Radius.circular(14.r),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            time,
            style: TextStyle(color: Colors.grey[500], fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
