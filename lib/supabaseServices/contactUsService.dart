import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/contactUsModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';

class ContactUsService {
  final Constants consts = Constants();

  List<ServiceModel> services = [
    ServiceModel(
        image:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749731400/webdevelop_1_sv0kjl.jpg",
        text:
            "Creating software applications for various platforms like mobile."
            "App development involves creating software applications for mobile or desktop platforms. "
            "It includes stages like ideation, design, coding, testing, and deployment. Developers use "
            "languages such as Java, Swift, or JavaScript along with frameworks. Key steps include conceptualization,"
            " UI/UX design, backend development, feature integration, bug testing, and deployment to app stores. Continuous"
            " updates and maintenance ensure apps remain effective and competitive in meeting user demands and technological changes.",
        title: "Mobile App Development",
        sortOrder: 1),
    ServiceModel(
        image:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749731400/appdevelop_1_amaxpr.jpg",
        text:
            "Web development involves creating websites or web applications accessible via the internet. "
            "It includes tasks such as web design, front-end development for user interface and experience,"
            " and back-end development for server-side logic and database management. Developers use languages like HTML, CSS, JavaScript, "
            "and frameworks like Flutter web or React. Security, performance optimization, and responsive design ensure websites are secure, fast, "
            "and compatible across devices. Continuous testing and updates maintain functionality and relevance amid technological advancements.",
        title: "Web Development",
        sortOrder: 2),
    ServiceModel(
        image:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749731020/anime_dev_1_w1fb6b.jpg",
        text:
            "Animations in both app and web development enhance user experience by adding dynamic elements to interfaces. "
            "In apps, animations provide visual feedback, guide users through workflows, and make interactions more engaging. "
            "Similarly, on the web, animations improve usability, draw attention to important content, and create a more immersive browsing experience."
            " Techniques such as CSS animations, JavaScript libraries like GreenSock (GSAP), or platform-specific animation frameworks "
            "in app development are commonly used to implement animations effectively.",
        title: "Animations",
        sortOrder: 3),
    ServiceModel(
        image:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749731400/app_dev_1_ysswub.jpg",
        text:
            "MERN stack development refers to building web applications using four key technologies: MongoDB, Express.js, React, and Node.js."
            " MongoDB is a NoSQL database, Express.js is a web application framework for Node.js, "
            "React is a JavaScript library for building user interfaces, and Node.js is a JavaScript runtime environment. "
            "Together, these technologies enable developers to create dynamic and scalable web applications with a single language (JavaScript)"
            " throughout the entire development stack, facilitating efficient development and maintenance.",
        title: "MERN stack",
        sortOrder: 4),
  ];

  Future<ResponseModel> sendContact(ContactUsModel model) async {
    try {
      // await supabase.from(sbconsts.contactUs).insert(model.toMap());
      await docRef.collection(consts.contactUs).add(model.toMap());
      return ResponseModel(isSuccess: true, message: "Sucess");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }

  storeServices() async {
    try {
      // await supabase.from(sbconsts.contactUs).insert(model.toMap());
      for (var element in services) {
        await docRef
            .collection(consts.services)
            .doc(element.title)
            .set(element.toMap());
      }
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }

  Future<List<ServiceModel>> getServices() async {
    try {
      QuerySnapshot data =
          await docRef.collection(consts.services).orderBy("sortOrder").get();
      List<ServiceModel> sample = data.docs
          .map((e) => ServiceModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
      // sample.sort(
      //   (a, b) => a.sortOrder.compareTo(b.sortOrder),
      // );
      return sample;
    } catch (e) {
      return services;
    }
  }
}
