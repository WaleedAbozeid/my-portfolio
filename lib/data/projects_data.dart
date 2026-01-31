import 'models/project.dart';

final List<Project> sampleProjects = [
  Project(
    id: '1',
    title: 'Wesal - وصال',
    description: 'تطبيق القرآن الكريم الشامل مع التجويد والتفسير',
    fullDescription:
        'تطبيق وصال هو تطبيق متكامل للقرآن الكريم يوفر تجربة قراءة مميزة مع أحكام التجويد، التفسير الميسر، وإمكانية الاستماع للتلاوات. يتضمن التطبيق واجهة سهلة الاستخدام، وضع الليل/النهار، والعديد من المميزات الأخرى لتحسين تجربة قراءة القرآن.',
    images: ['assets/Projects/Wesal Qoran/1.jpeg'],
    techStack: ['Flutter', 'Dart', 'Provider', 'SQLite', 'Audio Player'],
    category: 'Mobile Apps',
    date: DateTime(2025, 12, 1),
    githubUrl:
        'https://github.com/your-username/wesal-app', // غيّر الرابط للـ repo الحقيقي
    liveUrl:
        'https://drive.google.com/your-apk-link', // ضع رابط التحميل هنا (Drive أو GitHub Releases)
  ),
  Project(
    id: '2',
    title: 'CrackDetectX',
    description: 'AI-powered crack detection system using computer vision.',
    fullDescription:
        'Real-time detection system utilizing ML models to identify structural cracks and generate reports.',
    images: ['assets/crackdetect.png'],
    techStack: ['Python', 'TensorFlow', 'OpenCV', 'Flutter'],
    category: 'Data Analytics',
    date: DateTime(2025, 11, 15),
  ),
  Project(
    id: '3',
    title: 'ShopLite',
    description: 'Lightweight e-commerce mobile application.',
    fullDescription:
        'E-commerce app with product catalog, cart, payments via Stripe, and order tracking.',
    images: ['assets/shoplite.png'],
    techStack: ['Flutter', 'REST API', 'GetX', 'Stripe'],
    category: 'Mobile Apps',
    date: DateTime(2025, 10, 1),
  ),
];
