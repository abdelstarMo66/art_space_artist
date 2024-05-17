import 'dart:io';

import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/helpers/cache_helper.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/verify_email_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/repo/register_repo.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/constants/assets_manager.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  final formKey = GlobalKey<FormState>();
  final formKeyVerifyEmail = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailAddressController = TextEditingController();
  var phoneController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var otpController = TextEditingController();
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imgTemp = File(image.path);
      this.image = imgTemp;
      emit(const RegisterState.addProfileImageInRegister());
    } on PlatformException catch (e) {
      showToast(msg: '$e', state: ToastState.warning);
    }
  }

  Future<File> getDefaultImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  void emitRegisterStates(RegisterFormData registerFormData) async {
    emit(const RegisterState.loading());

    FormData body = FormData.fromMap({
      "name": registerFormData.name,
      "email": registerFormData.email,
      "password": registerFormData.password,
      "passwordConfirm": registerFormData.passwordConfirm,
      "phone": registerFormData.phone,
      "gender": registerFormData.gender,
    });

    if (image != null) {
      body.files.add(
        MapEntry(
          "profileImg",
          MultipartFile.fromFileSync(
            image!.path,
            filename: image!
                .path
                .split(Platform.pathSeparator)
                .last,
            contentType: MediaType.parse('image/*'),
          ),
        ),
      );
    } else {
      image = await getDefaultImageFileFromAssets(AssetsManager.imgMaleProfile);

      body.files.add(
        MapEntry(
          "profileImg",
          MultipartFile.fromFileSync(
            image!.path,
            filename: image!
                .path
                .split(Platform.pathSeparator)
                .last,
            contentType: MediaType.parse('image/*'),
          ),
        ),
      );
    }

    final response = await _registerRepo.register(
      registerFormData: body,
    );
    response.when(success: (data) {
      emit(RegisterState.success(data));
    }, failure: (error) {
      emit(RegisterState.error(error: error));
    });
  }

  void emitVerifyEmailStates(
      VerifyEmailRequestBody verifyEmailRequestBody) async {
    emit(const RegisterState.verifyEmailLoading());
    final response = await _registerRepo.verifyEmail(verifyEmailRequestBody);
    response.when(success: (data) {
      CacheHelper.saveDataSharedPreference(
          key: 'token', value: data.data.token);
      emit(RegisterState.verifyEmailSuccess(data));
    }, failure: (error) {
      emit(RegisterState.verifyEmailError(error: error));
    });
  }
}
