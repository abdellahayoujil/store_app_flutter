class Product {
  final int? id, price;
  final String? title, subTitle, description, image;

  Product(
      {this.id,
      this.price,
      this.title,
      this.subTitle,
      this.description,
      this.image});
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "سماعات لاسلكية",
    subTitle: "جودة صوت عالية",
    image: "images/airpod.png",
    description:
        "سماعات لاسلكية توفر جودة صوت ممتازة، مع تصميم مريح يناسب الاستماع لفترات طويلة.",
  ),
  Product(
    id: 2,
    price: 1099,
    title: "جهاز موبايل",
    subTitle: "وأصبح للموبايل قوة",
    image: "images/mobile.png",
    description:
        "جهاز موبايل عالي الأداء مع خصائص متطورة تتيح لك استخدامه في كل مكان.",
  ),
  Product(
    id: 3,
    price: 39,
    title: "نظارات ثلاثية الأبعاد",
    subTitle: "لنقلك للعالم الافتراضي",
    image: "images/class.png",
    description:
        "نظارات ثلاثية الأبعاد تقدم لك تجربة غامرة في مشاهدة الأفلام والألعاب.",
  ),
  Product(
    id: 4,
    price: 56,
    title: "سماعات",
    subTitle: "لساعات استماع طويلة",
    image: "images/headset.png",
    description:
        "سماعات مريحة ومثالية للاستماع لساعات طويلة مع صوت نقي وواضح.",
  ),
  Product(
    id: 5,
    price: 68,
    title: "مسجل صوت",
    subTitle: "سجل اللحظات المهمة حولك",
    image: "images/speaker.png",
    description:
        "مسجل صوت عالي الجودة يتيح لك تسجيل جميع لحظاتك المهمة بشكل واضح.",
  ),
  Product(
    id: 6,
    price: 39,
    title: "كاميرات كمبيوتر",
    subTitle: "بجودة ودقة صورة عالية",
    image: "images/camera.png",
    description:
        "كاميرات كمبيوتر توفر لك تصويراً واضحاً بجودة عالية لدردشات الفيديو.",
  ),
  Product(
    id: 7,
    price: 120,
    title: "شاحن موبايل سريع",
    subTitle: "شحن سريع وآمن",
    image: "images/charger.png",
    description:
        "شاحن موبايل سريع يوفر لك شحن جهازك بشكل أسرع وآمن ليظل جهازك جاهزاً للاستخدام.",
  ),
  Product(
    id: 8,
    price: 250,
    title: "ساعة ذكية",
    subTitle: "مراقبة الصحة واللياقة البدنية",
    image: "images/smartwatch.png",
    description:
        "ساعة ذكية تقدم لك ميزات مثل تتبع النشاطات الرياضية وقياس نبضات القلب.",
  ),
  Product(
    id: 9,
    price: 300,
    title: "جهاز تتبع اللياقة البدنية",
    subTitle: "لتحقيق أهدافك الصحية",
    image: "images/fitness_tracker.png",
    description:
        "جهاز تتبع اللياقة البدنية يساعدك في مراقبة نشاطك الرياضي وتتبع تقدمك نحو أهدافك.",
  ),
];

