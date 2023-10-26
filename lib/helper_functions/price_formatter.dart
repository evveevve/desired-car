dynamic priceFormatter({required String price, required String source}) {
  if (price == '') return 0;
  switch (source) {
    case "new-car-launches":
      // ₹ 15.49 Lakh - ₹ 26.44 Lakh
      double initialPrice = double.parse(price.split(' ')[1]);
      double terminalPrice = double.parse(price.split(' ')[5]);
      return [initialPrice, terminalPrice];

    case "brand-products":
      // ₹8.10 - 15.50 Lakh
      double initialPrice = double.parse(price.split('₹')[1].split(' ')[0]);
      double terminalPrice = double.parse(price.split('₹')[1].split(' ')[0]);

      return [initialPrice, terminalPrice];
    case "version":
      // ₹ 8.10 Lakh
      double initialPrice = double.parse(price.split(' ')[1]);
      return initialPrice;
  }
}
