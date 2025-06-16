import 'package:anime/core/theme/theme.dart';
import 'package:anime/core/utils/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return Scaffold(
      backgroundColor: MyAppThemeHelper.white,
      appBar: appbar(context),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.homeStatus == Status.init) {
            homeBloc.add(LoadHomePageData());
          }
          if (state.homeStatus == Status.loading) {
            return ShimmerEffects.homeShimmer();
          } else if (state.homeStatus == Status.success) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _curouselslider(state),
                  SizedBox(height: 16.h),
                  _tvtext(context),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: _buildListViewforcard(state.tvData, context),
                  ),
                  SizedBox(height: 16.h),
                  _movietext(context),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: _buildListViewforcard(state.movieData, context),
                  ),
                  _allanimetext(context),
                  _buildListView(state.data),
                ],
              ),
            );
          } else if (state.homeStatus == Status.failure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListViewforcard(List<Anime> listData, BuildContext context) {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final data = listData[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppConstants.detailsRoute,
                arguments: data.malId,
              );
            },
            child: Container(
              height: 160.h,
              width: 150.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyAppThemeHelper.grey.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    blurRadius: 5.sp,
                    offset: Offset(0, 2.h),
                  ),
                ],
                color: MyAppThemeHelper.white,
                borderRadius: BorderRadius.circular(14.sp),
              ),
              margin: EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.sp),
                      topRight: Radius.circular(12.sp),
                    ),
                    child: Container(
                      height: 135.h,
                      decoration: BoxDecoration(
                          color: MyAppThemeHelper.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  data.images.jpg.largeImageUrl.toString()),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 3.h),
                    child: Text(
                      data.title,
                      maxLines: 1,
                      style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium!
                          .copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SizedBox(
                      child: Text(
                        "${Lang.of(context).lbl_rating}: ${data.score?.toString()}",
                        style: MyAppThemeHelper.lightTheme.textTheme.labelSmall!
                            .copyWith(
                          fontSize: 12.sp,
                          color: MyAppThemeHelper.grey.withOpacity(0.8),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: listData.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Padding _tvtext(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Text(
        Lang.of(context).lbl_tv,
        style: MyAppThemeHelper.lightTheme.textTheme.titleMedium,
      ),
    );
  }

  Padding _movietext(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Text(
        Lang.of(context).lbl_movie,
        style: MyAppThemeHelper.lightTheme.textTheme.titleMedium,
      ),
    );
  }

  Padding _allanimetext(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Text(
        Lang.of(context).lbl_allAnime,
        style: MyAppThemeHelper.lightTheme.textTheme.titleMedium,
      ),
    );
  }

  Padding _curouselslider(HomeState state) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
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
        items: state.data.map((anime) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppConstants.detailsRoute,
                      arguments: anime.malId);
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
                        child: Image.network(
                          anime.images.jpg.largeImageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: MyAppThemeHelper.grey.withOpacity(0.2),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                  color: MyAppThemeHelper.primary,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('Error loading image: $error');
                            return Container(
                              color: MyAppThemeHelper.grey.withOpacity(0.3),
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: MyAppThemeHelper.grey.withOpacity(0.5),
                                  size: 32.sp,
                                ),
                              ),
                            );
                          },
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
                                horizontal: 16.w, vertical: 4.h),
                            child: Text(
                              state.data[state.data.indexOf(anime)].title,
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
                          )
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

  AppBar appbar(BuildContext context) {
    return AppBar(
      title: Text(
        Lang.of(context).appbar_title,
        style: MyAppThemeHelper.lightTheme.textTheme.titleLarge!
            .copyWith(color: MyAppThemeHelper.white),
      ),
      centerTitle: true,
      backgroundColor: MyAppThemeHelper.primary,
    );
  }

  Widget _buildListView(List<Anime> anime) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      itemCount: anime.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return _buildListCard(anime[index], context);
      },
    );
  }

  Widget _buildListCard(Anime anime, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppConstants.detailsRoute,
            arguments: anime.malId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyAppThemeHelper.white,
          border: Border.all(
            color: MyAppThemeHelper.grey.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.sp,
              offset: Offset(0, 2.h),
            ),
          ],
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.sp),
                bottomLeft: Radius.circular(12.sp),
              ),
              child: Image.network(
                anime.images.jpg.largeImageUrl,
                height: 140.h,
                width: 120.w,
                fit: BoxFit.cover,
                cacheHeight: 300,
                cacheWidth: 400,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 140.h,
                    width: 120.w,
                    color: MyAppThemeHelper.grey.withOpacity(0.2),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                        color: MyAppThemeHelper.primary,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('Error loading image: $error');
                  return Container(
                    height: 140.h,
                    width: 120.w,
                    color: MyAppThemeHelper.grey.withOpacity(0.3),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            color: MyAppThemeHelper.grey.withOpacity(0.5),
                            size: 32.sp,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            Lang.of(context).error_imageUnvailable,
                            style:
                                MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
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
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 3.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.amber[100],
                                borderRadius: BorderRadius.circular(4.sp),
                              ),
                              child: Text(anime.source,
                                  style: MyAppThemeHelper
                                      .lightTheme.textTheme.labelSmall!
                                      .copyWith(
                                    color: Colors.amber.shade800,
                                  )),
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 3.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(4.sp),
                              ),
                              child: Text(
                                anime.type,
                                style: MyAppThemeHelper
                                    .lightTheme.textTheme.labelSmall!
                                    .copyWith(
                                  color: MyAppThemeHelper.grey.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          anime.title,
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.titleLarge!
                              .copyWith(height: 0.9, fontSize: 18.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          child: Text(
                            "${Lang.of(context).lbl_rating}: ${anime.score?.toString()}",
                            style: MyAppThemeHelper
                                .lightTheme.textTheme.labelSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${Lang.of(context).lbl_members}:${anime.members}",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              anime.rating.toString(),
                              style: MyAppThemeHelper
                                  .lightTheme.textTheme.labelSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
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
}
