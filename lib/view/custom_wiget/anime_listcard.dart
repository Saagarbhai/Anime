import 'package:anime/core/utils/app_export.dart';

class AnimeListCard extends StatelessWidget {
  final Anime anime;

  const AnimeListCard({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppConstants.detailsRoute,
          arguments: anime.malId,
        );
      },
      child: Container(
        height: 170.h,
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
              child: AppImageView(
                imagePath: anime.images.jpg.largeImageUrl,
                height: 170.h,
                width: 120.w,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Column(
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
                            style: MyAppThemeHelper
                                .lightTheme.textTheme.labelSmall!
                                .copyWith(
                              color: Colors.amber.shade800,
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
                            style: MyAppThemeHelper
                                .lightTheme.textTheme.labelSmall!
                                .copyWith(
                              color: MyAppThemeHelper.grey.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(6.h),
                    Text(
                      anime.title,
                      style: MyAppThemeHelper.lightTheme.textTheme.titleLarge!
                          .copyWith(height: 0.9, fontSize: 18.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(2.h),
                    Text(
                      "${Lang.of(context).lbl_rating}: ${anime.score?.toString()}",
                      style: MyAppThemeHelper.lightTheme.textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(2.h),
                    Text(
                      "${Lang.of(context).lbl_members}${anime.members}",
                      style: MyAppThemeHelper.lightTheme.textTheme.labelSmall,
                    ),
                    Gap(2.h),
                    Text(
                      "${Lang.of(context).lbl_favorites}${anime.favorites}",
                      style: MyAppThemeHelper.lightTheme.textTheme.labelSmall,
                    ),
                    Gap(2.h),
                    Text(
                      "${Lang.of(context).lbl_rank}: ${anime.rank}",
                      style: MyAppThemeHelper.lightTheme.textTheme.labelSmall,
                    ),
                    Gap(2.h),
                    Text(
                      "Popularity : ${anime.popularity ?? Lang.of(context).lbl_na}",
                      style: MyAppThemeHelper.lightTheme.textTheme.labelSmall,
                    ),
                    Gap(2.h),
                    Text(
                      "${Lang.of(context).lbl_episode}: ${anime.episodes ?? Lang.of(context).lbl_na}",
                      style: MyAppThemeHelper.lightTheme.textTheme.labelSmall,
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
