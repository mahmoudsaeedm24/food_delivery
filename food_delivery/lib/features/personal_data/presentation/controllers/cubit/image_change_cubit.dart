import 'package:flutter_bloc/flutter_bloc.dart';


class ImageChangeCubit extends Cubit<String> {
  ImageChangeCubit({required String imagePath})
    : super(imagePath);

  void changeImage({required String imagePath}) {
    emit(imagePath);
  }
}
