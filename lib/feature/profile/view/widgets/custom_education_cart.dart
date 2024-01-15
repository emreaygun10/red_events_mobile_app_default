import 'package:auto_size_text/auto_size_text.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CustomEducationCard extends StatelessWidget {
  const CustomEducationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        color: ColorName.neutral0,
        child: Column(
          children: [
            CustomProfileNetworkNetworkImage(
              imageUrl: 'https://picsum.photos/id/237/200/300',
              boxFit: BoxFit.fill,
              size: Size(335.w, 136.h),
              topLeft: const Radius.circular(20).r,
              topRight: const Radius.circular(20).r,
            ),
            const Padding(
              padding: ProjectPadding.symmetricNormalV(),
              child: LinearProgressIndicator(),
            ),
            Padding(
              padding: const ProjectPadding.scaffold(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const ProjectPadding.symmetricNormalV(),
                    child: AutoSizeText(
                      'Zaman Yönetimi',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricSmallV(),
                    child: AutoSizeText(
                      'Lorem ipsum dolor sit amet consectetur. Elit suspendisse habitant vitae vulputate nibh quis',
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
