class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
   static final List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: 'assets/lottie/security.json',
      title: 'Ultra Secure',
      description:
"End-to-end encryption ensures your messages stay private and secure from prying eyes."    ),
    OnBoardingModel(
      image: 'assets/lottie/privacy.json',
      title: 'Privacy First',
      description:
"No data collection, no tracking. Your conversations belong to you and you alone."    ),
    OnBoardingModel(
      image: 'assets/lottie/add_friend.json',
      title: 'Friend Requests Only',
      description:
"Only chat with people you trust. Send and accept friend requests to start conversations."    ),
  ];

}
