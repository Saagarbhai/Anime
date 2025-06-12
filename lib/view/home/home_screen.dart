import 'package:anime/core/utils/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: appbar(context),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.homeStatus == Status.init) {
            homeBloc.add(LoadHomePageData());
          }
          if (state.homeStatus == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.homeStatus == Status.success) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _curouselslider(state),
                  SizedBox(height: 16.h),
                  _tvtext(context),
                  _buildListViewforcard(state.tvData, context),
                  SizedBox(height: 16.h),
                  _movietext(context),
                  _buildListViewforcard(state.movieData, context),
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
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child: Container(
        height: 165.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final data = listData[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppConstants.detailsRoute,
                  arguments: data.malId,
                );
              },
              child: Container(
                height: 190.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
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
                        height: 125.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    data.images.jpg.largeImageUrl.toString()),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 2.h),
                      child: Text(
                        data.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            height: 1.3,
                            fontFamily: Lang.of(context).poppins,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: SizedBox(
                        child: Text(
                          "${Lang.of(context).rating}: ${data.score?.toString()}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: Lang.of(context).poppins,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800],
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
      ),
    );
  }

  Padding _tvtext(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Text(
        Lang.of(context).tv,
        style: TextStyle(
          fontSize: 20.sp,
          fontFamily: Lang.of(context).poppins,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Padding _movietext(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Text(
        Lang.of(context).movie,
        style: TextStyle(
          fontSize: 20.sp,
          fontFamily: Lang.of(context).poppins,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding _allanimetext(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Text(
        Lang.of(context).allAnime,
        style: TextStyle(
          fontSize: 20.sp,
          fontFamily: Lang.of(context).poppins,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
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
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppConstants.detailsRoute,
                      arguments: anime.malId);
                },
                child: Stack(
                  children: [
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
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
                              color: Colors.grey[200],
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('Error loading image: $error');
                            return Container(
                              color: Colors.grey[300],
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey[500],
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
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 246, 196, 255),
                                fontFamily: Lang.of(context).poppins,
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
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: Lang.of(context).poppins,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildListView(List<Anime> anime) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      itemCount: anime.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return _buildListCard(anime[index], context);
      },
    );
  }

  Widget _buildListCard(Anime anime, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppConstants.detailsRoute,
            arguments: anime.malId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
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
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('Error loading image: $error');
                  return Container(
                    height: 140.h,
                    width: 120.w,
                    color: Colors.grey[300],
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[500],
                            size: 32.sp,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            Lang.of(context).imageUnvailable,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: 'Poppins',
                              fontSize: 12.sp,
                            ),
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
                              child: Text(
                                anime.source,
                                style: TextStyle(
                                  color: Colors.amber[800],
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          anime.title,
                          style: TextStyle(
                            fontFamily: Lang.of(context).poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.grey[800],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          child: Text(
                            "${Lang.of(context).rating}: ${anime.score?.toString()}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: Lang.of(context).poppins,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${Lang.of(context).members}:${anime.members}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
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
                              style: TextStyle(
                                fontFamily: Lang.of(context).poppins,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.grey[800],
                              ),
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
