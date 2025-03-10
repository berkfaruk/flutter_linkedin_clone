import 'package:flutter/material.dart';
import 'package:flutter_linkedin_clone/data/post_entity.dart';
import 'package:flutter_linkedin_clone/theme/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SinglePostCardWidget extends StatefulWidget {
  final PostEntity post;
  const SinglePostCardWidget({super.key, required this.post});

  @override
  State<SinglePostCardWidget> createState() => _SinglePostCardWidgetState();
}

class _SinglePostCardWidgetState extends State<SinglePostCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: linkedInWhiteFFFFFF,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset("assets/${widget.post.userProfile}"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${widget.post.username}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                        Text(
                          "${widget.post.userBio}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, color: linkedInMediumGrey86888A),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              "${widget.post.createAt} - ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: linkedInMediumGrey86888A),
                            ),
                            const Icon(
                              FontAwesomeIcons.earthAmericas,
                              size: 15,
                              color: linkedInMediumGrey86888A,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("${widget.post.description}",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Wrap(
                children: widget.post.tags!.map((tag) {
                  return Text(
                    "$tag ",
                    style: const TextStyle(color: linkedInBlue0077B5),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        widget.post.postImages!.isEmpty
            ? SizedBox(
                width: double.infinity,
                child: Image.asset("assets/${widget.post.postImage}"),
              )
            : SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    PageView(
                      children: widget.post.postImages!.map((image) {
                        return Container(
                          width: double.infinity,
                          color: linkedInMediumGrey86888A,
                          child: Image.asset(
                            "assets/$image",
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      right: 15,
                      top: 15,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: linkedInWhiteFFFFFF),
                        child: const Center(
                          child: Icon(FontAwesomeIcons.images),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                  child: _singleReactItemWidget(
                      bgColor: Colors.blue.shade200, image: "thumbs_up.png")),
              Positioned(
                  left: 16,
                  child: _singleReactItemWidget(
                      bgColor: Colors.red.shade200, image: "love.png")),
              Positioned(
                  left: 34,
                  child: _singleReactItemWidget(
                      bgColor: Colors.amber.shade200, image: "insightful.png")),
              Positioned(
                left: 70,
                child: Text("${widget.post.totalReacts}"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.post.totalComments} comments - ",
                    style: const TextStyle(
                        color: linkedInMediumGrey86888A, fontSize: 15),
                  ),
                  Text(
                    "${widget.post.totalReposts} reposts",
                    style: const TextStyle(
                        color: linkedInMediumGrey86888A, fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 1,
          color: linkedInLightGreyCACCCE,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _singleActionItemWidget(
                icon: Icons.thumb_up_alt_outlined, title: "Like"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.commentDots, title: "Comment"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.retweet, title: "Repost"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.paperPlane, title: "Send"),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 8,
          color: linkedInLightGreyCACCCE,
        ),
      ],
    );
  }

  _singleReactItemWidget({String? image, Color? bgColor}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: linkedInWhiteFFFFFF)),
      child: Image.asset(
        "assets/$image",
        width: 10,
        height: 10,
      ),
    );
  }

  _singleActionItemWidget({IconData? icon, String? title}) {
    return Column(
      children: [
        Icon(
          icon,
          color: linkedInMediumGrey86888A,
        ),
        Text(
          "$title",
          style: const TextStyle(color: linkedInMediumGrey86888A),
        )
      ],
    );
  }
}
