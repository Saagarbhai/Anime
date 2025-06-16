import 'package:anime/core/theme/theme.dart';
import 'package:anime/core/utils/app_export.dart';

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
            return detailsScreenMethod(data, context);
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

  Widget detailsScreenMethod(Anime? data, BuildContext context) {
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
                    color: MyAppThemeHelper.black,
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
            style: MyAppThemeHelper.lightTheme.textTheme.titleLarge!
                .copyWith(color: MyAppThemeHelper.black),
          ),
          Text(
            data.titleJapanese,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _infoTile(
                  Lang.of(context).lbl_episode, "${data.episodes}", context),
              _infoTile(Lang.of(context).lbl_score, "${data.score}", context),
              _infoTile(Lang.of(context).lbl_rank, "#${data.rank}", context),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_aried,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(width: 8.w),
              Text(
                "${data.aired.prop.from.day}/${data.aired.prop.from.month}/${data.aired.prop.from.year} - ${data.aired.prop.to.day}/${data.aired.prop.to.month}/${data.aired.prop.to.year}",
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_type,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(width: 8.w),
              Text(
                data.type,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_status,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(width: 8.w),
              Text(
                data.status,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_rating,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(width: 8.w),
              Text(
                data.rating,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_source,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(width: 8.w),
              Text(
                data.source,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_duration,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(width: 8.w),
              Text(
                data.duration,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_trailer,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(width: 8.w),
              Text(
                data.trailer.url != null && data.trailer.url!.isNotEmpty
                    ? Lang.of(context).lbl_available
                    : Lang.of(context).lbl_na,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
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
                Lang.of(context).lbl_watchTrailer,
                style:
                    MyAppThemeHelper.lightTheme.textTheme.bodyLarge!.copyWith(
                  color: MyAppThemeHelper.white,
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
                    Lang.of(context).lbl_producers,
                    style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                  ),
                ],
              ),
              ...data.producers.map(
                (c) => WebLinkChip(name: c.name, url: c.url),
              ),
              Row(
                children: [
                  Text(
                    Lang.of(context).lbl_genres,
                    style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                  ),
                ],
              ),
              ...data.genres.map(
                (g) => WebLinkChip(name: g.name, url: g.url),
              ),
              Row(
                children: [
                  Text(
                    Lang.of(context).lbl_themes,
                    style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                  ),
                ],
              ),
              ...data.themes.map(
                (t) => WebLinkChip(name: t.name, url: t.url),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            Lang.of(context).lbl_broadcast,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_day,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
              Text(
                data.broadcast.day.toString(),
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_time,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
              Text(
                data.broadcast.time.toString(),
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                Lang.of(context).lbl_timezone,
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
              Text(
                data.broadcast.timezone.toString(),
                style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            Lang.of(context).lbl_synopsis,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            data.synopsis,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 16.h),
          Text(
            Lang.of(context).lbl_background,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            data.background,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 8.h),
          Text(
            Lang.of(context).lbl_moreInfo,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            data.members != null
                ? "${Lang.of(context).lbl_members}: ${data.members}"
                : Lang.of(context).lbl_membersna,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 8.h),
          Text(
            data.favorites != null
                ? "${Lang.of(context).lbl_favorites}: ${data.favorites}"
                : Lang.of(context).lbl_favoritesNA,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      foregroundColor: MyAppThemeHelper.white,
      title: Text(
        Lang.of(context).appbar_title,
        style: MyAppThemeHelper.lightTheme.appBarTheme.titleTextStyle,
      ),
      centerTitle: true,
      backgroundColor: MyAppThemeHelper.primary,
    );
  }

  Widget _infoTile(String label, String value, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
        ),
        Text(
          // ignore: unnecessary_null_comparison
          value != null ? label : Lang.of(context).lbl_na,
          style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
