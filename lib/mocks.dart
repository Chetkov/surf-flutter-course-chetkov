import 'package:places/domain/sight.dart';

final sightMocks = [
  Sight('Херсонес таврический', Coordinates(44.610788, 33.493380),
      'https://avatars.mds.yandex.net/get-altay/2767250/2a000001732954b88f826c4072a6ceeb9ae1/XXXL', '''
      Херсоне́с Таври́ческий, или просто Херсоне́с — полис, основанный древними греками на Гераклейском полуострове на юго-западном побережье Крыма.
      Единственный античный полис Северного причерноморья, городская жизнь в котором непрерывно поддерживалась вплоть до конца XIV века.
      ''', 'historical_place'),
  Sight('Мангуп кале', Coordinates(44.599135, 33.796269),
      'https://www.krym4you.com/files/catalog/271/gallery/big//peschernyj-gorod-mangup-k_1437991932.jpg', '''
      Мангу́п — средневековый город-крепость в Бахчисарайском районе Крыма. 
      Историческое название — Дорос. Столица княжества Феодоро, затем турецкая крепость. 
      Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, 
      а над уровнем моря на 583 м и образующей плато площадью около 90 га.
      ''', 'historical_place'),
  Sight('Мыс фиолент', Coordinates(44.498834, 33.489473),
      'https://avatars.mds.yandex.net/get-altay/1987173/2a000001738a9b580a9860853954bc7955b8/XXXL', '''
      Фиоле́нт — мыс на Гераклейском полуострове на юго-западном побережье Крыма, в Балаклавском районе Севастополя.
      ''', 'nature_place'),
  Sight('Грот Дианы', Coordinates(44.498834, 33.489473),
      'https://forpostsevastopol.ru/wp-content/uploads/2018/06/k2_items_src_b2818a5562a84d0663b1f8f9b734dfb4.jpg', '''
      Грот Дианы удивительно красив. По обе стороны от мыса Лермонтова располагаются небольшие пляжи, однако виден грот только 
      с западного пляжа, на который раньше от туристической базы «Каравелла» спускалась очень крутая и не вполне безопасная лестница. 
      Чуть ли не ежегодно обвалы обрушивали части пролетов, но каждый раз с постоянным упорством лестницу восстанавливали, 
      пока оползень полностью не перекрыл пути подхода к гроту Дианы. Теперь к нему возможно попасть только с соседнего пляжа — «Царское село».
      ''', 'nature_place'),
];