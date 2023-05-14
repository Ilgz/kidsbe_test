import 'package:flutter/material.dart';
import 'package:times_wire/presentation/core/widgets/custom_shimmer.dart';

class ShimmerArticleCard extends StatelessWidget {
  const ShimmerArticleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            CustomShimmer(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey,
                ),
                width: double.infinity,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(const Radius.circular(12.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomShimmer(
                          child: Container(
                            width: double.infinity, // You can adjust the width to match your text's approximate width
                            height: 40, // Adjust the height to match your text's height (2 lines)
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),)
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
