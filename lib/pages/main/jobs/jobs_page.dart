import 'package:flutter/material.dart';
import 'package:flutter_linkedin_clone/theme/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _jobsTopItems(title: "Preferences", onTap: () {}),
                _jobsTopItems(title: "My jobs", onTap: () {}),
                _jobsTopItems(title: "Post a job", onTap: () {}),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 14,
              color: linkedInLightGreyCACCCE,
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recomended for you",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildRecommendedJobsList(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 8,
              color: linkedInLightGreyCACCCE,
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "More jobs for you",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildMoreJobsForYouList(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildRecommendedJobsList() {
    return Column(
      children: [
        SizedBox(
          height: 380,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: linkedInLightGreyCACCCE.withValues(alpha: .6),
                    ),
                    child: const Icon(
                      Icons.home_work,
                      size: 50,
                      color: linkedInMediumGrey86888A,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Job Title",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.close,
                                size: 30, color: linkedInMediumGrey86888A),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "Company name",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.a,
                              size: 30,
                              color: Colors.green,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Actively recruiting",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: linkedInMediumGrey86888A),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: const TextSpan(
                            text: "Promoted - ",
                            style: TextStyle(
                                fontSize: 12, color: linkedInMediumGrey86888A),
                            children: [
                              TextSpan(
                                  text: "2 applicants",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.green)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Divider(color: linkedInMediumGrey86888A),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Show all",
              style: TextStyle(
                  fontSize: 18,
                  color: linkedInBlue0077B5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward,
              size: 25,
              color: linkedInBlue0077B5,
            )
          ],
        ),
      ],
    );
  }

  _buildMoreJobsForYouList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: linkedInLightGreyCACCCE.withValues(alpha: .6),
                ),
                child: const Icon(
                  Icons.home_work,
                  size: 50,
                  color: linkedInMediumGrey86888A,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Job Title",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.close,
                          size: 30,
                          color: linkedInMediumGrey86888A,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Company name",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.a,
                          size: 30,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Actively recruiting",
                          style: TextStyle(
                              fontSize: 12, color: linkedInMediumGrey86888A),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: const TextSpan(
                        text: "Promoted - ",
                        style: TextStyle(
                            fontSize: 12, color: linkedInMediumGrey86888A),
                        children: [
                          TextSpan(
                            text: "2 applicants",
                            style: TextStyle(fontSize: 12, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      color: linkedInMediumGrey86888A,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  _jobsTopItems({String? title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0, color: linkedInMediumGrey86888A),
        ),
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
                fontSize: 18,
                color: linkedInMediumGrey86888A,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
