import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/data.dart';
import 'package:desired_car/core/controllers/color_controller.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.brandName});
  final String brandName;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
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
              ),
              const SizedBox(
                height: 20,
              ),
              products == null
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Center(
                          child: InkWell(
                              onTap: () {},
                              child: Card(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              )
                              // Container(
                              //   margin: const EdgeInsets.symmetric(
                              //     vertical: 10,
                              //     horizontal: 20,
                              //   ),
                              //   height: 100,
                              //   padding: const EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //       // border: Border.all(
                              //       //     color: Colors.black,
                              //       //     width: 1,
                              //       //     strokeAlign: BorderSide.strokeAlignInside),
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: color.withOpacity(0.1)),
                              //   child: Image.network(brands![index].imagePath)
                              //       .animate()
                              //       .scaleXY(),
                              // ),
                              ),
                        ).animate().then().slideY(begin: 1).then(),
                        itemCount: products?.length ?? 0,
                        physics: const ScrollPhysics(),
                      ),
                    )
                  : SizedBox(
                      child: CircularProgressIndicator(
                        color: color.withOpacity(0.15),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
