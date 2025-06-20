import 'package:anime/core/utils/app_export.dart';

class AnimeCarouselSlider extends StatelessWidget {
  final List<Anime> animeList;

  const AnimeCarouselSlider({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 205.0.h,
          autoPlay: true,
          enlargeCenterPage: true,
          initialPage: 1,
          viewportFraction: 0.8,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
        ),
        items: animeList.map((anime) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppConstants.detailsRoute,
                    arguments: anime.malId,
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            blurRadius: 10.sp,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0.sp),
                        child: AppImageView(
                          imagePath: anime.images.jpg.largeImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0.sp),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 4.h,
                            ),
                            child: Text(
                              anime.title,
                              style: MyAppThemeHelper
                                  .lightTheme.textTheme.titleLarge!
                                  .copyWith(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                                color: MyAppThemeHelper.white,
                                fontFamily: Lang.of(context).text_poppins,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
