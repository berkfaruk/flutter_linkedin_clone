import 'package:flutter/material.dart';
import 'package:flutter_linkedin_clone/theme/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool _isShowBottomModalSheet = false;
  final TextEditingController _postBodyController = TextEditingController();

  @override
  void dispose() {
    _postBodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isShowBottomModalSheet == false) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _openFirstBottomModelSheet();
        _createSubPostBottomModalSheet();
      });
      setState(() {
        _isShowBottomModalSheet = true;
      });
    }

    return Scaffold();
  }

  _openFirstBottomModelSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: linkedInWhiteFFFFFF,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: linkedInLightGreyCACCCE,
                        blurRadius: 5,
                        spreadRadius: 0.1),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close_outlined,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            "Share Post",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: linkedInMediumGrey86888A),
                          ),
                        ],
                      ),
                      Text(
                        "Post",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: _postBodyController.text.isEmpty
                                ? linkedInLightGreyCACCCE
                                : linkedInBlue0077B5),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("assets/profile_1.jpeg"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _switchWidget(
                                  title: "Doug Stevenson",
                                  prefixIcon: Icons.account_circle_rounded,
                                  suffixIcon: Icons.arrow_drop_down_outlined),
                              const SizedBox(height: 5),
                              _switchWidget(
                                  title: "Anyone",
                                  prefixIcon: FontAwesomeIcons.earthEurope,
                                  suffixIcon: Icons.arrow_drop_down_outlined),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _postBodyController,
                        onTap: () {
                          _postBodyController.addListener(() {
                            setState(() {});
                          });
                        },
                        style: const TextStyle(fontSize: 22),
                        maxLines: 15,
                        decoration: const InputDecoration(
                            hintText: "What do you want to talk about?",
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.camera_alt,
                            color: linkedInMediumGrey86888A),
                        const SizedBox(width: 15),
                        const Icon(Icons.video_call,
                            color: linkedInMediumGrey86888A),
                        const SizedBox(width: 15),
                        const Icon(Icons.image,
                            color: linkedInMediumGrey86888A),
                        const SizedBox(width: 25),
                        GestureDetector(
                            onTap: () {
                              _createSubPostBottomModalSheet();
                            },
                            child: const Icon(Icons.more_horiz,
                                color: linkedInMediumGrey86888A)),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.message_outlined,
                            color: linkedInMediumGrey86888A),
                        SizedBox(width: 10),
                        Text(
                          "Anyone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: linkedInMediumGrey86888A),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
        });
      },
    );
  }

  _switchWidget({String? title, IconData? prefixIcon, IconData? suffixIcon}) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: linkedInMediumGrey86888A),
      ),
      child: Row(
        children: [
          Icon(
            prefixIcon,
            color: linkedInMediumGrey86888A,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(width: 5),
          Icon(suffixIcon, size: 30),
        ],
      ),
    );
  }

  _createSubPostBottomModalSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: linkedInWhiteFFFFFF,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(5, 0),
                  blurRadius: 1,
                  color: linkedInLightGreyCACCCE.withValues(alpha: 0.6),
                  spreadRadius: 0.5),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 80,
                      height: 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: linkedInMediumGrey86888A),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _createSubPostNavigationItem(
                      title: "Add a photo", iconData: Icons.image),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Take a video", iconData: Icons.video_call),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Use a template", iconData: Icons.temple_buddhist),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Celebrate an occasion",
                      iconData: Icons.celebration),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Add a document",
                      iconData: Icons.document_scanner),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Share that you're hiring", iconData: Icons.work),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Find an expert",
                      iconData: Icons.account_circle_rounded),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Create a poll", iconData: Icons.bar_chart),
                  const SizedBox(height: 25),
                  _createSubPostNavigationItem(
                      title: "Create an event", iconData: Icons.event),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _createSubPostNavigationItem({String? title, IconData? iconData}) {
    return Row(
      children: [
        Icon(iconData, size: 25, color: linkedInMediumGrey86888A),
        const SizedBox(width: 10),
        Text(
          "$title",
          style: const TextStyle(
              fontSize: 16,
              color: linkedInMediumGrey86888A,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
