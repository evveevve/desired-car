import 'package:desired_car/helper_functions/format_products.dart';
import 'package:desired_car/screens/versions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/data.dart';
import 'package:desired_car/core/controllers/color_controller.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.url, required this.brandName});
  final String brandName;
  final String url;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
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
        // drawer: Drawer(
        //   backgroundColor: Colors.white,
        //   child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         DrawerHeader(
        //           child: GestureDetector(
        //             onTap: () {},
        //             child: CircleAvatar(
        //                 radius: 50,
        //                 backgroundColor: Colors.pink.shade50,
        //                 child: const Icon(Icons.person_outline_outlined)),
        //           ),
        //         ),
        //         const Text("Home", style: TextStyle(fontSize: 27)),
        //         const Text("Brands", style: TextStyle(fontSize: 27)),
        //         const Text("Search", style: TextStyle(fontSize: 27)),
        //         const Text("Compare", style: TextStyle(fontSize: 27)),
        //         const Text("Ev-Evaluation", style: TextStyle(fontSize: 27)),
        //       ]),
        // ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FutureBuilder(
              future: formatProducts(widget.url, widget.brandName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Transform.scale(
                        scale: 2,
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: color.withOpacity(0.3),
                        ).animate().shimmer()),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  final data = snapshot.data;
                  return Stack(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     vertical: 5,
                      //     horizontal: 10,
                      //   ),
                      //   decoration: BoxDecoration(
                      //       color: color.withOpacity(0.2),
                      //       borderRadius: BorderRadius.circular(30)),
                      //   child: const Text(
                      //     "Brands!",
                      //     style: TextStyle(
                      //       fontSize: 27,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VersionsPage(
                                      productName: data[index].name,
                                      brandName: widget.brandName)));
                            },
                            child: Card(
                              surfaceTintColor: color.withOpacity(0.2),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        data[index].imagePath,
                                        height: 80,
                                      ),
                                    ).animate().scaleXY(
                                        duration:
                                            const Duration(milliseconds: 500)),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                              ],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data[index].price,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Versions: ${data[index].totalVersion}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromARGB(171, 0, 0, 0),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ).animate().scaleXY(
                                        duration: const Duration(seconds: 1)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: data!.length,
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
                            widget.brandName,
                            style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                            .animate()
                            .slideY(
                                begin: 1,
                                duration: const Duration(milliseconds: 500))
                            .then()
                            .shimmer(),
                      ),
                    ],
                  );
                }
              },
            )),
      ),
    );
  }
}
