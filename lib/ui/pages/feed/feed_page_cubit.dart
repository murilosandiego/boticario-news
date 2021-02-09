import 'package:boticario_news/ui/pages/feed/cubit/feed_cubit.dart';
import 'package:boticario_news/ui/pages/feed/cubit/feed_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/reload_screen.dart';
import 'components/modal_post.dart';
import 'components/post_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPageCubit extends StatefulWidget {
  @override
  _FeedPageCubitState createState() => _FeedPageCubitState();
}

class _FeedPageCubitState extends State<FeedPageCubit> {
  final cubit = Get.find<FeedCubit>();

  @override
  void initState() {
    super.initState();

    cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F2F5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Feed',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => cubit.logoutUser(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalPost(context),
        child: Icon(Icons.post_add),
      ),
      body: RefreshIndicator(
        child: BlocBuilder<FeedCubit, FeedState>(
          cubit: cubit,
          builder: (context, state) {
            if (state is FeedLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FeedError) {
              return ReloadScreen(
                error: state.message,
                reload: cubit.load,
              );
            }

            if (state is FeedLoaded) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: state.news.length,
                itemBuilder: (_, index) {
                  final news = state.news[index];
                  return PostWidget(news: news);
                },
              );
            }

            return SizedBox();
          },
        ),
        onRefresh: () => cubit.load(),
      ),
    );
  }
}
