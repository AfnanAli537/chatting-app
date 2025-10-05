// import 'package:chatting_app/core/routes/app_routes.dart';
// import 'package:chatting_app/core/utils/app_colors.dart';
// import 'package:chatting_app/models/models/onboarding_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   final PageController _controller = PageController();
//   int _currentPage = 0;

//   void _onNext() {
//     if (_currentPage == OnBoardingModel.pages.length - 1) {
//       // Navigate to login or home
//       Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
//     } else {
//       _controller.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () => Navigator.pushReplacementNamed(
//                   context,
//                   AppRoutes.onboarding,
//                 ),
//                 style:
//                     TextButton.styleFrom(
//                       foregroundColor: AppColors.grey400, // default color
//                       overlayColor: Colors.transparent, // remove ripple
//                     ).copyWith(
//                       foregroundColor: WidgetStateProperty.resolveWith<Color>((
//                         states,
//                       ) {
//                         if (states.contains(WidgetState.hovered)) {
//                           return AppColors.black; // black on hover
//                         }
//                         return AppColors.grey400; // default
//                       }),
//                     ),
//                 child: const Text('Skip'),
//               ),
//             ),
//             Expanded(
//               child: PageView.builder(
//                 controller: _controller,
//                 itemCount: OnBoardingModel.pages.length,
//                 onPageChanged: (index) => setState(() => _currentPage = index),
//                 itemBuilder: (context, index) {
//                   final page = OnBoardingModel.pages[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(24),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: 60,
//                           backgroundColor: Colors.grey.shade200,
//                           child: Lottie.asset(page.image, height: 80),
//                         ),
//                         SizedBox(height: 40.h),
//                         Text(
//                           page.title,
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 16.h),
//                         Text(
//                           page.description,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: AppColors.grey500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 OnBoardingModel.pages.length,
//                 (index) => AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                   height: 6,
//                   width: _currentPage == index ? 20 : 6,
//                   decoration: BoxDecoration(
//                     color: _currentPage == index
//                         ? AppColors.black
//                         : AppColors.grey400,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 40.h),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton.icon(
//                     onPressed: _currentPage > 0
//                         ? () {
//                             _controller.previousPage(
//                               duration: const Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           }
//                         : null,
//                     icon: const Icon(Icons.arrow_back_ios, size: 14),
//                     label: const Text("Previous"),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.black,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 12,
//                       ),
//                     ),
//                     onPressed: _onNext,
//                     child: Text(
//                       _currentPage == OnBoardingModel.pages.length - 1
//                           ? "Get Started"
//                           : "Next",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 24.h),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:chatting_app/core/utils/app_colors.dart';
import 'package:chatting_app/models/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _onNext() {
    if (_currentPage == OnBoardingModel.pages.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.centerRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.login,
                    ),
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return AppColors.black; // black on hover
                        }
                        return AppColors.grey500; // default
                      }),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                    child:
                     Text('Skip', style: TextStyle(fontSize: 16.sp)),
                  ),
                ),
              ),

              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: OnBoardingModel.pages.length,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) {
                    final page = OnBoardingModel.pages[index];
                    return CustomScrollView(
  slivers: [
    SliverFillRemaining(
      hasScrollBody: false, // makes content center vertically if short
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie Animation
          CircleAvatar(
            radius: 80.r,
            backgroundColor: Colors.grey.shade200,
            child: Lottie.asset(page.image, height: 120.h),
          ),
          SizedBox(height: 40.h),

          // Title
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.grey500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    ),
  ],
);

                    // return CustomScrollView(
                    //   slivers: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       // Lottie Animation
                    //       CircleAvatar(
                                         
                    //           radius: 80.r,
                    //           backgroundColor: Colors.grey.shade200,
                        
                    //         child: Lottie.asset(page.image, height: 120.h),
                    //       ),
                    //       SizedBox(height: 40.h),
                      
                    //       // Title
                    //       Text(
                    //         page.title,
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           fontSize: 26.sp,
                    //           fontWeight: FontWeight.bold,
                    //           color: AppColors.black,
                    //         ),
                    //       ),
                    //       SizedBox(height: 16.h),
                      
                    //       // Description
                    //       Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 14.w),
                    //         child: Text(
                    //           page.description,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             fontSize: 16.sp,
                    //             color: AppColors.grey500,
                    //             height: 1.4,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                ),
              ),
Stack(
  alignment: Alignment.center,
  children: [
    // Row for buttons
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Previous button
        TextButton.icon(
          onPressed: _currentPage > 0
              ? () {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              : null,
          icon: Icon(Icons.arrow_back_ios, size: 14.sp),
          label: Text("Previous", style: TextStyle(fontSize: 14.sp)),
        ),
TextButton(
  style: TextButton.styleFrom(
    backgroundColor: AppColors.blackColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 14.w,
      vertical: 8.h,
    ),
  ),
  onPressed: _onNext,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        _currentPage == OnBoardingModel.pages.length - 1
            ? "Get Started"
            : "Next",
        style: TextStyle(fontSize: 14.sp, color: Colors.white),
      ),
      SizedBox(width: 6.w),
      Icon(
        Icons.arrow_forward_ios,
        size: 14.sp,
        color: Colors.white,
      ),
    ],
  ),
),
],
    ),

    // Centered dots indicator
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnBoardingModel.pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 6.h,
          width: _currentPage == index ? 18.w : 6.w,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? AppColors.black
                : AppColors.grey400,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    ),
  ],
),

            //   Row(
            //     mainAxisSize: MainAxisSize.max,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // Navigation Buttons
            //       TextButton.icon(
            //         onPressed: _currentPage > 0
            //             ? () {
            //                 _controller.previousPage(
            //                   duration: const Duration(milliseconds: 300),
            //                   curve: Curves.easeInOut,
            //                 );
            //               }
            //             : null,
            //         icon: Icon(Icons.arrow_back_ios, size: 14.sp),
            //         label: Text("Previous", style: TextStyle(fontSize: 14.sp)),
            //       ),
            //       // Dots Indicator
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: List.generate(
            //           OnBoardingModel.pages.length,
            //           (index) => AnimatedContainer(
            //             duration: const Duration(milliseconds: 300),
            //             margin: EdgeInsets.symmetric(horizontal: 4.w),
            //             height: 6.h,
            //             width: _currentPage == index ? 18.w : 6.w,
            //             decoration: BoxDecoration(
            //               color: _currentPage == index
            //                   ? AppColors.black
            //                   : AppColors.grey400,
            //               borderRadius: BorderRadius.circular(10.r),
            //             ),
            //           ),
            //         ),
            //       ),

            //       SizedBox(height: 20.w),
            //       ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: const Color.fromARGB(255, 27, 27, 27),
            //           foregroundColor: Colors.white,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12.r),
            //           ),
            //           padding: EdgeInsets.symmetric(
            //             horizontal: 20.w,
            //             vertical: 8.h,
            //           ),
            //         ),
            //         onPressed: _onNext,
            //         child: Text(
            //           _currentPage == OnBoardingModel.pages.length - 1
            //               ? "Get Started"
            //               : "Next",
            //           style: TextStyle(fontSize: 16.sp),
            //         ),
            //       ),
            //     ],
            //   ), // SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
