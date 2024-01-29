import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_stories/views/stories/story_page_vm.dart';
import 'package:instagram_stories/views/stories/widget/story_widget.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  StoryPageVM vm = Get.put<StoryPageVM>(StoryPageVM());

  @override
  void initState() {
    super.initState();
    vm.readJsonData();
    vm.showProgress(this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryPageVM>(builder: (logic) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: PageView.builder(
            controller: vm.pageStoriesController,
            onPageChanged: vm.onChangePage,
            itemCount: logic.list.length,
            itemBuilder: (context, index) {
              return StoryWidget(
                story: logic.list[index],
                vm: vm,
              );
            },
          ),
        ),
      );
    });
  }
}
