import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class DashboardController extends GetxController {
  final List<Map<String, dynamic>> businesses = [
    {
      "name": "Sunset Grill",
      "plan": "Premium",
      "startDate": "30-Sep-25",
      "expDate": "30-Sep-25",
      "amount": "129.99",
      "status": "Pending",
    },
    {
      "name": "Ocean Breeze Café",
      "plan": "Standard",
      "startDate": "01-Aug-25",
      "expDate": "01-Aug-26",
      "amount": "49.99",
      "status": "Active",
    },
    {
      "name": "Tech Nova",
      "plan": "Basic",
      "startDate": "15-Sep-24",
      "expDate": "15-Sep-25",
      "amount": "29.99",
      "status": "Expired",
    },
    {
      "name": "Mountain Bikes Co.",
      "plan": "Premium",
      "startDate": "10-Jan-25",
      "expDate": "10-Jan-26",
      "amount": "129.99",
      "status": "Active",
    },
    {
      "name": "Urban Styles",
      "plan": "Standard",
      "startDate": "12-Feb-24",
      "expDate": "12-Feb-25",
      "amount": "49.99",
      "status": "Canceled",
    },
    {
      "name": "GreenGrocers",
      "plan": "Basic",
      "startDate": "20-Mar-25",
      "expDate": "20-Mar-26",
      "amount": "29.99",
      "status": "Active",
    },
    {
      "name": "Vintage Vault",
      "plan": "Premium",
      "startDate": "05-Apr-25",
      "expDate": "05-Apr-26",
      "amount": "129.99",
      "status": "Canceled",
    },
    {
      "name": "Cosmic Fitness",
      "plan": "Standard",
      "startDate": "11-May-25",
      "expDate": "11-May-26",
      "amount": "49.99",
      "status": "Active",
    },
    {
      "name": "Luxe Lounge",
      "plan": "Basic",
      "startDate": "03-Jun-24",
      "expDate": "03-Jun-25",
      "amount": "29.99",
      "status": "Expired",
    },
    {
      "name": "Happy Paws",
      "plan": "Premium",
      "startDate": "19-Jul-25",
      "expDate": "19-Jul-26",
      "amount": "129.99",
      "status": "Active",
    },
    {
      "name": "AutoFix Garage",
      "plan": "Standard",
      "startDate": "25-Aug-25",
      "expDate": "25-Aug-26",
      "amount": "49.99",
      "status": "Canceled",
    },
    {
      "name": "Gadget Zone",
      "plan": "Basic",
      "startDate": "17-Sep-24",
      "expDate": "17-Sep-25",
      "amount": "29.99",
      "status": "Active",
    },
    {
      "name": "Fresh Bakes",
      "plan": "Premium",
      "startDate": "08-Oct-25",
      "expDate": "08-Oct-26",
      "amount": "129.99",
      "status": "Expired",
    },
    {
      "name": "City Spa",
      "plan": "Standard",
      "startDate": "22-Nov-24",
      "expDate": "22-Nov-25",
      "amount": "49.99",
      "status": "Active",
    },
    {
      "name": "Cloud Nine Events",
      "plan": "Basic",
      "startDate": "14-Dec-24",
      "expDate": "14-Dec-25",
      "amount": "29.99",
      "status": "Canceled",
    },
    {
      "name": "Studio Zen",
      "plan": "Premium",
      "startDate": "29-Jan-25",
      "expDate": "29-Jan-26",
      "amount": "129.99",
      "status": "Active",
    },
    {
      "name": "Book Barn",
      "plan": "Standard",
      "startDate": "04-Feb-25",
      "expDate": "04-Feb-26",
      "amount": "49.99",
      "status": "Expired",
    },
    {
      "name": "Pixel Prints",
      "plan": "Basic",
      "startDate": "13-Mar-25",
      "expDate": "13-Mar-26",
      "amount": "29.99",
      "status": "Active",
    },
    {
      "name": "Epic Threads",
      "plan": "Premium",
      "startDate": "07-Apr-25",
      "expDate": "07-Apr-26",
      "amount": "129.99",
      "status": "Canceled",
    },
    {
      "name": "Royal Treats",
      "plan": "Standard",
      "startDate": "18-May-25",
      "expDate": "18-May-26",
      "amount": "49.99",
      "status": "Active",
    },
  ];

  var currentPage1 = 1.obs;
  final int itemsPerPage = 4;
  final int pagesPerGroup = 5;

  int get totalPages => (businesses.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage1.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return businesses.sublist(start, end > businesses.length ? businesses.length : end);
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
