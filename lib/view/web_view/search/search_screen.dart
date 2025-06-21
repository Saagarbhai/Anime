import 'package:anime/core/utils/app_export.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return Scaffold(
      appBar: _appbar(context),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.searchStatus == Status.init) {
            searchBloc.add(LoadSearchDataEvent());
          }
          if (state.searchStatus == Status.loading) {
            return ShimmerEffects.searchShimmer();
          } else if (state.searchStatus == Status.success) {
            return Column(
              children: [
                Column(
                  children: [
                    Gap(12.h),
                    SafeArea(
                      minimum: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomSearchField(controller: controller),
                    ),
                  ],
                ),
                Gap(8.h),
                Expanded(child: _buildListView(state.data)),
              ],
            );
          } else {
            return Scaffold(
              body: Center(
                child: Text(state.data.toString()),
              ),
            );
          }
        },
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

  Widget _buildListView(List<Anime> anime) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: anime.length,
      separatorBuilder: (context, index) => Gap(12.h),
      itemBuilder: (context, index) {
        return AnimeListCard(anime: anime[index]);
      },
    );
  }
}
