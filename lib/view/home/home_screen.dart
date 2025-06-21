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
                  AnimeCarouselSlider(animeList: state.data),
                  CustomTextWidget(text: Lang.of(context).lbl_tv),
                  AnimeHorizontalListView(listData: state.tvData),
                  CustomTextWidget(text: Lang.of(context).lbl_movie),
                  AnimeHorizontalListView(listData: state.movieData),
                  CustomTextWidget(text: Lang.of(context).lbl_allAnime),
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

  AppBar appbar(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return AppBar(
      title: Text(
        Lang.of(context).appbar_title,
        style: MyAppThemeHelper.lightTheme.textTheme.titleLarge!
            .copyWith(color: MyAppThemeHelper.white),
      ),
      centerTitle: true,
      backgroundColor: MyAppThemeHelper.primary,
      foregroundColor: MyAppThemeHelper.white,
      actions: [
        IconButton(
          icon: Icon(Icons.search, size: 24.sp),
          onPressed: () {
            Navigator.pushNamed(context, AppConstants.searchRoute);
            searchBloc.add(LoadSearchDataEvent());
          },
        ),
      ],
    );
  }

  Widget _buildListView(List<Anime> anime) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: anime.length,
      separatorBuilder: (context, index) => Gap(12.h),
      itemBuilder: (context, index) {
        return AnimeListCard(anime: anime[index]);
      },
    );
  }
}
