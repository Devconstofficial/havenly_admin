 import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  final List<Map<String, dynamic>> analytics = [
    {
      "name": "Sunset Grill",
      "views": "220",
      "saves": "30",
      "clicks": "48",
    },
    {
      "name": "Ocean Breeze Café",
      "views": "185",
      "saves": "22",
      "clicks": "36",
    },
    {
      "name": "Tech Nova",
      "views": "310",
      "saves": "40",
      "clicks": "75",
    },
    {
      "name": "Mountain Bikes Co.",
      "views": "145",
      "saves": "18",
      "clicks": "29",
    },
    {
      "name": "Urban Styles",
      "views": "198",
      "saves": "27",
      "clicks": "33",
    },
    {
      "name": "GreenGrocers",
      "views": "270",
      "saves": "35",
      "clicks": "52",
    },
    {
      "name": "Vintage Vault",
      "views": "132",
      "saves": "16",
      "clicks": "24",
    },
    {
      "name": "Cosmic Fitness",
      "views": "390",
      "saves": "48",
      "clicks": "66",
    },
    {
      "name": "Luxe Lounge",
      "views": "220",
      "saves": "29",
      "clicks": "41",
    },
    {
      "name": "Happy Paws",
      "views": "248",
      "saves": "31",
      "clicks": "44",
    },
    {
      "name": "AutoFix Garage",
      "views": "175",
      "saves": "19",
      "clicks": "28",
    },
    {
      "name": "Gadget Zone",
      "views": "320",
      "saves": "44",
      "clicks": "59",
    },
    {
      "name": "Fresh Bakes",
      "views": "205",
      "saves": "24",
      "clicks": "35",
    },
    {
      "name": "City Spa",
      "views": "188",
      "saves": "21",
      "clicks": "30",
    },
    {
      "name": "Cloud Nine Events",
      "views": "140",
      "saves": "14",
      "clicks": "22",
    },
    {
      "name": "Studio Zen",
      "views": "273",
      "saves": "38",
      "clicks": "49",
    },
    {
      "name": "Book Barn",
      "views": "115",
      "saves": "10",
      "clicks": "17",
    },
    {
      "name": "Pixel Prints",
      "views": "294",
      "saves": "39",
      "clicks": "60",
    },
    {
      "name": "Epic Threads",
      "views": "161",
      "saves": "20",
      "clicks": "26",
    },
    {
      "name": "Royal Treats",
      "views": "237",
      "saves": "33",
      "clicks": "45",
    },
  ];


  var currentPage1 = 1.obs;
  final int itemsPerPage = 4;
  final int pagesPerGroup = 5;

  int get totalPages => (analytics.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage1.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return analytics.sublist(start, end > analytics.length ? analytics.length : end);
  }

  int get currentGroup => ((currentPage1.value - 1) / pagesPerGroup).floor();

  List<int> get visiblePageNumbers {
    int startPage = currentGroup * pagesPerGroup + 1;
    int endPage = (startPage + pagesPerGroup - 1).clamp(1, totalPages);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) currentPage1.value = page;
  }

  void goToNextPage() {
    if (currentPage1.value < totalPages) {
      currentPage1.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPage1.value > 1) {
      currentPage1.value--;
    }
  }
}