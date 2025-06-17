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
          Gap(12.h),
          Text(
            data.title,
            style: MyAppThemeHelper.lightTheme.textTheme.titleLarge!
                .copyWith(color: MyAppThemeHelper.black),
          ),
          Text(
            data.titleJapanese,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          Gap(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _infoTile(
                  Lang.of(context).lbl_episode, "${data.episodes}", context),
              _infoTile(Lang.of(context).lbl_score, "${data.score}", context),
              _infoTile(Lang.of(context).lbl_rank, "#${data.rank}", context),
            ],
          ),
          Gap(16.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_aried,
            value:
                "${data.aired.prop.from.day}/${data.aired.prop.from.month}/${data.aired.prop.from.year} - ${data.aired.prop.to.day}/${data.aired.prop.to.month}/${data.aired.prop.to.year}",
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_type,
            value: data.type,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_status,
            value: data.status,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_rating,
            value: data.rating,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_duration,
            value: data.duration,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_trailer,
            value: data.trailer.url != null && data.trailer.url!.isNotEmpty
                ? Lang.of(context).lbl_available
                : Lang.of(context).lbl_na,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_source,
            value: data.source,
          ),
          Gap(8.h),
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
          Gap(16.h),
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
          Gap(16.h),
          Text(
            Lang.of(context).lbl_broadcast,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_day,
            value: data.broadcast.day.toString(),
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_time,
            value: data.broadcast.time.toString(),
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_timezone,
            value: data.broadcast.timezone.toString(),
          ),
          Gap(8.h),
          Text(
            Lang.of(context).lbl_synopsis,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          Gap(8.h),
          Text(
            data.synopsis,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          Gap(16.h),
          Text(
            Lang.of(context).lbl_background,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          Gap(8.h),
          Text(
            data.background,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          Gap(8.h),
          Text(
            Lang.of(context).lbl_moreInfo,
            style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_members,
            value: data.members != null
                ? data.members.toString()
                : Lang.of(context).lbl_membersna,
          ),
          Gap(8.h),
          LabeledValueWidget(
            label: Lang.of(context).lbl_favorites,
            value: data.favorites != null
                ? data.favorites.toString()
                : Lang.of(context).lbl_favoritesNA,
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
          value == null ? Lang.of(context).lbl_na : label,
          style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
