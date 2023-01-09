import 'package:intl/intl.dart';

class Util{
  static String appId = "63a1d56f1364268289b2b23b1b4bed6c";

  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat("EEEE, MMM d, y").format(dateTime);
    //... 1999
  }

}
