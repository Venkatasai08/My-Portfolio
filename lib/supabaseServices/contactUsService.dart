import 'package:portfolio/constants/supabaseConstants.dart';
import 'package:portfolio/models/contactUsModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContactUsService {
  final supabase = Supabase.instance.client;
  final SupabaseConsts sbconsts = SupabaseConsts();
  Future<ResponseModel> sendContact(ContactUsModel model) async {
    try {
      await supabase.from(sbconsts.contactUs).insert(model.toMap());
      return ResponseModel(isSuccess: true, message: "Sucess");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }
}
