import 'package:anime/core/utils/app_export.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffects {
  // Base shimmer widget
  static Widget baseShimmer({
    required Widget child,
    Color baseColor = const Color(0xFFE0E0E0),
    Color highlightColor = const Color(0xFFF5F5F5),
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }

  // Home screen carousel shimmer
  static Widget carouselShimmer() {
    return baseShimmer(
      child: Container(
        height: 205.h,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
        ),
      ),
    );
  }

  // Card shimmer for horizontal scrolling lists
  static Widget horizontalCardShimmer() {
    return baseShimmer(
      child: Container(
        height: 165.h,
        width: 150.w,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 125.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.sp),
                  topRight: Radius.circular(12.sp),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 8.h),
              child: Container(
                height: 12.h,
                width: 100.w,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 5.h),
              child: Container(
                height: 8.h,
                width: 60.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List card shimmer for vertical list
  static Widget listCardShimmer() {
    return baseShimmer(
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.sp),
                  bottomLeft: Radius.circular(12.sp),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 15.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.sp),
                              ),
                            ),
                            Container(
                              height: 15.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          height: 16.h,
                          width: 150.w,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          height: 12.h,
                          width: 80.w,
                          color: Colors.white,
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          height: 12.h,
                          width: 100.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      height: 12.h,
                      width: 60.w,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Details screen shimmer
  static Widget detailsShimmer() {
    return baseShimmer(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 500.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              height: 24.h,
              width: 200.w,
              color: Colors.white,
            ),
            SizedBox(height: 4.h),
            Container(
              height: 16.h,
              width: 150.w,
              color: Colors.white,
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                3,
                (index) => Container(
                  height: 50.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // Info rows
            ...List.generate(
              7,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  children: [
                    Container(
                      height: 16.h,
                      width: 60.w,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 14.h,
                      width: 120.w,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 20.h,
              width: 100.w,
              color: Colors.white,
            ),
            SizedBox(height: 8.h),
            Container(
              height: 200.h,
              width: double.infinity,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  // WebView shimmer
  static Widget webViewShimmer() {
    return baseShimmer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }

  // Home screen shimmer
  static Widget homeShimmer() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Carousel shimmer
          carouselShimmer(),
          SizedBox(height: 16.h),

          // TV section
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
            child: baseShimmer(
              child: Container(
                height: 20.h,
                width: 100.w,
                color: Colors.white,
              ),
            ),
          ),

          // Horizontal card list shimmer for TV
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            child: SizedBox(
              height: 165.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Show 5 shimmer items
                itemBuilder: (context, index) => horizontalCardShimmer(),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Movie section
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
            child: baseShimmer(
              child: Container(
                height: 20.h,
                width: 100.w,
                color: Colors.white,
              ),
            ),
          ),

          // Horizontal card list shimmer for Movie
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            child: SizedBox(
              height: 165.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Show 5 shimmer items
                itemBuilder: (context, index) => horizontalCardShimmer(),
              ),
            ),
          ),

          // All anime section
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
            child: baseShimmer(
              child: Container(
                height: 20.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),
          ),

          // Vertical list shimmer
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16.w),
            itemCount: 5, // Show 5 shimmer items
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) => listCardShimmer(),
          ),
        ],
      ),
    );
  }
}
