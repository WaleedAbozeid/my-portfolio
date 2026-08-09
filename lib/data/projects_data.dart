import 'models/project.dart';

final List<Project> sampleProjects = [
  Project(
    id: '1',
    title: 'نهج المؤمن ',
    description: 'تطبيق القرآن الكريم الشامل مع التجويد والتفسير',
    fullDescription:
        'تطبيق نهج المؤمن  هو تطبيق متكامل للقرآن الكريم يوفر تجربة قراءة مميزة مع أحكام التجويد، التفسير الميسر، وإمكانية الاستماع للتلاوات. يتضمن التطبيق واجهة سهلة الاستخدام، وضع الليل/النهار، والعديد من المميزات الأخرى لتحسين تجربة قراءة القرآن.',
    images: [
      'assets/Projects/Wesal Qoran/Picture1.png',
      'assets/Projects/Wesal Qoran/Picture2.png',
      'assets/Projects/Wesal Qoran/Picture3.png',
      'assets/Projects/Wesal Qoran/Picture4.png',
      'assets/Projects/Wesal Qoran/Picture5.png',
      'assets/Projects/Wesal Qoran/Picture6.png',
      'assets/Projects/Wesal Qoran/Picture7.png',
      'assets/Projects/Wesal Qoran/Picture8.png',
      'assets/Projects/Wesal Qoran/Picture9.png',
      'assets/Projects/Wesal Qoran/Picture10.png',
      'assets/Projects/Wesal Qoran/Picture11.png',
      'assets/Projects/Wesal Qoran/Picture12.png',
      'assets/Projects/Wesal Qoran/Picture13.png',
      'assets/Projects/Wesal Qoran/Picture14.png',
      'assets/Projects/Wesal Qoran/Picture15.png',
      'assets/Projects/Wesal Qoran/Picture16.png',
      'assets/Projects/Wesal Qoran/Picture17.png',
      'assets/Projects/Wesal Qoran/Picture18.png',
      'assets/Projects/Wesal Qoran/Picture19.png',
      'assets/Projects/Wesal Qoran/Picture20.png',
      'assets/Projects/Wesal Qoran/Picture21.png',
      'assets/Projects/Wesal Qoran/Picture22.png',
      'assets/Projects/Wesal Qoran/Picture23.png',
      'assets/Projects/Wesal Qoran/Picture24.png',
      'assets/Projects/Wesal Qoran/Picture25.png',
      'assets/Projects/Wesal Qoran/Picture26.png',
      'assets/Projects/Wesal Qoran/Picture27.png',
      'assets/Projects/Wesal Qoran/Picture28.png',


    ],

    techStack: ['Flutter', 'Dart', 'Provider', 'SQLite', 'Audio Player'],
    category: 'Mobile Apps',
    date: DateTime(2025, 12, 1),
    githubUrl: 'https://github.com/WaleedAbozeid/wesal-app',
    downloadUrl:
        'https://drive.google.com/file/d/1j4prDP66jAvwfe6i5_QqALB4COVHmaWA/view?usp=drive_link', // ضع رابط APK هنا
    // أو استخدم:
    // playStoreUrl: 'https://play.google.com/store/apps/details?id=com.yourapp.wesal',
    // appStoreUrl: 'https://apps.apple.com/app/wesal/id123456789',
  ),
  Project(
    id: '2',
    title: 'Aqsa (الأقصى) - تطبيق إسلامي شامل لأوقات الصلاة والآذان 🕌',
    description:
        'تطبيق إسلامي متكامل لمواقيت الصلاة الدقيقة، اتجاه القبلة، وإشعارات الآذان المخصصة.',
    fullDescription:
        'تطبيق "الأقصى" هو تطبيق إسلامي متكامل تم تطويره باستخدام إطار عمل Flutter لتزويد المستخدمين بمواقيت الصلاة الدقيقة، اتجاه القبلة، وتجربة تنبيهات وإشعارات مخصصة. صُمم التطبيق ليكون رفيقاً يومياً للمسلم، مع التركيز على الأداء السلس، الاستهلاك المنخفض للموارد (Offline first)، وإمكانية التخصيص الكاملة لكل مستخدم.\n\n'
        'المميزات الرئيسية:\n'
        '1. نظام دقيق لحساب مواقيت الصلاة: استخدام خطوط الطول والعرض لحساب أوقات الصلوات الخمس بدقة يومياً استناداً إلى مكتبة adhan. مؤقت ذكي وتنازلي يعرض الوقت المتبقي للصلاة القادمة.\n'
        '2. إشعارات الآذان المحلية: جدولة تلقائية للإشعارات دون الحاجة للاتصال بالإنترنت. التكامل مع مكتبة timezone لضمان عمل الإشعارات بدقة. إمكانية تشغيل وإيقاف تنبيهات الآذان لكل صلاة بشكل منفصل.\n'
        '3. تحديد القبلة الذكي: بوصلة تفاعلية وسريعة الاستجابة تعمل عن طريق مستشعرات الجهاز لمعرفة اتجاه القبلة بدقة. تحديث الاتجاه بشكل لحظي بناءً على حركة هاتف المستخدم.\n'
        '4. تخصيص المؤذنين والصوتيات: ميزة اختيار صوت مؤذن محدد. إمكانية تخصيص صوت أذان مخصص لكل صلاة على حدة.\n'
        '5. إدارة الموقع الجغرافي المتقدمة: التحديد التلقائي عبر GPS، التحديد اليدوي، والمواقع المحفوظة للتبديل السريع.\n\n'
        'المميزات الفرعية: طرق الحساب المعتمدة، المذاهب الفقهية، إدارة واجهة المستخدم مع Provider.\n\n'
        'التقنيات: Flutter & Dart، Provider، Shared Preferences، flutter_local_notifications، audioplayers، geolocator، geocoding، flutter_compass، adhan.',
    images: [
      'assets/Projects/aqsa/3.png',
      'assets/Projects/aqsa/2.png',
      'assets/Projects/aqsa/1.png',
      'assets/Projects/aqsa/4.png',
      'assets/Projects/aqsa/5.png',
      'assets/Projects/aqsa/6.png',
      'assets/Projects/aqsa/7.png',
    ],
    techStack: [
      'Flutter',
      'Dart',
      'Provider',
      'Shared Preferences',
      'flutter_local_notifications',
      'audioplayers',
      'geolocator',
      'geocoding',
      'flutter_compass',
      'adhan',
    ],
    category: 'Mobile Apps',
    date: DateTime(2024, 1, 1),
    githubUrl: 'https://github.com/WaleedAbozeid/aqsa-app',
    downloadUrl: 'https://drive.google.com/file/d/.../view?usp=drive_link',
  ),
  Project(
    id: '3',
    title: '🏗️ CrackDetectX — منصة ذكاء اصطناعي هندسية متكاملة',
    description:
        'نظام هندسي رقمي متكامل (Digital Engineering System) يدمج الذكاء الاصطناعي لفحص التصدعات الإنشائية، وسوق العمل الهندسي، ولوحة تحكم إدارية متقدمة (RBAC).',
    fullDescription:
        '📌 نبذة تعريفية شاملة:\n'
        'CrackDetectX ليس مجرد تطبيق، بل هو نظام هندسي رقمي متكامل (Digital Engineering System) يضم في داخله ثلاثة أنظمة متكاملة تعمل بتناسق تام:\n'
        '1. نظام الفحص الذكي (AI Inspection System): تحليل التصدعات الخرسانية والإنشائية بالذكاء الاصطناعي وتوليد تقارير PDF.\n'
        '2. سوق العمل الهندسي (Engineering Marketplace): منصة تربط مالكي المباني بشركات الترميم والمهندسين الميدانيين وتُدير دورة حياة المشروع الكاملة.\n'
        '3. لوحة تحكم إدارية متقدمة (Enterprise Admin Panel): نظام إدارة كامل مع صلاحيات متعددة المستويات (RBAC) يُمكّن المشرفين من مراقبة كل عمليات المنصة.\n\n'
        '🔍 المشكلة والحل:\n'
        '❌ المشكلة:\n'
        '• فحص يدوي بطيء وغير دقيق للتصدعات الإنشائية يعتمد على الخبرة البصرية الشخصية.\n'
        '• غياب منصة موثوقة تربط مالكي المباني بمختصي الترميم بطريقة شفافة وآمنة.\n'
        '• فوضى في إدارة العقود وغياب أي توثيق رسمي لمراحل التسليم والاستلام.\n'
        '• غياب آلية منظمة ومحايدة لحل النزاعات بين الأطراف.\n\n'
        '✅ الحل الذي تقدمه المنصة:\n'
        '• نموذج ذكاء اصطناعي يفحص الصور ويُصنّف الشروخ فورياً بدقة +94.5%.\n'
        '• سوق هندسي شفاف بنظام مزايدة (Bidding) مدروس وآمن.\n'
        '• دورة حياة عقد كاملة من إنشاء العقد حتى التسليم النهائي والتقييم.\n'
        '• نظام نزاعات رسمي يخضع لتحكيم المنصة.\n\n'
        '🛠️ ما الذي طوّرته فعلياً بالتفصيل؟\n\n'
        '📱 أولاً: تطبيق Flutter (الجوال و Desktop):\n'
        '• منظومة المصادقة والمستخدمين: تسجيل دخول وإنشاء حساب مع JWT Token و Refresh Token. دعم 5 أنواع مستخدمين (building_owner, field_engineer, repair_company, admin, super_admin) مع واجهات مخصصة لكل نوع. نظام توثيق احترافي (Verification System) للمهندسين والشركات، وحماية الشاشات بنظام AuthGuard و AdminAuthGuard مع التحقق المزدوج.\n'
        '• وحدة فحص التصدعات بالذكاء الاصطناعي: التقاط أو رفع الصور من الكاميرا أو المعرض، تحليل لحظي للصورة عبر نموذج ONNX، تصنيف 4 مستويات خطورة (Low / Medium / High / Critical)، تحديد مناطق الشروخ ودرجات الخطورة برسم Bounding Boxes، وتوليد تقارير PDF احترافية تشمل بيانات المبنى، صور الفحص المُحلَّلة، تقييم الخطورة، التوصيات الهندسية، وبيانات المهندس، بالإضافة إلى أرشفة الفحوصات وإدارة بيانات المباني.\n'
        '• سوق العمل الهندسي (Engineering Marketplace): إنشاء طلبات الترميم وتلقي عروض الأسعار (Bidding) مع تصفية متقدمة حسب السعر والتقييم وسجل المشاريع، وقبول العروض لتحويلها تلقائياً إلى عقود ملزمة.\n'
        '• دورة حياة العقد الكاملة (Contract Lifecycle Management): شاشة تفاصيل العقد تعكس كل مراحل المشروع (draft, active, in_progress, pending_completion, completed, disputed, cancelled) مع شريط إنجاز بصري، تحديثات دورية بالصور والتفاصيل، وآلية تسليم وقبول/رفض مسببة تفتح نافذة التقييم فور اكتمال العمل.\n'
        '• نظام النزاعات الهندسية (Dispute System): رفع نزاع رسمي مسبب من أي طرف (تأخير، جودة العمل، التسعير، توقف العمل، أخرى) وتجميد العقد لإحالته للتحكيم الإداري.\n'
        '• نظام المحادثات الفورية (In-App Messaging): محادثة مباشرة بين المالك والمهندس/الشركة مرتبطة بكل عقد مع دعم إرسال الصور وملفات PDF (المخططات، التقارير)، استخدام Polling تلقائي كل 10 ثوانٍ لاستقبال الرسائل، وزر دعم فني مدمج.\n'
        '• نظام الإشعارات والتصميم: إشعارات فورية لكل الأحداث (Push Notifications)، دعم كامل للوضعين الداكن والفاتح (Dark/Light Mode)، دعم RTL/LTR (العربية والإنجليزية) بالكامل، معالجة استثنائية لحالات الشبكة (Loading, Error, Empty States)، وتصميم Material Design 3 سلس وموحد.\n\n'
        '⚙️ ثانياً: الـ Back-End (Node.js + PostgreSQL):\n'
        '• قاعدة البيانات والمعمارية: PostgreSQL كقاعدة بيانات علاقية مع Schema متكاملة تضم 17+ جدولاً (users, buildings, scans, reports, requests, bids, contracts, contract_messages, contract_updates, disputes, reviews, support_tickets, ticket_replies, notifications, audit_logs, flagged_messages, deleted_users).\n'
        '• منظومة الأمان: JWT Authentication مع Refresh Token، RBAC متعدد الطبقات، خوارزمية كشف التحايل (Fraud Detection Engine) لكشف محاولات مشاركة أرقام الهواتف أو الاتصال الخارجي، و Rate Limiting & Validation لكافة الـ Endpoints.\n'
        '• APIs المبنية (+100 Endpoint): تشمل المصادقة، إدارة المستخدمين والمباني، الفحص والتقارير، عروض السوق والعقود، المحادثات والمرفقات، الدعم الإداري والنزاعات، والإشعارات.\n\n'
        '🛡️ ثالثاً: لوحة تحكم الأدمن (Admin Panel):\n'
        'بناء لوحة تحكم إدارية شاملة تضم +12 شاشة إدارية منفصلة: لوحة المؤشرات (Dashboard KPIs الحية)، إدارة وبحث المستخدمين، قائمة انتظار التوثيق (Verification Queue)، مراجعة مشاريع السوق (Marketplace Review)، إدارة وتصفية النزاعات (Dispute Resolution)، رقابة المحادثات (Contract Chats Monitor)، الرسائل المخالفة والاحتيال (Flagged Messages)، تذاكر الدعم الفني (Support Tickets)، مركز الإشعارات الجماعية، الخريطة الحرارية للأضرار (Damage Heatmap)، إدارة الصلاحيات (RBAC)، استخراج التقرير الإحصائي للنظام، وأرشيف الحسابات المحذوفة.\n\n'
        '🤖 رابعاً: نموذج الذكاء الاصطناعي (AI Model):\n'
        '• تدريب نموذج شبكات عصبية على آلاف الصور الفعلية للتصدعات الخرسانية والإنشائية.\n'
        '• تحويل النموذج من PyTorch إلى صيغة ONNX لتشغيله مباشرة في Node.js عبر ONNX Runtime.\n'
        '• تحليل الصور: تصنيف النوع، تقدير مساحة التصدع، نسبة الخطورة، وتوليد Heatmap بصري.\n'
        '• دعم التشغيل المحلي (On-Device) والسحابي (Cloud) حسب إمكانيات الجهاز.\n\n'
        '📐 معمارية النظام (System Architecture):\n'
        'نمط Clean Layered Architecture مع فصل تام بين UI Layer, State Layer (Provider), Repository Layer, و Network Layer (Dio + Interceptors).\n\n'
        '📊 الأرقام والإحصائيات:\n'
        '• دقة نموذج الذكاء الاصطناعي: +94.5%\n'
        '• عدد الشاشات التفاعلية: +25 شاشة\n'
        '• عدد API Endpoints: +100 endpoint\n'
        '• جداول قاعدة البيانات: +17 جدول\n'
        '• أخطاء تحليليّة (Dart Analyze): 0 Errors\n\n'
        '🧰 قائمة التقنيات الكاملة:\n'
        '• Flutter & Dart: Provider, Dio, SharedPreferences, fl_chart, file_picker, url_launcher, image_picker, flutter_localizations.\n'
        '• Node.js & Back-End: Express.js, PostgreSQL, JWT, Bcrypt, Multer, Cloudinary, ONNX Runtime.\n'
        '• AI & Python: PyTorch, OpenCV, ONNX Export Tools, NumPy.\n'
        '• DevOps & Tools: Git, Postman, pgAdmin, VS Code, Android Studio.',
    images: [
      'assets/Projects/CrackDetectX/1.jpeg',
      'assets/Projects/CrackDetectX/Picture1.png',
      'assets/Projects/CrackDetectX/Picture2.png',
      'assets/Projects/CrackDetectX/Picture3.png',
      'assets/Projects/CrackDetectX/Picture4.png',
      'assets/Projects/CrackDetectX/Picture5.png',
      'assets/Projects/CrackDetectX/Picture6.png',
      'assets/Projects/CrackDetectX/Picture7.png',
      'assets/Projects/CrackDetectX/Picture8.png',
      'assets/Projects/CrackDetectX/Picture9.png',
      'assets/Projects/CrackDetectX/Picture11.png',
      'assets/Projects/CrackDetectX/Picture12.png',
      'assets/Projects/CrackDetectX/Picture13.png',
      'assets/Projects/CrackDetectX/Picture14.png',
      'assets/Projects/CrackDetectX/Picture15.png',
      'assets/Projects/CrackDetectX/Picture16.png',
      'assets/Projects/CrackDetectX/Picture17.png',
      'assets/Projects/CrackDetectX/Picture18.png',
      'assets/Projects/CrackDetectX/Picture19.png',
      'assets/Projects/CrackDetectX/Picture20.png',
      'assets/Projects/CrackDetectX/Picture21.png',
      'assets/Projects/CrackDetectX/Picture22.png',
      'assets/Projects/CrackDetectX/Picture23.png',
      'assets/Projects/CrackDetectX/Picture24.png',
      'assets/Projects/CrackDetectX/Picture25.png',
      'assets/Projects/CrackDetectX/Picture26.png',
      'assets/Projects/CrackDetectX/Picture27.png',
      'assets/Projects/CrackDetectX/Picture28.png',
      'assets/Projects/CrackDetectX/Picture29.png',
      'assets/Projects/CrackDetectX/Picture30.png',
      'assets/Projects/CrackDetectX/Picture31.png',
      'assets/Projects/CrackDetectX/Picture32.png',
      'assets/Projects/CrackDetectX/Picture33.png',
      'assets/Projects/CrackDetectX/Picture34.png',
      'assets/Projects/CrackDetectX/Picture35.png',
      'assets/Projects/CrackDetectX/Picture36.png',
      'assets/Projects/CrackDetectX/Picture37.png',
      'assets/Projects/CrackDetectX/Picture38.png',
      'assets/Projects/CrackDetectX/Picture39.png',
      'assets/Projects/CrackDetectX/Picture40.png',
    ],
    techStack: [
      'Flutter & Dart',
      'Provider & Dio',
      'Node.js & Express',
      'PostgreSQL',
      'ONNX & PyTorch',
      'OpenCV',
      'JWT & RBAC',
      'Material Design 3',
    ],
    category: 'AI & Mobile Applications',
    date: DateTime(2025, 11, 15),
    githubUrl: 'https://github.com/WaleedAbozeid/crackdetectx',
  ),
  Project(
    id: '4',
    title: 'برنامج الحديث - Hadith App',
    description:
        'تطبيق شامل للأحاديث النبوية يضم أكثر من 50 ألف حديث من كتب أهل السنة الموثوقة.',
    fullDescription:
        'تطبيق برنامج الحديث هو مكتبة شاملة ومتكاملة للأحاديث النبوية الشريفة، مصنفة من أشهر كتب أهل السنة مثل صحيح البخاري وصحيح مسلم وسنن الترمذي والنسائي وابن ماجه. يوفر التطبيق تجربة بحث وقراءة متقدمة مع واجهة مستخدم سهلة وجميلة.\n\n'
        '✨ المزايا والمميزات الرئيسية:\n'
        '• قاعدة بيانات شاملة: أكثر من 50 ألف حديث مصنف من مصادر موثوقة.\n'
        '• بحث متقدم: البحث السريع عن الأحاديث حسب الكلمات الدالة والراوي والكتاب والباب.\n'
        '• تصنيفات منظمة: تنظيم الأحاديث حسب الأبواب الفقهية والموضوعات الإسلامية.\n'
        '• التحقق من الأحاديث: عرض درجة الحديث (صحيح، حسن، ضعيف) مع بيانات المحدثين.\n'
        '• حفظ المفضلة: إمكانية حفظ وتعليم الأحاديث المهمة للعودة إليها لاحقاً.\n'
        '• عرض تفصيلي: معلومات كاملة عن كل حديث (الراوي، الكتاب، رقم الحديث، الشرح).\n'
        '• دعم كامل للغة العربية: واجهة بالعربية مع دعم RTL وخطوط عربية جميلة.\n'
        '• وضع بدون إنترنت: جميع الأحاديث محفوظة محلياً للوصول إليها في أي وقت.',
    images: [
      'assets/Projects/hadith/0.jpeg',
      'assets/Projects/hadith/1.jpeg',
      'assets/Projects/hadith/2.jpeg',
      'assets/Projects/hadith/3.jpeg',
      'assets/Projects/hadith/4.jpeg',
      'assets/Projects/hadith/5.jpeg',
      'assets/Projects/hadith/6.jpeg',
      'assets/Projects/hadith/7.jpeg',
    ],
    techStack: [
      'Flutter',
      'Dart',
      'SQLite',
      'GetX',
      'Responsive Design',
      'Arabic Localization',
    ],
    category: 'Mobile Apps',
    date: DateTime(2025, 10, 1),
    githubUrl: 'https://github.com/WaleedAbozeid/hadith-app',
    downloadUrl:
        'https://drive.google.com/file/d/YOUR_FILE_ID/view?usp=sharing', // ضع رابط APK هنا
  ),
  Project(
    id: '5',
    title: 'مرحبا POS - Marhaba POS',
    description:
        'تطبيق إدارة مطعم كامل لأنظمة Windows، يدعم العربية والشاشات اللمسية والطباعة الحرارية.',
    fullDescription:
        'مرحبا POS هو تطبيق إدارة مطعم كامل مطور باستخدام Flutter Desktop لأنظمة Windows. التطبيق مصمم لإدارة جميع عمليات المطعم من الطلبات إلى الدفع، مع دعم كامل للغة العربية وواجهة مستخدم مرنة تعمل على الشاشات اللمسية، الفأرة، ولوحة المفاتيح.\n\n'
        '✨ المزايا والمميزات الرئيسية:\n'
        '• إدارة المستخدمين والصلاحيات (مدير، كاشير، مطبخ، سائق).\n'
        '• إدارة القائمة وأسعار الأصناف بشكل مرن ومتعدد اللغات.\n'
        '• إدارة الطلبات (التيك أواي والدليفري) مع ترقيم تلقائي وحساب دقيق للضرائب والمجاميع.\n'
        '• طباعة الفواتير باستخدام طابعات حرارية (ESC/POS) وتصدير تقارير PDF و Excel.\n'
        '• عمل موثوق وآمن من خلال قاعدة بيانات محلية (SQLite) تعمل بدون الحاجة لإنترنت.',
    images: [
      'assets/Projects/pos/0.png',
      'assets/Projects/pos/1.png',
      'assets/Projects/pos/2.png',
      'assets/Projects/pos/3.png',
      'assets/Projects/pos/5.png',
      'assets/Projects/pos/4.png',
      'assets/Projects/pos/6.png',
      'assets/Projects/pos/7.png',
    ],
    techStack: [
      'Flutter Desktop',
      'Dart',
      'SQLite (Drift)',
      'Provider',
      'Printing (ESC/POS)',
      'Material Design',
    ],
    category: 'Desktop Applications',
    date: DateTime.now(),
    githubUrl: 'https://github.com/WaleedAbozeid/marhaba-pos',
    videoUrl: 'https://www.youtube.com',
    price: 10000,
    discount: 60,
    whatsappNumber: '201030649525',
  ),
  Project(
    id: '6', // تأكد من وضع الـ ID المناسب حسب التسلسل لديك
    title: 'Top Tube - Video Downloader',
    description:
        'تطبيق متقدم لتشغيل وتحميل مقاطع الفيديو والصوتيات بجودة عالية، مع أدوات مدمجة لإدارة وتعديل الوسائط.',
    fullDescription:
        'تطبيق Top Tube هو أداة متكاملة وفعالة مصممة لعشاق الوسائط المتعددة، يوفر تجربة سلسة لتحميل، إدارة، وتشغيل مقاطع الفيديو والصوت. التطبيق مبني بأحدث تقنيات Flutter ويوفر أداءً عالياً مع واجهة مستخدم حديثة ومليئة بالحركات التفاعلية.\n\n'
        '✨ المزايا والمميزات الرئيسية:\n'
        '• مدير تنزيلات متقدم: تحميل مقاطع الفيديو والصوت بسرعات عالية مع إمكانية استئناف التحميل وإدارة الملفات.\n'
        '• مشغل وسائط احترافي: مدمج بمشغلات قوية (Chewie & Just Audio) لتشغيل الفيديو والصوتيات بسلاسة ودعم التشغيل في الخلفية.\n'
        '• معالجة الوسائط (FFmpeg): استخراج الصوت من الفيديو أو تحويل صيغ الملفات مباشرة من داخل التطبيق بفضل دمج مكتبة FFmpeg.\n'
        '• استقبال الطلبات من الخارج: يدعم مشاركة الروابط من تطبيقات أخرى (مثل يوتيوب) للبدء في التحميل أو التشغيل فوراً، دون الحاجة لنسخ الروابط يدوياً.\n'
        '• واجهة تفاعلية وعصرية: تصميم مريح مدعوم برسومات متحركة (Lottie)، وتأثيرات تحميل (Shimmer)، ورسوم بيانية لإدارة المساحة (FL Chart).\n'
        '• تخزين محلي آمن: استخدام SQLite و Secure Storage لحفظ السجلات، الإعدادات، وأرشفة التنزيلات بأمان للوصول إليها بدون إنترنت.',
    images: [
      'assets/Projects/toptube/0.png',
      'assets/Projects/toptube/1.png',
      'assets/Projects/toptube/2.png',
      'assets/Projects/toptube/3.png',
      'assets/Projects/toptube/4.png',
      'assets/Projects/toptube/5.png',
      'assets/Projects/toptube/6.png',
    ],
    techStack: [
      'Flutter',
      'Dart',
      'Riverpod', // إدارة الحالة المستخدمة
      'FFmpeg Kit', // ميزة قوية جداً تضاف للسيرة الذاتية
      'Dio',
      'SQLite',
      'Video Player & Just Audio',
    ],
    category: 'Mobile Apps',
    date: DateTime(2026, 4, 1), // يمكنك تعديل تاريخ الانتهاء من المشروع
    githubUrl:
        'https://github.com/WaleedAbozeid/top-tube', // ضع الرابط الخاص بك
  ),
  Project(
    id: '7',
    title: 'Retail Sales Data Analysis & Dashboard',
    description:
        'تحليل متكامل لبيانات مبيعات التجزئة وتصميم لوحة معلومات (Dashboard) احترافية.',
    fullDescription:
        'يهدف هذا المشروع إلى تحليل بيانات مبيعات التجزئة عبر عدة مراحل تبدأ بتنظيف البيانات وصولاً إلى إنشاء لوحة معلومات تدعم اتخاذ القرار.\n\n'
        '1. تنظيف البيانات (Data Cleaning):\n'
        '• إزالة السجلات المكررة (Duplicate Records).\n'
        '• توحيد تنسيق التواريخ وتحويلها إلى صيغة موحدة.\n'
        '• معالجة القيم المفقودة في عمود Quantity باستخدام متوسط القيم.\n'
        '• مراجعة أنواع البيانات وتصحيح التنسيقات لضمان دقة التحليل.\n\n'
        '2. تحليل المؤشرات (Data Analysis):\n'
        '• حساب إجمالي المبيعات (Total Revenue).\n'
        '• تحديد المنتج الأكثر مبيعًا والفرع الأعلى تحقيقًا للمبيعات.\n'
        '• تحليل أداء المنتجات والفروع لاستخلاص أهم النتائج.\n\n'
        '3. التصور البياني (Data Visualization):\n'
        '• توزيع المبيعات حسب الموقع (Sales by Location).\n'
        '• مقارنة مبيعات المنتجات (Product Sales Analysis).\n'
        '• تحليل تقييمات العملاء (Customer Ratings Analysis).',
    images: ['assets/Projects/Data Analysis/task2/task2.png'],
    techStack: [
      'Microsoft Excel',
      'Power BI',
      'Power Query',
      'Data Cleaning',
      'Data Analysis',
      'Data Visualization',
      'KPI Analysis',
      'Dashboard Design',
    ],
    category: 'Data Analysis',
    date: DateTime.now(),
  ),
  Project(
    id: '8',
    title: 'Sales Data Analysis Dashboard',
    description:
        'لوحة تحكم تفاعلية (Dashboard) لتحليل المبيعات، الأرباح، وأداء المنتجات والمناطق باستخدام Power BI.',
    fullDescription:
        'مشروع تحليل بيانات شامل يهدف إلى استخراج رؤى قيمة من بيانات المبيعات وبناء لوحة تحكم تفاعلية لمساعدة الإدارة في اتخاذ القرارات الصحيحة.\n\n'
        'النقاط الرئيسية التي يعرضها الداشبورد:\n'
        '• تحليل الإيرادات (Revenue) والأرباح (Profit) على مدار الأشهر وتتبع نمو المبيعات.\n'
        '• مقارنة الإيرادات حسب فئة المنتج (Accessories, Clothing, Electronics, Furniture).\n'
        '• تحليل أداء المناطق الجغرافية (Region) لمعرفة المناطق الأعلى تحقيقاً للإيرادات (مثل الجيزة، المنيا، القاهرة، أسيوط والإسكندرية).\n'
        '• عرض أعلى 5 منتجات من حيث التكلفة.\n'
        '• توفير فلاتر تفاعلية مرنة تتيح للمستخدم تصفية البيانات حسب الشهر أو فئة المنتج بدقة.',
    images: [
      'assets/Projects/Data Analysis/task3/3.png', // مسار صورة لوحة التحكم (الداشبورد)
      'assets/Projects/Data Analysis/task3/4.png', // مسار صورة البيانات
    ],
    techStack: [
      'Power BI',
      'Data Analysis',
      'Data Visualization',
      'Dashboard Design',
    ],
    category: 'Data Analysis',
    date: DateTime.now(),
  ),
];
