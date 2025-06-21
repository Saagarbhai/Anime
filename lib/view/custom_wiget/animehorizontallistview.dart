import 'package:anime/core/utils/app_export.dart';

class AnimeHorizontalListView extends StatelessWidget {
  final List<Anime> listData;

  const AnimeHorizontalListView({
    super.key,
    required this.listData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 13.w),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listData.length,
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
                      color: MyAppThemeHelper.white,
                      borderRadius: BorderRadius.circular(14.sp),
                      border: Border.all(
                        color: MyAppThemeHelper.grey.withOpacity(0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          blurRadius: 5.sp,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.sp),
                            topRight: Radius.circular(12.sp),
                          ),
                          child: AppImageView(
                            height: 135.h,
                            width: 150.w,
                            imagePath: data.images.jpg.largeImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 3.h),
                          child: Text(
                            data.title,
                            maxLines: 1,
                            style: MyAppThemeHelper
                                .lightTheme.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            "${Lang.of(context).lbl_rating}: ${data.score?.toString()}",
                            style: MyAppThemeHelper
                                .lightTheme.textTheme.labelSmall!
                                .copyWith(
                              fontSize: 12.sp,
                              color: MyAppThemeHelper.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8.w);
              },
            ),
            SizedBox(width: 13.w),
          ],
        ),
      ),
    );
  }
}
