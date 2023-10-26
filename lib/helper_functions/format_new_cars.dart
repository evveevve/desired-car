import 'package:desired_car/data/data.dart';
import 'package:desired_car/helper_functions/price_formatter.dart';
import 'package:desired_car/model/car_model.dart';
import 'package:desired_car/scrapper/scrap_new_launchess.dart';

Future<List<Car>?> formatNewCars() async {
  if (newCarLaunches != null) {
    return newCarLaunches;
  } else {
    final List<dynamic> response =
        (await scrapNewCarLaunches())['data'] as List<dynamic>;

    newCarLaunches = response.map(
      (item) {
        final prices =
            priceFormatter(price: item["price"], source: "new-car-launches");
        return Car(
          name: item["name"],
          imagePath: item["image"],
          price: item["price"],
          initialPrice: prices[0],
          terminalPrice: prices[1],
          reference: item["link"],
          about: item["about"],
          launchDate: item["launchDate"],
        );
      },
    ).toList();
    return newCarLaunches;
  }
}
