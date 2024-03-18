import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

bool isKeyboardVisible(BuildContext context) {
  return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
}

bool login = false;
String currentDateFormattedString({int? index}) {
  var dateTime = DateTime.now();
  return "${dateTime.year}-${dateTime.month < 10 ? "0${dateTime.month}" : dateTime.month}-${dateTime.day < 10 ? "0${dateTime.day}" : dateTime.day}${index ?? ""}";
}

String userDateFormat(DateTime dateTime) {
  return DateFormat('d MMM y').format(dateTime);
}

String formattedDateString(DateTime dateTime) {
  return "${dateTime.year}-${dateTime.month < 10 ? "0${dateTime.month}" : dateTime.month}-${dateTime.day < 10 ? "0${dateTime.day}" : dateTime.day}";
}

// String formattedCurrencyString(double currency) {
//   var currencyFormat;
//   if (globalRegion == "TH") {
//     currencyFormat = currency == 0.0
//         ? NumberFormat('0.0')
//         : NumberFormat("#,###,###.00", "en_US");
//   } else {
//     currencyFormat =
//         currency == 0.0 ? NumberFormat('0') : NumberFormat("#,###,###");
//   }
//   return currencyFormat.format(currency);
// }

String formatQtyString(int qty) {
  var qtyFormat = NumberFormat("#,###,###");
  return qtyFormat.format(qty);
}

String getTimeDifferenceFromNow(DateTime dateTime) {
  return DateFormat.yMMMMd('en_US').add_jm().format(dateTime);
}

// String defaultProfile(AgentModel profile) {
//   List<String> profileList = [];
//   switch (profile.gender) {
//     case 0:
//       profileList = defaultFemaleProfile;
//       break;
//     case 1:
//       profileList = defaultMaleProfile;
//       break;
//     default:
//       profileList = defaultUnknownProfile;
//   }
//   return "assets/bonus_frames/default_profile/" +
//       profileList[Random().nextInt(profileList.length)];
// }

// String defaultTopAgentProfile(int gender) {
//   List<String> profileList = [];
//   switch (gender) {
//     case 0:
//       profileList = defaultFemaleProfile;
//       break;
//     case 1:
//       profileList = defaultMaleProfile;
//       break;
//     default:
//       profileList = defaultUnknownProfile;
//   }
//   return "assets/bonus_frames/default_profile/" +
//       profileList[Random().nextInt(profileList.length)];
// }

String getMoneyImage(double amount, String currency) {
  String moneyId = "";
  if (currency == "MMK") {
    if (amount > 100000 && amount <= 300000) {
      moneyId = 'oneToThree';
    } else if (amount > 300000 && amount <= 800000) {
      moneyId = 'threeToEight';
    } else if (amount > 800000 && amount <= 1000000) {
      moneyId = 'eightToTen';
    } else if (amount > 1000000 && amount <= 10000000) {
      moneyId = 'tenToHundred';
    } else if (amount > 10000000) {
      moneyId = 'hundred';
    } else {
      moneyId = 'one';
    }
  } else {
    moneyId = "baht";
  }
  return "assets/bonus_frames/money_images/" + moneyId + ".png";
}
