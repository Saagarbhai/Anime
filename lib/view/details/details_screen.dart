import 'package:anime/core/utils/app_export.dart';
import 'package:anime/view/custom_wiget/shimmer_effects.dart';

class DetailsScreen extends StatelessWidget {
  final int? id;

  const DetailsScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DetailBloc>();
    debugPrint(id.toString());
    bloc.add(LoadAnimeDetail(id!));
    return Scaffold(
      appBar: _appbar(context),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state.detailPageStatus == Status.loading) {
            return ShimmerEffects.detailsShimmer();
          } else if (state.detailPageStatus == Status.success) {
            final data = state.data;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      width: double.infinity,
                      height: 500.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12.r),
                        image: DecorationImage(
                          image: NetworkImage(data!.images.jpg.largeImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: Lang.of(context).poppins,
                    ),
                  ),
                  Text(
                    data.titleJapanese,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                      fontFamily: Lang.of(context).poppins,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoTile("Episodes", "${data.episodes}", context),
                      _infoTile("Score", "${data.score}", context),
                      _infoTile("Rank", "#${data.rank}", context),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Text(
                        "Aired",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "${data.aired.prop.from.day}/${data.aired.prop.from.month}/${data.aired.prop.from.year} - ${data.aired.prop.to.day}/${data.aired.prop.to.month}/${data.aired.prop.to.year}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data.type,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data.status,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Rating",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data.rating,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Source",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data.source,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data.duration,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Trailer",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        data.trailer.url != null && data.trailer.url!.isNotEmpty
                            ? "Available"
                            : "N/A",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      onPressed: () async {
                        try {
                          if (data.trailer.url != null) {
                            await Navigator.pushNamed(
                              context,
                              AppConstants.webViewRoute,
                              arguments: data.trailer.url,
                            );
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      icon: Icon(
                        Icons.play_circle_fill_rounded,
                        size: 24.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Watch Trailer",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Producers :',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: Lang.of(context).poppins,
                            ),
                          ),
                        ],
                      ),
                      ...data.producers.map(
                        (c) => InkWell(
                          onTap: () async {
                            try {
                              await Navigator.pushNamed(
                                context,
                                AppConstants.webViewRoute,
                                arguments: c.url,
                              );
                            } catch (e) {
                              debugPrint(e.toString());
                            }
                          },
                          child: Chip(
                            label: Text(
                              c.name,
                              style: TextStyle(
                                fontFamily: Lang.of(context).poppins,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Genres :',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: Lang.of(context).poppins,
                            ),
                          ),
                        ],
                      ),
                      ...data.genres.map(
                        (g) => InkWell(
                          onTap: () async {
                            try {
                              await Navigator.pushNamed(
                                context,
                                AppConstants.webViewRoute,
                                arguments: g.url,
                              );
                            } catch (e) {
                              debugPrint(e.toString());
                            }
                          },
                          child: Chip(
                            label: Text(
                              g.name,
                              style: TextStyle(
                                fontFamily: Lang.of(context).poppins,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Themes :',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: Lang.of(context).poppins,
                            ),
                          ),
                        ],
                      ),
                      ...data.themes.map(
                        (t) => InkWell(
                          onTap: () async {
                            try {
                              await Navigator.pushNamed(
                                context,
                                AppConstants.webViewRoute,
                                arguments: t.url,
                              );
                            } catch (e) {
                              debugPrint(e.toString());
                            }
                          },
                          child: Chip(
                            label: Text(
                              t.name,
                              style: TextStyle(
                                fontFamily: Lang.of(context).poppins,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Broadcast",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: Lang.of(context).poppins,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Day: ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      Text(
                        data.broadcast.day.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Time: ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      Text(
                        data.broadcast.time.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Timezone: ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                      Text(
                        data.broadcast.timezone.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Lang.of(context).poppins,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: Lang.of(context).poppins,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    data.synopsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Lang.of(context).poppins,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Background",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: Lang.of(context).poppins,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    data.background,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Lang.of(context).poppins,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "More Info",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: Lang.of(context).poppins,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    data.members != null
                        ? "Members: ${data.members}"
                        : "Members: N/A",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Lang.of(context).poppins,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    data.favorites != null
                        ? "Favorites: ${data.favorites}"
                        : "Favorites: N/A",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Lang.of(context).poppins,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            );
          } else if (state.detailPageStatus == Status.failure) {
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

  AppBar _appbar(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      title: Text(
        Lang.of(context).appbar_title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: Lang.of(context).poppins,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _infoTile(String label, String value, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: Lang.of(context).poppins,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontFamily: Lang.of(context).poppins,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
