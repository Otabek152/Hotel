import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_task/ui/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key, required this.urlImages});
  final List<String> urlImages;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final urlImages = widget.urlImages;

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];

            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(urlImage) , fit: BoxFit.cover), borderRadius: BorderRadius.circular(15)),
            );
          },
          options: CarouselOptions(
              height: 260,
              viewportFraction: 1,
              onPageChanged: (index, reason) => setState(
                    () => i = index,
                  )),
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            height: 260,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: HotelColors.backGround,
                  borderRadius: BorderRadius.circular(5)),
              child: AnimatedSmoothIndicator(
                  effect: ScrollingDotsEffect(
                    dotHeight: 7,
                    dotWidth: 7,
                    activeDotColor: HotelColors.textColor,
                  ),
                  activeIndex: i,
                  count: urlImages.length),
            ),
          ),
        ),
      ],
    );
  }
}
