import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:frontend/features/personal_data/presentation/controllers/cubit/image_change_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

enum Source { gallery, front, rear }

class UserPersonImg extends StatefulWidget {
  const UserPersonImg({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<UserPersonImg> createState() => _UserPersonImgState();
}

class _UserPersonImgState extends State<UserPersonImg> {
  late String imagePath;
  @override
  void initState() {
    super.initState();
    imagePath = widget.userModel.img ?? "assets/images/mystery.png";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageChangeCubit>(
      create: (context) => ImageChangeCubit(imagePath: imagePath),
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: () {
              ImagePicker picker = ImagePicker();
              final cubit = context.read<ImageChangeCubit>();
              showBottomSheet(
                backgroundColor: MyColors.primaryColor,

                context: context,
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: BottomSheet(
                    backgroundColor: MyColors.primaryColor,
                    showDragHandle: false,
                    enableDrag: false,
                    onClosing: () {},
                    builder: (context) {
                      return SizedBox(
                        height: 100,
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          spacing: 20,
                          children: [
                            MyChoice(
                              picker: picker,
                              choiceName: "Gallery",
                              icon: Icons.image,
                              source: ImageSource.gallery,
                            ),
                            MyChoice(
                              picker: picker,
                              source: ImageSource.camera,
                              icon: Icons.camera_alt,
                              choiceName: "Camera",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
              // picker.pickImage(source: ImageSource.gallery,);
            },

            child: ImageViewer(widget: widget),
          );
        },
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, required this.widget});

  final UserPersonImg widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          BlocBuilder<ImageChangeCubit, String>(
            builder: (context, imagePath) {
              return CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(File(imagePath)),
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 20),
              );
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Icon(color: MyColors.primaryColor, Icons.camera_alt_rounded),
          ),
        ],
      ),
    );
  }
}

class MyChoice extends StatelessWidget {
  const MyChoice({
    super.key,
    required this.picker,
    required this.source,
    required this.icon,
    required this.choiceName,
  });

  final ImagePicker picker;
  final ImageSource source;
  final IconData icon;
  final String choiceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () async {
            final img = await picker.pickImage(source: source);

            final dir = await getApplicationDocumentsDirectory();
            await img?.saveTo('${dir.path}/saved_image.jpg');
            // imagePath = img.path;
            log("image path = ${img?.path}");
            if (img != null) {
              context.read<ImageChangeCubit>().changeImage(imagePath: img.path);
            }
          },
          icon: Icon(icon, color: Colors.white),
        ),
        Text(choiceName, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
