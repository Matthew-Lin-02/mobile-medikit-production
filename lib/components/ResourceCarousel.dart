import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';

Color color1 = const Color.fromRGBO(253, 243, 217, 1);

// Use ResourceCarousel to use carousel not _ResourceCarousel
class ResourceCarousel extends StatefulWidget {
  const ResourceCarousel({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ResourceCarousel();
  }
}

// The widget displayed within the carousel
class CarouselItem extends StatelessWidget {
  final String text;
  final String imagePath;

  const CarouselItem({super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: 250,
        child: Column(children: [
          Container(
            height: 200,
            width: 225,
            alignment: Alignment.center,
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: color1,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 2,
                        offset: Offset(0, 5),
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(165, 75, 75, 75))
                  ]),
              child: Image(image: AssetImage(imagePath), height: 180),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ]));
  }
}

class _ResourceCarousel extends State<ResourceCarousel> {
  final CarouselSliderController controller = CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300, // Size of the carousel including forwards and back arrows
        width: 1800,
        child: Row(children: [
          GestureDetector(
            onTap: () {
              controller.previousPage();
            },
            child: const Icon(
                Icons.chevron_left), // Make the carousel go backwards
          ),
          const SizedBox(width: 20.0),
          SizedBox(
              height: 300,
              width: 1400, // Size of the carousel
              child: CarouselSlider(
                items: [
                  GestureDetector(
                    onTap: () {
                      print("First Item tapped");
                      showCustomModal(
                          context,
                          const Image(
                              image: AssetImage(
                                  'assets/images/Enlarged-Booklet.png'),
                              height: 900)); // Make the image pop up here
                    },
                    child: const CarouselItem(
                      text: "Talking about the Heart, Patient Health Booklet",
                      imagePath: 'assets/images/Patient-Health-Booklet.png',
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        print("Second Item tapped");
                      },
                      child: const CarouselItem(
                        text: "Nutrition and Healthy Eating Demonstration",
                        imagePath: 'assets/images/Nutrition-Model.png',
                      )),
                  GestureDetector(
                    onTap: () {
                      print("Third Item tapped");
                    },
                    child: const CarouselItem(
                      text: "3D Animated Heart Model",
                      imagePath: 'assets/images/3D-Heart-Model.png',
                    ),
                  ),

                  // The add new resources button (Does not function)
                  Container(
                    height: 200,
                    width: 225,
                    alignment: Alignment.center,
                    child: Column(children: [
                      const SizedBox(height: 60),
                      Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(0, 5),
                                    blurStyle: BlurStyle.normal,
                                    color: Color.fromARGB(165, 75, 75, 75))
                              ],
                              color: color1),
                          child: const Icon(Icons.add)),
                    ]),
                  )
                ],
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: false,
                  //aspectRatio: 2,
                  enableInfiniteScroll: false, // Enable for roll around
                  viewportFraction: 0.25,
                  initialPage: 1,
                ),
                carouselController: controller,
              )),
          const SizedBox(width: 20.0), // Make carousel go forwards
          GestureDetector(
            onTap: () {
              controller.nextPage();
            },
            child: const Icon(Icons.chevron_right),
          ),
        ]));
  }
}
