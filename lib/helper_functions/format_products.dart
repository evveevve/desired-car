import 'package:desired_car/data/data.dart';
import 'package:desired_car/helper_functions/price_formatter.dart';
import 'package:desired_car/scrapper/scrap_products.dart';
import 'package:desired_car/model/car_model.dart';

Future<List<Car>?> formatProducts(final String url, String brand) async {
  print("\n\nstarting format product \n\n");
  if (products.isEmpty || !products.containsKey(brand)) {
    print("\n\ninside 1st if \n\n");
    final List<dynamic> response =
        (await scrapProducts(url))['data'] as List<dynamic>;
    print("\n\nusing scrapper\n\n");
    products[brand] = response.map((item) {
      print(item);
      print("\n\n");
      final prices = priceFormatter(
          price: item['car price'] as String? ?? '',
          source: "brand-products") as List<double>;
      print(prices);
      return Car(
        imagePath: item['car image'] ?? '',
        name: item['car name'] ?? '',
        reference: item['car link'] ?? '',
        price: item['car price'] ?? '',
        initialPrice: prices[0],
        terminalPrice: prices[1],
        totalVersion: int.parse(item['total versions'] ?? '0'),
        versions: (item['versions'] as List?)?.map((versionItem) {
              if (versionItem is Map<String, dynamic>?) {
                final version = versionItem;
                return Version(
                  version: version?['version'] as String? ?? '',
                  fuelType: version?['fuel type'] as String? ?? '',
                  transmissionType:
                      version?['transmission type'] as String? ?? '',
                  mileage:
                      double.tryParse(version?['mileage'] as String? ?? '') ??
                          0.0,
                  price: priceFormatter(
                    price: version?['price'] as String? ?? '',
                    source: "version",
                  ),
                  reference:
                      "https://cartrade.com/${version?['version link'] as String? ?? ''}",
                );
              } else {
                // Handle this case as per your requirements. You can log an error or return a default value.
                return Version(
                  version: 'N/A',
                  fuelType: 'N/A',
                  transmissionType: 'N/A',
                  mileage: 0.0,
                  price: 0.0,
                  reference: 'N/A',
                );
              }
            }).toList() ??
            [],
      );
    }).toList();
    print(products[brand]);
    return products[brand];
  } else {
    print(products[brand]);
    return products[brand];
  }
}
