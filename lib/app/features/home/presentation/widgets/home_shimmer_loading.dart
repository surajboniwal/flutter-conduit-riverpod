import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(height: 32.0),
        itemBuilder: (context, index) => const HomeShimmerLoadingItem(),
      ),
    );
  }
}

class HomeShimmerLoadingItem extends StatelessWidget {
  const HomeShimmerLoadingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CircleAvatar(radius: 8.0),
                  SizedBox(width: 8.0),
                  ShimmerContainer(
                    height: 12,
                    width: 100,
                    borderRadius: 4.0,
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              const ShimmerContainer(
                height: 12,
                width: null,
                borderRadius: 4.0,
              ),
              const SizedBox(height: 4.0),
              const ShimmerContainer(
                height: 12,
                width: null,
                borderRadius: 4.0,
              ),
              const SizedBox(height: 4.0),
              const ShimmerContainer(
                height: 12,
                width: 170,
                borderRadius: 4.0,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16.0),
        const ShimmerContainer(
          height: 70,
          width: 100,
          borderRadius: 4,
        ),
      ],
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.borderRadius})
      : super(key: key);

  final double height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
