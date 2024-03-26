import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.tabViewWidget,
    required this.textTitle,
    this.colorBackground = Colors.white,
    this.indicatorLabelTextColor = Colors.green,
    this.indicatorUnderline = Colors.green,
    this.unselectLabelBackground = Colors.grey,
    this.unselectTextColor = Colors.grey,
    required this.pageController,
  });

  final List<String> textTitle;
  final List<Widget> tabViewWidget;
  final Color colorBackground;
  final Color indicatorUnderline;
  final Color indicatorLabelTextColor;
  final Color unselectLabelBackground;
  final Color unselectTextColor;
  final PageController pageController;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late final ScrollController scrollController;
  int currentPage = 0;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Center(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.5,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.unselectLabelBackground
              ),
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.tabViewWidget.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      widget.pageController.animateToPage(
                        index,
                        duration: const Duration(microseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width * 0.5 / widget.tabViewWidget.length,
                      decoration: BoxDecoration(
                        color: index == currentPage ? purpleButton2 : widget.unselectLabelBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.textTitle[index],
                        style: TextStyle(
                          fontSize: 20,
                          color: index == currentPage
                              ? widget.indicatorLabelTextColor
                              : widget.unselectTextColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ExpandablePageView.builder(
            controller: widget.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) => setState(() => currentPage = index),
            itemCount: widget.tabViewWidget.length,
            itemBuilder: (context, index) => widget.tabViewWidget[index],
          ),
        ],
      ),
    );
  }
}
