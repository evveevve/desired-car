import 'package:desired_car/data/data.dart';
import 'package:desired_car/helper_functions/price_formatter.dart';
import 'package:desired_car/scrapper/scrap_products.dart';
import 'package:desired_car/model/car_model.dart';

void formatProducts(final String url) async {
  final Map<String, dynamic> response = await scrapProducts(url);
  if (response['data'] == null) {
    // print('Response or data is null');
    return;
  }

  final List<dynamic> rawData = response['data'];

  products = rawData.map((item) {
    final prices = priceFormatter(
        price: item['car price'] as String? ?? '', source: "brand-products");

    return Car(
      imagePath: item['car image'] as String? ?? '',
      name: item['car name'] as String? ?? '',
      reference: item['car link'] as String? ?? '',
      price: item['car price'] as String? ?? '',
      initialPrice: prices[0],
      terminalPrice: prices[1],
      totalVersion: int.parse(item['total varsions'] as String? ?? '0'),
      versions: (item['versions'] as List?)?.map((versionItem) {
            return Version(
              version: versionItem['version'] as String? ?? '',
              fuelType: versionItem['fuel type'] as String? ?? '',
              transmissionType:
                  versionItem['transmission type'] as String? ?? '',
              mileage: double.parse(versionItem['mileage'] as String? ?? ''),
              price: priceFormatter(
                  price: versionItem['price'] as String? ?? '',
                  source: "version"),
              reference: versionItem['version link'] as String? ?? '',
            );
          }).toList() ??
          [],
    );
  }).toList();
}
