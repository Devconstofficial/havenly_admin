import 'package:get/get.dart';
import 'package:havenly_admin/utils/app_images.dart';

class ListingController extends GetxController {
  final List<Map<String, dynamic>> allListings = [
    {
      "img": kListingImage,
      "name": "Sunset Grill",
      "category": "Restaurant",
      "loc": "Grace Bay",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Ocean Breeze Café",
      "category": "Café",
      "loc": "Leeward Highway",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Tech Nova",
      "category": "Electronics",
      "loc": "Downtown",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Mountain Bikes Co.",
      "category": "Sports",
      "loc": "The Bight",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Urban Styles",
      "category": "Fashion",
      "loc": "Kew Town",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "GreenGrocers",
      "category": "Grocery",
      "loc": "Blue Hills",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Vintage Vault",
      "category": "Antiques",
      "loc": "Long Bay",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Cosmic Fitness",
      "category": "Gym",
      "loc": "Downtown",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Luxe Lounge",
      "category": "Spa",
      "loc": "Turtle Cove",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Happy Paws",
      "category": "Pet Store",
      "loc": "Five Cays",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "AutoFix Garage",
      "category": "Automotive",
      "loc": "Airport Road",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Gadget Zone",
      "category": "Electronics",
      "loc": "Kew Town",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Fresh Bakes",
      "category": "Bakery",
      "loc": "Grace Bay",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "City Spa",
      "category": "Spa",
      "loc": "Downtown",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Cloud Nine Events",
      "category": "Event Planning",
      "loc": "Leeward Highway",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Studio Zen",
      "category": "Wellness",
      "loc": "The Bight",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Book Barn",
      "category": "Bookstore",
      "loc": "Turtle Cove",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Pixel Prints",
      "category": "Printing",
      "loc": "Blue Hills",
      "status": "Active",
    },
    {
      "img": kListingImage,
      "name": "Epic Threads",
      "category": "Clothing",
      "loc": "Grace Bay",
      "status": "Paused",
    },
    {
      "img": kListingImage,
      "name": "Royal Treats",
      "category": "Desserts",
      "loc": "Long Bay",
      "status": "Active",
    },
  ];

  var currentPage1 = 1.obs;
  var selectedValue = "".obs;
  var selectedValue1 = "".obs;
  var selectedValue2 = "".obs;
  final int itemsPerPage = 4;
  final int pagesPerGroup = 5;

  int get totalPages => (allListings.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage1.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return allListings.sublist(start, end > allListings.length ? allListings.length : end);
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