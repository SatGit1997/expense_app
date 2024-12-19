import 'package:expense_app/data/local/model/cat_model.dart';

class AppConstants{

  static const String APP_NAME = "Monety";

  static  List<CatModel> mCat = [
    CatModel(id: (1), title: "Coffee", imgPath: "assets/icons/coffee.png"),
    CatModel(id: (2), title: "Fast Food", imgPath: "assets/icons/fast-food.png"),
    CatModel(id: (3), title: "Gift Box", imgPath: "assets/icons/gift-box.png"),
    CatModel(id: (4), title: "Grocery", imgPath: "assets/icons/ic_grocery.png"),
    CatModel(id: (5), title: "Shopping", imgPath: "assets/icons/ic_shopping.png"),
    CatModel(id: (6), title: "Transfer", imgPath: "assets/icons/mobile-transfer.png.png"),
    CatModel(id: (7), title: "Coffee", imgPath: "assets/icons/smartphone.png"),
    CatModel(id: (8), title: "Travel", imgPath: "assets/icons/travel.png"),
    CatModel(id: (9), title: "Restaurant", imgPath: "assets/icons/restaurant.png"),
    CatModel(id: (10), title: "Travel", imgPath: "assets/icons/vehicles.png"),
    CatModel(id: (11), title: "Snack", imgPath: "assets/icons/snack.png"),
  ];
}