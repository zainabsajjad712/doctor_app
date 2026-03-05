// import 'package:doctor_app/router/app_routes.dart';
// import 'package:get/get.dart';
// import 'news_model.dart';

// class NewsController extends GetxController {
//   RxString selectedCategory = "All".obs;

//   final categories = ["All", "Covid-19", "Healthy Living", "Common Disease"];

//   final RxList<NewsModel> allNews = <NewsModel>[
//     NewsModel(
//       title:
//           "How to use cool compresses to reduce fever after vaccination against COVID-19?",
//       category: "Covid-19",
//       image: "https://images.unsplash.com/photo-1498837167922-ddd27525d352",
//       description: "Fever is caused by an increase in body temperature...",
//       time: "30 minutes ago",
//     ),
//     NewsModel(
//       title: "Healthy fruits improve immunity",
//       category: "Healthy Living",
//       image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
//       description: "Eating fruits daily boosts immune system...",
//       time: "1 hour ago",
//     ),
//   ].obs;

//   RxList<NewsModel> filteredNews = <NewsModel>[].obs;

//   @override
//   void onInit() {
//     filteredNews.assignAll(allNews);
//     super.onInit();
//   }

//   void selectCategory(String category) {
//     selectedCategory.value = category;

//     if (category == "All") {
//       filteredNews.assignAll(allNews);
//     } else {
//       filteredNews.assignAll(
//         allNews.where((e) => e.category == category).toList(),
//       );
//     }
//   }

//   void goToDetail(NewsModel news) {
//     Get.toNamed(AppRoutes.newsdetail, arguments: news);
//   }
// }
import 'package:doctor_app/router/app_routes.dart';
import 'package:get/get.dart';
import 'news_model.dart';

class NewsController extends GetxController {
  RxString selectedCategory = "All".obs;
  void goToDetail(NewsModel news) {
    Get.toNamed('/news_detail', arguments: news);
  }

  final categories = ["All", "Covid-19", "Healthy Living", "Common Disease"];

  final RxList<NewsModel> allNews = <NewsModel>[
    NewsModel(
      title:
          "How to use cool compresses to reduce fever after vaccination against COVID-19?",
      category: "Covid-19",
      image: "https://images.unsplash.com/photo-1498837167922-ddd27525d352",
      description: "Fever is caused by an increase in body temperature...",
      time: "30 minutes ago",
    ),

    NewsModel(
      title: "COVID-19 Booster Dose: Who Should Get It?",
      category: "Covid-19",
      image: "https://images.unsplash.com/photo-1612277795421-9bc7706a4a34",
      description:
          "Booster doses help increase immunity against new variants...",
      time: "10 minutes ago",
    ),

    NewsModel(
      title: "New COVID-19 Variant Symptoms Explained",
      category: "Covid-19",
      image: "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144",
      description:
          "Doctors explain the symptoms of the latest COVID variant...",
      time: "25 minutes ago",
    ),

    // NewsModel(
    //   title: "How Masks Reduce the Spread of COVID-19",
    //   category: "Covid-19",
    //   image: "https://images.unsplash.com/photo-1584467735871-8f1cba4e0d7f",
    //   description:
    //       "Wearing masks can significantly reduce virus transmission...",
    //   time: "1 hour ago",
    // ),
    NewsModel(
      title: "Post-COVID Recovery: What You Should Know",
      category: "Covid-19",
      image: "https://images.unsplash.com/photo-1600959907703-125ba1374a12",
      description:
          "Recovery after COVID may take time depending on severity...",
      time: "2 hours ago",
    ),

    // -------------------- HEALTHY LIVING --------------------
    NewsModel(
      title: "5 Daily Habits for a Healthier Life",
      category: "Healthy Living",
      image: "https://images.unsplash.com/photo-1490645935967-10de6ba17061",
      description:
          "Simple daily habits can improve your physical and mental health...",
      time: "15 minutes ago",
    ),

    // NewsModel(
    //   title: "Benefits of Morning Exercise",
    //   category: "Healthy Living",
    //   image: "https://images.unsplash.com/photo-1558611848-73f7eb4001ab",
    //   description: "Morning workouts boost metabolism and energy levels...",
    //   time: "40 minutes ago",
    // ),
    NewsModel(
      title: "Importance of Drinking Enough Water",
      category: "Healthy Living",
      image: "https://images.unsplash.com/photo-1502741338009-cac2772e18bc",
      description: "Staying hydrated improves digestion and brain function...",
      time: "1 hour ago",
    ),

    NewsModel(
      title: "Balanced Diet: What Should Be on Your Plate?",
      category: "Healthy Living",
      image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
      description:
          "A balanced diet includes proteins, carbs, and healthy fats...",
      time: "3 hours ago",
    ),

    // NewsModel(
    //   title: "Healthy fruits improve immunity",
    //   category: "Healthy Living",
    //   image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
    //   description: "Eating fruits daily boosts immune system...",
    //   time: "1 hour ago",
    // ),
    NewsModel(
      title: "How Daily Walking Improves Heart Health",
      category: "Healthy Living",
      image:
          "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=800&q=60",
      description:
          "A 30-minute walk daily can reduce heart disease risk and improve blood circulation.",
      time: "20 minutes ago",
    ),
    NewsModel(
      title: "Common Cold: Symptoms and Treatment",
      category: "Common Disease",
      image: "https://images.unsplash.com/photo-1585435557343-3b092031a831",
      description:
          "Common cold is a viral infection affecting the nose and throat...",
      time: "45 minutes ago",
    ),

    NewsModel(
      title: "How to Prevent Seasonal Flu",
      category: "Common Disease",
      image: "https://images.unsplash.com/photo-1600959907703-125ba1374a12",
      description:
          "Seasonal flu can be prevented with proper hygiene and vaccination...",
      time: "2 hours ago",
    ),
  ].obs;

  RxList<NewsModel> filteredNews = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredNews.assignAll(allNews);

    final args = Get.arguments;

    if (args != null && args["query"] != null) {
      applySearch(args["query"]);
    }
  }

  /// 🔥 Search Filter (Flexible)
  void applySearch(String query) {
    final formattedQuery = query.toLowerCase().trim();

    filteredNews.assignAll(
      allNews
          .where(
            (news) =>
                news.category.toLowerCase() == formattedQuery ||
                news.title.toLowerCase().contains(formattedQuery),
          )
          .toList(),
    );

    // Agar category exact match kare to highlight bhi kare
    if (categories.contains(query)) {
      selectedCategory.value = query;
    } else {
      selectedCategory.value = "All";
    }
  }

  /// 🔥 Category Button Filter (Exact Match)
  void selectCategory(String category) {
    selectedCategory.value = category;

    if (category == "All") {
      filteredNews.assignAll(allNews);
    } else {
      filteredNews.assignAll(
        allNews.where((news) => news.category == category).toList(),
      );
    }
  }
}

void goToDetail(NewsModel news) {
  Get.toNamed(AppRoutes.newsdetail, arguments: news);
}
