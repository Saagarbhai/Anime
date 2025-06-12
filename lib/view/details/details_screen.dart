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
            return Center(
              child: CircularProgressIndicator(),
            );
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
                      color: Colors.grey,
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
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      ...data.genres.map(
                        (g) => Chip(
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
                      ...data.themes.map(
                        (t) => Chip(
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
                    ],
                  ),
                  SizedBox(height: 16.h),
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
                  SizedBox(height: 24.h),
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
                            await launchUrl(Uri.parse(data.trailer.url!));
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
                  )
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
      automaticallyImplyLeading: false,
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
            color: Colors.grey,
            fontFamily: Lang.of(context).poppins,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
