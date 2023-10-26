import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/data.dart';
import 'package:desired_car/core/controllers/color_controller.dart';

class VersionsPage extends StatefulWidget {
  const VersionsPage(
      {super.key, required this.productName, required this.brandName});
  final String brandName;
  final String productName;

  @override
  State<VersionsPage> createState() => _VersionsPageState();
}

class _VersionsPageState extends State<VersionsPage> {
  late final car = products[widget.brandName]!
      .where(
        (car) => car.name == widget.productName,
      )
      .first;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ColorController(),
      builder: (context, color, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Desired Car",
              style: TextStyle(fontStyle: FontStyle.italic)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline_outlined)),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => VersionsPage(
                        //         productName: brands![index].reference,
                        //         brandName: brands![index].name)));
                      },
                      child: Card(
                        surfaceTintColor: color.withOpacity(0.2),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  car.imagePath,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  car.versions![index].version,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black, blurRadius: 5),
                                        Shadow(
                                            color: Colors.black, blurRadius: 5),
                                      ],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Fuel Type : ${car.versions![index].fuelType}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(171, 0, 0, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Mileage : ${car.versions![index].mileage}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(171, 0, 0, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Transmission Type : ${car.versions![index].transmissionType}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(171, 0, 0, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pice : ${car.versions![index].price} laks",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ).animate().scaleXY(
                                duration: const Duration(milliseconds: 700),
                              ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: car.versions!.length,
                physics: const ScrollPhysics(),
              ),
              Positioned(
                top: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    widget.productName,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                    .animate()
                    .slideY(
                        begin: 1, duration: const Duration(milliseconds: 500))
                    .then()
                    .shimmer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
