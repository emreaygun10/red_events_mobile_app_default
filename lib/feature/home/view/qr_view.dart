import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/mixin/qr_mixin.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class QRCameraView extends StatefulWidget {
  const QRCameraView({super.key});

  @override
  State<QRCameraView> createState() => _QRCameraViewState();
}

class _QRCameraViewState extends BaseState<QRCameraView> with QrMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildBottomSheet(context),
      backgroundColor: ColorName.neutral0,
      appBar: buildAppBar(),
      body: Column(
        children: [
          const Divider(
            color: ColorName.neutral200,
          ),
          buildTopContent(),
          Expanded(flex: 5, child: _buildQrView(context)),
        ],
      ),
    );
  }

  SolidBottomSheet buildBottomSheet(BuildContext context) {
    return SolidBottomSheet(
      controller: solidController,
      headerBar: const SizedBox(),
      body: Container(
        padding: const ProjectPadding.allNormal(),
        height: 494.h,
        width: context.sized.width,
        decoration: BoxDecoration(
          color: ColorName.neutral0,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ).r,
        ),
        child: Column(
          children: [
            Padding(
              padding: const ProjectPadding.symmetricNormalV(),
              child: AutoSizeText(
                LocaleKeys.profile_requests_request_permission_information.tr(),
                style: textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              color: ColorName.neutral200,
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              height: 88.h,
              width: 88.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 88.h,
                    width: 88.w,
                    padding: const ProjectPadding.allMedium(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.neutral200.withOpacity(0.4),
                    ),
                  ),
                  Container(
                    height: 56.h,
                    width: 56.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.orangeBase,
                    ),
                  ),
                  Assets.icons.icErrorWarningFill.toGetSvgWithColor(
                    color: ColorName.neutral0,
                    height: 28,
                    width: 28,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const ProjectPadding.symmetricNormalV()
                  .copyWith(left: 10, right: 10)
                  .r,
              child: Column(
                children: [
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    LocaleKeys.qr_bottom_sheet_base_title.tr(args: ['5', '25']),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  AutoSizeText(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    LocaleKeys.qr_bottom_sheet_sub_title.tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorName.neutral500,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 58.h,
              width: context.sized.width,
              child: ElevatedButton(
                onPressed: () {},
                child: AutoSizeText(
                  LocaleKeys.general_button_continue.tr(),
                  style:
                      textTheme.titleLarge!.copyWith(color: ColorName.neutral0),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 58.h,
              width: context.sized.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.neutral0,
                ),
                onPressed: () {
                  solidController.hide();
                },
                child: AutoSizeText(
                  LocaleKeys.general_button_give_up.tr(),
                  style: textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildTopContent() {
    return Expanded(
      child: SizedBox(
        height: 65.h,
        width: 223.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              '29 Ocak 07:00 Giriş',
              style: textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            AutoSizeText(
              'F&B / Manzara Restaurant',
              style: textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorName.neutral500,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //       margin: const EdgeInsets.all(8),
            //       child: ElevatedButton(
            //         onPressed: () async {
            //           await controller?.toggleFlash();
            //           setState(() {});
            //         },
            //         child: FutureBuilder(
            //           future: controller?.getFlashStatus(),
            //           builder: (context, snapshot) {
            //             return Text(
            //               'Flash: ${snapshot.data}',
            //               style: textTheme.titleMedium!
            //                   .copyWith(color: ColorName.neutral0),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.all(8),
            //       child: ElevatedButton(
            //         onPressed: () async {
            //           await controller?.flipCamera();
            //           setState(() {});
            //         },
            //         child: FutureBuilder(
            //           future: controller?.getCameraInfo(),
            //           builder: (context, snapshot) {
            //             if (snapshot.data != null) {
            //               return Text(
            //                 'Camera facing ${describeEnum(snapshot.data!)}',
            //                 style: textTheme.titleMedium!
            //                     .copyWith(color: ColorName.neutral0),
            //               );
            //             } else {
            //               return Text(
            //                 'loading',
            //                 style: textTheme.titleMedium!
            //                     .copyWith(color: ColorName.neutral0),
            //               );
            //             }
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //       margin: const EdgeInsets.all(8),
            //       child: ElevatedButton(
            //         onPressed: () async {
            //           await controller?.pauseCamera();
            //         },
            //         child: const Text(
            //           'pause',
            //           style: TextStyle(
            //             fontSize: 20,
            //             color: ColorName.neutral0,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.all(8),
            //       child: ElevatedButton(
            //         onPressed: () async {
            //           await controller?.resumeCamera();
            //         },
            //         child: const Text(
            //           'resume',
            //           style: TextStyle(
            //             fontSize: 20,
            //             color: ColorName.neutral0,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      surfaceTintColor: ColorName.neutral0,
      backgroundColor: ColorName.neutral0,
      title: AutoSizeText(
        'QR Okut',
        style: textTheme.titleLarge,
      ),
      centerTitle: true,
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    final scanArea =
        (context.sized.width < 400.w || context.sized.height < 400.h)
            ? 200.0
            : 350.0.r;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: ColorName.neutral0,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => onPermissionSet(context, ctrl, p),
    );
  }
}
