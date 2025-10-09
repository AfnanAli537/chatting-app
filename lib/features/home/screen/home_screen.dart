import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final List<Map<String, dynamic>> chats = [
      {
        'avatar': 'A',
        'name': 'Design Team',
        'message': 'alice.smith: Great work on the new...',
        'time': '2h ago',
        'unreadCount': 0,
      },
      {
        'avatar': 'W',
        'name': 'Weekend Plans',
        'message': 'emma.brown: How about hiking th...',
        'time': '4h ago',
        'unreadCount': 1,
      },
      {
        'avatar': 'A',
        'name': 'alice_smith',
        'message': 'Hey! How are you doing?',
        'time': 'Just now',
        'unreadCount': 3,
      },
      {
        'avatar': 'S',
        'name': 'sarah_wilson',
        'message': 'Are we still meeting tomorrow?',
        'time': '1h ago',
        'unreadCount': 0,
      },
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(top: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome back, afnan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Your secure conversations',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: 16.w, top: 10.h),
      //     child: Container(
      //       width: 60.w,
      //       padding: EdgeInsets.symmetric(vertical: 8.h),
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(12.r),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.black.withOpacity(0.1),
      //             blurRadius: 6,
      //             offset: const Offset(0, 3),
      //           ),
      //         ],
      //       ),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           const Icon(Icons.notifications_active_outlined,
      //               color: Colors.red),
      //           SizedBox(height: 3.h),
      //           const Text(
      //             '6',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold, fontSize: 14),
      //           ),
      //           const Text(
      //             'Unread',
      //             style: TextStyle(color: Colors.grey, fontSize: 12),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ],
    ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    // 🔍 Search Field
                    TextField(
                     onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          cursorColor: Colors.grey[600],
          
                      decoration: InputDecoration(
                        isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                        hintText: 'Search Conversations..',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        color: Colors.grey[600],
                        ),
                        prefixIcon:
                             Icon(Icons.search_outlined, color: Colors.grey[500],size: 20,),
                        filled: true,
                        // fillColor: Colors.grey.shade300,
                       fillColor:Colors.grey[200] ,
                      
                        // contentPadding: EdgeInsets.symmetric(
                        //     vertical: 0.h, horizontal: 10.w),
                        border: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                          
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // ➕ Create Group Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {Navigator.pushNamed(context,AppRoutes.create);},
                        icon: const Icon(Icons.add, size: 20),
                        label: const Text('Create Group'),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // 🔔 Unread Card (only this, no contacts)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.notifications_active_outlined,
                              color: Colors.red),
                          SizedBox(height: 4.h),
                          const Text(
                            '6',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text(
                            'Unread',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // 💬 Conversations Header
                    Row(
                      spacing: 4.w,
                      children: [
                        Icon(Icons.message_outlined),
                        
                        Text(
                          'Conversations',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),

              // 📨 Conversations List
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final chat = chats[index];
                    return Column(
                      children: [
                    _chatTile(
                      context: context,
                      avatar: chat['avatar'],
                      name: chat['name'],
                      message: chat['message'],
                      time: chat['time'],
                      unreadCount: chat['unreadCount'],
                    ),
                    if (index != chats.length - 1) // no divider after last
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
            ),
             ], );
                  },
                  
                  childCount: chats.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🧱 Chat Item Widget
  Widget _chatTile({
    required String avatar,
    required String name,
    required String message,
    required String time,
    required int unreadCount, required BuildContext context,
  }) {
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, AppRoutes.chat),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(bottom: 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Text(
              avatar,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              if (unreadCount > 0)
                Container(
                  margin: EdgeInsets.only(top: 4.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    unreadCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
           
            ],
          ),
        ),
      ),
    );
  }
}
























// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool _isSearching = false;
//   bool _isCreatingGroup = false;
//   bool _isShowingUnread = false;
//   final TextEditingController _searchController = TextEditingController();

//   final List<Map<String, dynamic>> chats = [
//     {
//       'avatar': 'A',
//       'name': 'Design Team',
//       'message': 'alice.smith: Great work on the new...',
//       'time': '2h ago',
//       'unreadCount': 0,
//     },
//     {
//       'avatar': 'W',
//       'name': 'Weekend Plans',
//       'message': 'emma.brown: How about hiking th...',
//       'time': '4h ago',
//       'unreadCount': 1,
//     },
//     {
//       'avatar': 'A',
//       'name': 'alice_smith',
//       'message': 'Hey! How are you doing?',
//       'time': 'Just now',
//       'unreadCount': 3,
//     },
//     {
//       'avatar': 'S',
//       'name': 'sarah_wilson',
//       'message': 'Are we still meeting tomorrow?',
//       'time': '1h ago',
//       'unreadCount': 0,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70.h),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           titleSpacing: 0,
//           title: AnimatedSwitcher(
//             duration: const Duration(milliseconds: 300),
//             child: _buildAppBarContent(context),
//           ),
//           actions: _buildAppBarActions(),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(14.w),
//           child: CustomScrollView(
//             slivers: [
//               // Unread Card only shown when not in unread mode (since unread appears in AppBar then)
//               if (!_isShowingUnread)
//                 // SliverToBoxAdapter(
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [
//                 //       // Container(
//                 //       //   width: double.infinity,
//                 //       //   padding: EdgeInsets.symmetric(vertical: 20.h),
//                 //       //   decoration: BoxDecoration(
//                 //       //     color: Colors.white,
//                 //       //     borderRadius: BorderRadius.circular(12.r),
//                 //       //     boxShadow: [
//                 //       //       BoxShadow(
//                 //       //         color: Colors.black.withOpacity(0.05),
//                 //       //         blurRadius: 6,
//                 //       //         offset: const Offset(0, 3),
//                 //       //       ),
//                 //       //     ],
//                 //       //   ),
//                 //       //   child: Column(
//                 //       //     children: [
//                 //       //       const Icon(Icons.notifications_active_outlined,
//                 //       //           color: Colors.red),
//                 //       //       SizedBox(height: 4.h),
//                 //       //       const Text(
//                 //       //         '6',
//                 //       //         style: TextStyle(
//                 //       //             fontWeight: FontWeight.bold, fontSize: 18),
//                 //       //       ),
//                 //       //       const Text(
//                 //       //         'Unread',
//                 //       //         style: TextStyle(color: Colors.grey),
//                 //       //       ),
//                 //       //     ],
//                 //       //   ),
//                 //       // ),
//                 //       // SizedBox(height: 20.h),

//                 //       // Conversations Header
//                 //       Text(
//                 //         'Conversations',
//                 //         style: TextStyle(
//                 //           fontSize: 18.sp,
//                 //           fontWeight: FontWeight.bold,
//                 //         ),
//                 //       ),
//                 //       SizedBox(height: 10.h),
//                 //     ],
//                 //   ),
//                 // ),

//               // Chat list
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     final chat = chats[index];
//                     return _chatTile(
//                       avatar: chat['avatar'],
//                       name: chat['name'],
//                       message: chat['message'],
//                       time: chat['time'],
//                       unreadCount: chat['unreadCount'],
//                     );
//                   },
//                   childCount: chats.length,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔹 Build AppBar content dynamically
//   Widget _buildAppBarContent(BuildContext context) {
//     if (_isSearching) {
//       return TextField(
//         key: const ValueKey('search'),
//         controller: _searchController,
//         autofocus: true,
//         cursorColor: Colors.grey[600],
//         decoration: InputDecoration(
//           hintText: 'Search Conversations...',
//           hintStyle: TextStyle(color: Colors.grey[500]),
//           filled: true,
//           fillColor: Colors.grey[200],
//           isDense: true,
//           contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.r),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         onTapOutside: (_) => FocusScope.of(context).unfocus(),
//       );
//     }

//     if (_isCreatingGroup) {
//       return SizedBox(
//         key: const ValueKey('group'),
//         height: 40.h,
//         child: OutlinedButton.icon(
//           onPressed: () {
//             // TODO: Add group creation logic
//           },
//           icon: const Icon(Icons.add, size: 20),
//           label: const Text('Create Group'),
//           style: OutlinedButton.styleFrom(
//             padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.r),
//             ),
//             side: BorderSide(color: Colors.grey.shade300),
//           ),
//         ),
//       );
//     }

//     if (_isShowingUnread) {
//       return Column(
//         key: const ValueKey('unread'),
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.notifications_active_outlined,
//               color: Colors.red, size: 26),
//           const SizedBox(height: 4),
//           const Text(
//             '6 Unread',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//           ),
//         ],
//       );
//     }

//     return Column(
//       key: const ValueKey('default'),
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "afnan 's chats",
//           style: TextStyle(
//             fontSize: 20.sp,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         // SizedBox(height: 2.h),
//         // Text(
//         //   'Your secure conversations',
//         //   style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
//         // ),
//       ],
//     );
//   }

//   // 🔹 Build dynamic AppBar actions
//   List<Widget> _buildAppBarActions() {
//     if (_isSearching || _isCreatingGroup || _isShowingUnread) {
//       return [
//         IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () {
//             setState(() {
//               _isSearching = false;
//               _isCreatingGroup = false;
//               _isShowingUnread = false;
//               _searchController.clear();
//             });
//           },
//         )
//       ];
//     }

//     return [
//       IconButton(
//         icon: const Icon(Icons.search_outlined, color: Colors.black),
//         onPressed: () {
//           setState(() {
//             _isSearching = true;
//           });
//         },
//       ),
//       IconButton(
//         icon: const Icon(Icons.group_add_outlined, color: Colors.black),
//         onPressed: () {
//           setState(() {
//             _isCreatingGroup = true;
//           });
//         },
//       ),
//       Stack(
//   children: [
//     IconButton(
//       icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
//       onPressed: () {
//         setState(() {
//           _isShowingUnread = true;
//         });
//       },
//     ),

//     // 🔴 Notification badge
//     Positioned(
//       right: 6,
//       top: 6,
//       child: Container(
//         padding: const EdgeInsets.all(4),
//         decoration: const BoxDecoration(
//           color: Colors.red,
//           shape: BoxShape.circle,
//         ),
//         constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
//         child: const Center(
//           child: Text(
//             '6', // Number of unread notifications
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 11,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),

//       // IconButton(
//       //   icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
//       //   onPressed: () {
//       //     setState(() {
//       //       _isShowingUnread = true;
//       //     });
//       //   },
//       // ),
//       SizedBox(width: 6.w),
//     ];
//   }

//   // 🧱 Chat Item
//   Widget _chatTile({
//     required String avatar,
//     required String name,
//     required String message,
//     required String time,
//     required int unreadCount,
//   }) {
//     return Card(
//       elevation: 0,
//       margin: EdgeInsets.only(bottom: 10.h),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       color: Colors.white,
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.grey.shade300,
//           child: Text(
//             avatar,
//             style: const TextStyle(color: Colors.black),
//           ),
//         ),
//         title: Text(
//           name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(
//           message,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(color: Colors.grey[600]),
//         ),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               time,
//               style: const TextStyle(fontSize: 10, color: Colors.grey),
//             ),
//             if (unreadCount > 0)
//               Container(
//                 margin: EdgeInsets.only(top: 4.h),
//                 padding:
//                     EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: Text(
//                   unreadCount.toString(),
//                   style: const TextStyle(color: Colors.white, fontSize: 10),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
