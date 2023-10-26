import 'package:desired_car/data/data.dart';
import 'package:desired_car/scrapper/scrap_brands.dart';
import 'package:desired_car/model/brand_model.dart';

Future<List<Brand>?> formatBrands() async {
  if (brands != null) {
    return brands;
  } else {
    final data = (await scrapBrands())['data'] as List<dynamic>;
    brands = data
        .map(
          (item) => Brand(
              imagePath: item['imageSrc'] as String? ?? "",
              name: item['brandName'] as String? ?? "",
              reference: item['brandHref'] as String? ?? ""),
        )
        .toList();
    return brands;
  }
}
