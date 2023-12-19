// ignore_for_file: non_constant_identifier_names

class Validation {
  static String? validateothers(String? value) {
    if (value!.isEmpty) {
      return "فارغ";
    }

    return null;
  }

  static String? validateothe(String? value) {
    if (value!.isEmpty) {
      return "فارغ";
    }

    if (value.isEmpty) {
      return 'لا تترك هذا الحقل فارغ';
    } else {
      try {
        double.parse(value);
      } catch (e) {
        return "ادخل قيمه صحيحه";
      }
    }
    return null;
  }

  // (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'لا تترك هذا الحقل فارغ';
  //                     } else {
  //                       try {
  //                         double.parse(value);
  //                       } catch (e) {
  //                         return "ادخل قيمه صحيحه";
  //                       }
  //                     }
  //                     return null;
  //                   }
}
