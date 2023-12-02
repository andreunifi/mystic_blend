import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'it', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? itText = '',
    String? esText = '',
  }) =>
      [enText, itText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // authScreen
  {
    'fd586pa2': {
      'en': 'Login',
      'es': 'Login',
      'it': 'Login',
    },
    'wqrkhwiq': {
      'en': 'Welcome back',
      'es': 'Bienvenido de nuevo',
      'it': 'Bentornato',
    },
    '9zut80cb': {
      'en': 'Email',
      'es': 'Email',
      'it': 'Email',
    },
    'ujwbi40i': {
      'en': 'Password',
      'es': 'Password',
      'it': 'Password',
    },
    '28ratfeu': {
      'en': 'Login',
      'es': 'Acceso',
      'it': 'Login',
    },
    'qpmmjwtc': {
      'en': 'Forgot Password?',
      'es': 'Has olvidado tu contraseña?',
      'it': 'Hai dimenticato la password?',
    },
    'fcasosvv': {
      'en': 'Or login as a guest (Limited functionality)',
      'es': 'O inicie sesión como invitado (funcionalidad limitada)',
      'it': 'Oppure accedi come ospite (funzionalità limitata)',
    },
    '73v3x502': {
      'en': 'Login as a guest',
      'es': 'Iniciar sesión como invitado',
      'it': 'Accedi come ospite',
    },
    'olvgxeoe': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'it': 'Iscrizione',
    },
    'd78tzlcn': {
      'en': 'Let\'s talk about you.',
      'es': 'Hablemos de ti.',
      'it': 'Parliamo di te.',
    },
    'zlg5fh18': {
      'en': 'Email',
      'es': 'Email',
      'it': 'Email',
    },
    'dw2vqmws': {
      'en': 'Password',
      'es': 'Password',
      'it': 'Password',
    },
    'puagn3ya': {
      'en': 'Confirm Password',
      'es': 'Confirmar Password',
      'it': 'Conferma password',
    },
    'brgxgchq': {
      'en': 'Name',
      'es': 'Nombre',
      'it': 'Nome',
    },
    'yc82p6qa': {
      'en': 'Surname',
      'es': 'Apellido',
      'it': 'Cognome',
    },
    'bb3tpqx0': {
      'en': 'Cellphone',
      'es': 'Teléfono móvil',
      'it': 'Cellulare',
    },
    '1oczvfqq': {
      'en': 'Cellphone and Birthday are optional Field',
      'es': 'Teléfono celular y cumpleaños son campos opcionales',
      'it': 'Cellulare e Compleanno sono campi facoltativi',
    },
    'ggbef8ve': {
      'en': 'I\'ve read and i accept the',
      'es': 'He leído y acepto el',
      'it': 'Ho letto e accetto il',
    },
    'sdkao709': {
      'en': 'Terms and conditions',
      'es': 'Términos y condiciones',
      'it': 'Termini e Condizioni',
    },
    's1dd2rmk': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'it': 'Creare un account',
    },
    'mk61yp0a': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'i6opu5bw': {
      'en': 'Choose one option',
      'es': 'Elige una opción',
      'it': 'Scegli un\'opzione',
    },
    '174kp27h': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'y4otyg5m': {
      'en': 'Choose one option',
      'es': 'Elige una opción',
      'it': 'Scegli un\'opzione',
    },
    'qzb4el9c': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'u5siewpk': {
      'en': 'Choose one option',
      'es': 'Elige una opción',
      'it': 'Scegli un\'opzione',
    },
    '7vt4fthn': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'gl1nk7b1': {
      'en': 'Choose one option',
      'es': 'Elige una opción',
      'it': 'Scegli un\'opzione',
    },
    'ngfwx7vo': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    '38hvretx': {
      'en': 'Choose one option',
      'es': 'Elige una opción',
      'it': 'Scegli un\'opzione',
    },
    'y2v20jbu': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    '214kpv5z': {
      'en': 'Choose one option',
      'es': 'Elige una opción',
      'it': 'Scegli un\'opzione',
    },
    'cfi8hobs': {
      'en': 'Home',
      'es': 'Hogar',
      'it': 'Home',
    },
  },
  // onboardingScreen
  {
    '0hvnsqqh': {
      'en': 'About us.',
      'es': 'Sobre nosotros.',
      'it': 'Chi siamo.',
    },
    '2ht414ba': {
      'en':
          'Welcome to MysticBlend, a place to find holistic, spiritual and esoteric services and products. Discover and connect with your inner essence!',
      'es':
          'Bienvenido a MysticBlend, un lugar para encontrar servicios y productos holísticos, espirituales y esotéricos. ¡Descubre y conecta con tu esencia interior!',
      'it':
          'Benvenuti in MysticBlend, un luogo dove trovare servizi e prodotti olistici, spirituali ed esoterici. Scopri e connettiti con la tua essenza interiore!',
    },
    '5seiisfv': {
      'en': 'How does it work?',
      'es': '¿Como funciona?',
      'it': 'Come funziona?',
    },
    'br5xzb0d': {
      'en':
          'Discover the power of the app: Search, Share, Connect. Find or sell your holistic, spiritual and esoteric products, services and listings. Enter the universe of well-being!',
      'es':
          'Descubra el poder de la aplicación: busque, comparta, conecte. Encuentre o venda sus productos, servicios y listados holísticos, espirituales y esotéricos. ¡Entra en el universo del bienestar!',
      'it':
          'Scopri la potenza dell\'app: cerca, condividi, connetti. Trova o vendi i tuoi prodotti, servizi ed elenchi olistici, spirituali ed esoterici. Entra nell\'universo del benessere!',
    },
    'ltwvw7gr': {
      'en': 'Why essential oils?',
      'es': '¿Por qué aceites esenciales?',
      'it': 'Perché gli oli essenziali?',
    },
    'p0f8q167': {
      'en':
          'Embrace inner harmony with holistic, spiritual and esoteric products and services. Nourish your soul and body with the energies of well-being',
      'es':
          'Abrace la armonía interior con productos y servicios holísticos, espirituales y esotéricos. Nutre tu alma y tu cuerpo con las energías del bienestar',
      'it':
          'Abbraccia l\'armonia interiore con prodotti e servizi olistici, spirituali ed esoterici. Nutre la vostra anima e il vostro corpo con le energie del benessere',
    },
    '3k86zs4n': {
      'en': 'Let\'s start!',
      'es': '¡Empecemos!',
      'it': 'Iniziamo!',
    },
  },
  // exploreScreen
  {
    '9jxamzrl': {
      'en': 'ExploreEat',
      'es': '',
      'it': '',
    },
    'm3hzrnpu': {
      'en': 'Explore by Map',
      'es': '',
      'it': '',
    },
    'il0or7uj': {
      'en': 'Food Donation Communities',
      'es': '',
      'it': '',
    },
    '85zvz9ry': {
      'en': 'Orphan Kids',
      'es': '',
      'it': '',
    },
    'rooep119': {
      'en': 'Little Angels',
      'es': '',
      'it': '',
    },
    '4rin3nyc': {
      'en': '216 Members',
      'es': '',
      'it': '',
    },
    '6064sp17': {
      'en': 'Homeless People',
      'es': '',
      'it': '',
    },
    '0re8kel3': {
      'en': 'Street Survivors',
      'es': '',
      'it': '',
    },
    '1kccso9d': {
      'en': '352 Members',
      'es': '',
      'it': '',
    },
    'dyycfxu3': {
      'en': 'Handicapped People',
      'es': '',
      'it': '',
    },
    'w73eooiy': {
      'en': 'Handi\'Capables\'',
      'es': '',
      'it': '',
    },
    'ln11p4eu': {
      'en': '142 Members',
      'es': '',
      'it': '',
    },
    'gcd7sp7u': {
      'en': 'Senior Citizens',
      'es': '',
      'it': '',
    },
    'j7cmmz90': {
      'en': 'Vintage Voices',
      'es': '',
      'it': '',
    },
    'fxzqreny': {
      'en': '120 Members',
      'es': '',
      'it': '',
    },
    'nzzw24eo': {
      'en': 'Nearby Food Events',
      'es': '',
      'it': '',
    },
    'qbe9v62w': {
      'en': ' Share a Meal, Spread Happiness',
      'es': '',
      'it': '',
    },
    'v2zrqc0s': {
      'en': 'April 25, 2023 at 12:30pm',
      'es': '',
      'it': '',
    },
    'i1ea9wdp': {
      'en':
          'Join us for a food distribution event to help feed the needy people in our community. With the ongoing pandemic, many families are struggling to make ends meet and put food on their tables.',
      'es': '',
      'it': '',
    },
    'r0tutfyh': {
      'en': 'Interested',
      'es': '',
      'it': '',
    },
    'y5a6x677': {
      'en': 'Going',
      'es': '',
      'it': '',
    },
    'u0w7cug8': {
      'en': 'Feed the Community, Feed the Soul',
      'es': '',
      'it': '',
    },
    'gy2y4lv2': {
      'en': 'May 12, 2023 at 01:30pm',
      'es': '',
      'it': '',
    },
    'cbardzh8': {
      'en':
          'We invite you to join us for a food distribution event aimed at feeding the underprivileged and needy members of our community. We believe that everyone deserves a healthy and nutritious meal, and this event provides an opportunity to make a difference in the lives of those who are struggling.',
      'es': '',
      'it': '',
    },
    'x8asirzg': {
      'en': 'Interested',
      'es': '',
      'it': '',
    },
    'nkn9esoq': {
      'en': 'Going',
      'es': '',
      'it': '',
    },
    '7bkyb0hp': {
      'en': 'Hunger Relief Drive',
      'es': '',
      'it': '',
    },
    'pkzt40mg': {
      'en': 'June 05, 2023 at 11:30am',
      'es': '',
      'it': '',
    },
    '9ow712l5': {
      'en':
          'Join us for a hunger relief drive as we aim to make a positive impact in the lives of those facing food insecurity in our community. With the ongoing pandemic, the need for food assistance has increased significantly, and we are committed to helping those in need.',
      'es': '',
      'it': '',
    },
    'gbpjrygd': {
      'en': 'Interested',
      'es': '',
      'it': '',
    },
    'ms2lbtow': {
      'en': 'Going',
      'es': '',
      'it': '',
    },
    '2ev2qit3': {
      'en': 'Explore',
      'es': '',
      'it': '',
    },
  },
  // homeScreen
  {
    'vgovsw7q': {
      'en': 'Search products...',
      'es': 'Buscar Productos...',
      'it': 'Cerca prodotti...',
    },
    '34riox8y': {
      'en': 'Search',
      'es': 'Buscar',
      'it': 'Ricerca',
    },
    'wh85m49k': {
      'en': 'Categories',
      'es': 'Categorías',
      'it': 'Categorie',
    },
    'v3g2mi0d': {
      'en': 'Reset Categories',
      'es': 'Restablecer categorías',
      'it': 'Reimposta categorie',
    },
    'laopgtrt': {
      'en': 'Holistic Services',
      'es': 'Servicios Holísticos',
      'it': 'Servizi olistici',
    },
    '493zs6tf': {
      'en': 'Holistic Products',
      'es': 'Productos Holísticos',
      'it': 'Prodotti olistici',
    },
    '6s7j3gsa': {
      'en': 'Spiritual Services',
      'es': 'Servicios Espirituales',
      'it': 'Servizi spirituali',
    },
    '3nwh8paw': {
      'en': 'Spiritual Products',
      'es': 'Productos Espirituales',
      'it': 'Prodotti spirituali',
    },
    'wykqqshn': {
      'en': 'Esoteric Services',
      'es': 'Servicios Esotéricos',
      'it': 'Servizi Esoterici',
    },
    '8a1kqn4p': {
      'en': 'Esoteric Products',
      'es': 'Productos esotéricos',
      'it': 'Prodotti esoterici',
    },
    'pyxwt0p2': {
      'en': 'Ads',
      'es': 'Anuncios',
      'it': 'Annunci',
    },
    'fxz80feg': {
      'en': 'Discover our products',
      'es': 'Descubra nuestros productos',
      'it': 'Scopri i nostri prodotti',
    },
    'jj5jcqdu': {
      'en': '\$',
      'es': '€',
      'it': '€',
    },
    'xpi2u2q8': {
      'en': 'Home',
      'es': 'Home',
      'it': 'Home',
    },
  },
  // cartScreen
  {
    'khzw3lov': {
      'en': 'Your favorites',
      'es': 'Tus favoritos',
      'it': 'I tuoi preferiti',
    },
    'oydn3cbv': {
      'en': 'Search',
      'es': 'Buscar',
      'it': 'Ricerca',
    },
    '7ppdifso': {
      'en': 'No favorites for now.\nAdd some!',
      'es': 'No hay favoritos por ahora.\n¡Agrega un poco!',
      'it': 'Nessun preferito per ora.\nAggiungi un po!',
    },
    'ftfgq0me': {
      'en': 'Favorites',
      'es': 'Favoritos',
      'it': 'Preferiti',
    },
  },
  // profileScreen
  {
    'nbadsi9j': {
      'en': 'Profile Settings',
      'es': 'Configuración de perfil',
      'it': 'Impostazioni del profilo',
    },
    '1etqpxwy': {
      'en': 'Go to vendor profile ',
      'es': 'Ir al perfil del proveedor',
      'it': 'Vai al profilo del venditore',
    },
    'of8fb94y': {
      'en': 'About',
      'es': 'Acerca de',
      'it': 'Informazioni',
    },
    '566vnj63': {
      'en': 'Go back',
      'es': 'Regresa',
      'it': 'Torna indietro',
    },
    'dwxv7sp8': {
      'en': 'Delete user',
      'es': 'Borrar usuario',
      'it': 'Elimina utente',
    },
    'hcjjqv8z': {
      'en': 'Profile',
      'es': 'Perfil',
      'it': 'Profilo',
    },
  },
  // bizHome
  {
    'ek5erltl': {
      'en': 'Your vendor profile',
      'es': 'Tu perfil de proveedor',
      'it': 'Il tuo profilo venditore',
    },
    'paxv7chs': {
      'en': 'Your items',
      'es': 'Tus cosas',
      'it': 'I tuoi articoli',
    },
    'btwjrs75': {
      'en': 'Activity in the last 30 days',
      'es': 'Actividad en los últimos 30 días',
      'it': 'Attività negli ultimi 30 giorni',
    },
    'nyuysbvz': {
      'en': 'Your items',
      'es': 'Tus cosas',
      'it': 'I tuoi articoli',
    },
    'l3tujeg8': {
      'en': 'Delete',
      'es': 'Borrar',
      'it': 'Elimina',
    },
    '3kc61w8d': {
      'en': 'Add Product',
      'es': 'Agregar producto',
      'it': 'Aggiungi prodotto',
    },
    'hncl5ux5': {
      'en': 'How do i delete a product?',
      'es': '¿Cómo elimino un producto?',
      'it': 'Come faccio a eliminare un prodotto?',
    },
    'xum1hwx6': {
      'en': 'Edit vendor info',
      'es': 'Editar información del proveedor',
      'it': 'Modifica le informazioni del venditore',
    },
    '6omwhhho': {
      'en': 'Home',
      'es': 'Home',
      'it': 'Home',
    },
    'nxtlo4mr': {
      'en': 'Business Profile',
      'es': 'Perfil de trabajo',
      'it': 'Profilo Venditore',
    },
    'jjdx3dsb': {
      'en': '__',
      'es': '__',
      'it': '__',
    },
  },
  // addProduct
  {
    'zlyya53e': {
      'en': 'Add product',
      'es': 'Agregar producto',
      'it': 'Aggiungi prodotto',
    },
    'ie8hjo1z': {
      'en': 'Add image',
      'es': 'Añadir imagen',
      'it': 'Aggiungi immagine',
    },
    'b2n5ifiy': {
      'en': 'Product name',
      'es': 'Nombre del producto',
      'it': 'Nome del prodotto',
    },
    'oyj6nfox': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de sugerencia...]',
      'it': '[Digita il nome...]',
    },
    'rnq7taxt': {
      'en': 'Some more info',
      'es': 'Algo más de información',
      'it': 'Qualche informazione in più',
    },
    'jt70r1ui': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de sugerencia...]',
      'it': '[Aggiungi delle informazioni...]',
    },
    '62kqj0dc': {
      'en': 'Product description',
      'es': 'Descripción del Producto',
      'it': 'Descrizione del prodotto',
    },
    'qiu9kuxk': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de sugerencia...]',
      'it': '[Una descrizione...]',
    },
    'zid9muzt': {
      'en': 'Quantity',
      'es': 'Cantidad',
      'it': 'Quantità',
    },
    'amctruzx': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de sugerencia...]',
      'it': '[Inserisci la quantità]',
    },
    '28s39vdc': {
      'en': 'Price(\$ per item)',
      'es': 'Precio (\$ por artículo)',
      'it': 'Prezzo (\$ per articolo)',
    },
    'q339iums': {
      'en': '[Price in dollars..]',
      'es': '[Precio en dólares..]',
      'it': '[Prezzo in dollari..]',
    },
    'iol3mijb': {
      'en': 'Holistic Services',
      'es': 'Servicios Holísticos',
      'it': 'Servizi olistici',
    },
    '5sd66tt1': {
      'en': 'Holistic Products',
      'es': 'Productos Holísticos',
      'it': 'Prodotti olistici',
    },
    'hg9kgzl8': {
      'en': 'Spiritual Services',
      'es': 'Servicios espirituales',
      'it': 'Servizi Spirituali',
    },
    '2a5ynfhs': {
      'en': 'Spiritual Products',
      'es': 'Productos espirituales',
      'it': 'Prodotti Spirituali',
    },
    'f2kv5yvr': {
      'en': 'Esoteric Services',
      'es': 'Servicios Esotéricos',
      'it': 'Servizi Esoterici',
    },
    'q2bpkelr': {
      'en': 'Esoteric Products',
      'es': 'Productos Esotéricos',
      'it': 'Prodotti Esoterici',
    },
    'yfgcuyds': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'it': 'Seleziona...',
    },
    'op48c54p': {
      'en': 'Search a product...',
      'es': 'Buscar un producto...',
      'it': 'Cerca un prodotto...',
    },
    'ylqpoo1t': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'o9fnivj0': {
      'en': 'Choose an option',
      'es': 'Elige una opcion',
      'it': 'Scegliere un\'opzione',
    },
    'vf7z1cze': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'tneiitzt': {
      'en': 'Choose an option',
      'es': 'Seleccione una opción de la lista',
      'it': 'Scegli un\'opzione dalla lista',
    },
    'wymqp6d4': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'qyc68lbk': {
      'en': 'Choose an option',
      'es': 'Seleccione una opción de la lista',
      'it': 'Scegli un\'opzione dalla lista',
    },
    'hzfma3wx': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'rkioqft3': {
      'en': 'Choose an option',
      'es': 'Seleccione una opción de la lista',
      'it': 'Scegli un\'opzione dalla lista',
    },
    'ayirqekt': {
      'en': 'Campo è richiesto',
      'es': 'Campo è richiesto',
      'it': 'Campo è richiesto',
    },
    'k93n3xfa': {
      'en': 'Choose an option',
      'es': 'Seleccione una opción de la lista',
      'it': 'Scegli un\'opzione dalla lista',
    },
    '8x0zsklw': {
      'en': 'Add',
      'es': 'Añadir',
      'it': 'Aggiungi',
    },
  },
  // productAdded
  {
    '516kmoq1': {
      'en': 'Product added!',
      'es': '¡Producto añadido!',
      'it': 'Prodotto aggiunto!',
    },
    '50aj9nsw': {
      'en': 'Add another',
      'es': 'Agrega otro',
      'it': 'Aggiungi un altro',
    },
  },
  // AllChatsPage
  {
    'irnwjxh8': {
      'en': 'All chats',
      'es': 'Todos los chats',
      'it': 'Tutte le chat',
    },
  },
  // itemDescr
  {
    '9krkg07z': {
      'en': 'Info',
      'es': 'Info',
      'it': 'Info',
    },
    'ilx4hn3z': {
      'en': 'Vendor Bio',
      'es': 'Biografía del proveedor',
      'it': 'Biografia del venditore',
    },
    '7f2k0j6g': {
      'en': 'Starting from',
      'es': 'Empezando desde',
      'it': 'A partire da',
    },
    'vg5pukhu': {
      'en': '\$',
      'es': '€',
      'it': '€',
    },
    'ytbo6siq': {
      'en': 'Contact vendor',
      'es': 'Contactar al proveedor',
      'it': 'Contatta il venditore',
    },
    '7o9tv38a': {
      'en': 'Home',
      'es': 'Home',
      'it': 'Home',
    },
  },
  // EditVendor
  {
    '12kfu0o7': {
      'en': 'Change store name',
      'es': 'Cambiar nombre de tienda',
      'it': 'Cambia nome negozio',
    },
    '1zam9bag': {
      'en': 'Choose a store name',
      'es': 'Elige un nombre de tienda',
      'it': 'Scegli il nome del negozio',
    },
    '4w0opjs0': {
      'en': 'Edit profile bio',
      'es': 'Editar biografía del perfil',
      'it': 'Modifica la biografia del profilo',
    },
    'yj02tm29': {
      'en': 'Write something about you',
      'es': 'Escribe algo sobre ti',
      'it': 'Scrivi qualcosa su di te',
    },
    'jd64szvq': {
      'en': 'Upload valid proof of id',
      'es': 'Cargar prueba de identificación ',
      'it': 'Carica un documento d\'identità',
    },
    'rnlyuz0b': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'pg4en48s': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'c44i0719': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'au6eryv1': {
      'en': 'Your bio cannot exceed the maximum lenght',
      'es': 'Tu biografía no puede exceder la longitud máxima.',
      'it': 'La tua biografia non può superare la lunghezza massima',
    },
    'c4pqtz7j': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'mfh1bevw': {
      'en': 'Go back',
      'es': 'Regresa',
      'it': 'Torna indietro',
    },
    'ui1foedn': {
      'en': 'Update info',
      'es': 'Actualizar información',
      'it': 'Aggiorna le informazioni',
    },
    'slfdv306': {
      'en': 'Change store name',
      'es': 'Cambiar nombre de tienda',
      'it': 'Cambia nome negozio',
    },
    '1bp184rn': {
      'en': 'Choose store name',
      'es': 'Elige el nombre de la tienda',
      'it': 'Scegli il nome del negozio',
    },
    'poz86sy1': {
      'en': 'Edit profile bio',
      'es': 'Editar biografía del perfil',
      'it': 'Modifica la biografia del profilo',
    },
    'e5w33sln': {
      'en': 'Write something about you',
      'es': 'escribe algo sobre ti',
      'it': 'Scrivi qualcosa su di te',
    },
    'yau59afm': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'in3pg93e': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'th29cn1r': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'it': 'Il campo è obbligatiorio',
    },
    'k5b0fiop': {
      'en': 'Your bio cannot exceed the maximum lenght',
      'es': 'Tu biografía no puede exceder la longitud máxima.',
      'it': 'La tua biografia non può superare la lunghezza massima',
    },
    '8fu982ec': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'n8gcta8g': {
      'en': 'Go back',
      'es': 'Regresa',
      'it': 'Torna indietro',
    },
    'f1x7uqq0': {
      'en': 'Update info',
      'es': 'Actualizar información',
      'it': 'Aggiornare le informazioni',
    },
    'ex2ln6ud': {
      'en': 'Wait to be verified as a vendor',
      'es': 'Espere a ser verificado como proveedor',
      'it': 'Attendi di essere verificato come venditore',
    },
    'a826oleo': {
      'en': 'Go back',
      'es': 'Regresa',
      'it': 'Torna indietro',
    },
  },
  // aboutAppBottomSheet
  {
    '3mkh0ryj': {
      'en': 'About us',
      'es': 'Sobre nosotros',
      'it': 'Chi siamo',
    },
    'xe5irmjk': {
      'en': 'MysticBlend is  made by request of Eros M.',
      'es': 'MysticBlend™ se fabrica a pedido de Eros M.',
      'it': 'MysticBlend™ è realizzato su richiesta di Eros M.',
    },
    'htsp0y9c': {
      'en': 'For inquries, reach \ncorpoespiritoshop@gmail.com ',
      'es': 'Para consultas comunicarse\ncorpoespiritoshop@gmail.com',
      'it': 'Per domande consultare\ncorpospiritoshop@gmail.com',
    },
    'xc8ryxlb': {
      'en': 'For inquries, reach \ncorpoespiritoshop@gmail.com ',
      'es': 'Aplicación hecha por matteosantin896 en FIverr',
      'it': 'App realizzata da matteosantin896 su FIverr',
    },
  },
  // Eula
  {
    'lm5uztn8': {
      'en': 'End User agreement',
      'es': 'Acuerdo de usuario final',
      'it': 'Contratto per l\'utente finale',
    },
    'lazs61ih': {
      'en': 'Main Paragraph',
      'es': 'Párrafo principal',
      'it': 'Paragrafo principale',
    },
    'uft5apnk': {
      'en':
          'USER END AGREEMENT\n\nLast Updated: September 2, 2023\n\nIMPORTANT NOTICE: PLEASE READ THIS END USER LICENSE AGREEMENT (\"AGREEMENT\") CAREFULLY BEFORE DOWNLOADING, INSTALLING, OR USING THIS APPLICATION. BY DOWNLOADING, INSTALLING, OR USING THIS APPLICATION, YOU AGREE TO BE BOUND BY THE TERMS AND CONDITIONS OF THIS AGREEMENT. IF YOU DO NOT AGREE TO THESE TERMS AND CONDITIONS, DO NOT DOWNLOAD, INSTALL, OR USE THIS APPLICATION.\n\nThis End User License Agreement (\"Agreement\") is a legally binding agreement between you (\"User\" or \"You\") and MysticBlend (\"Company,\" \"We,\" \"Us,\" or \"Our\") for the use of the MysticBlend mobile application for IOS and Android provided by the Company. This Agreement governs the use of the Application, which includes, but is not limited to, access to the Firebase database and the display of advertising.\n\n1. ACCEPTANCE OF TERMS\n\nBy downloading, installing, or using MysticBlend, you acknowledge and agree to abide by the terms and conditions set forth in this Agreement, including any updates or modifications that may be made to the Application by us. If you do not agree with any part of this Agreement, you must not use the Application.\n\n2. PRIVACY AND DATA COLLECTION\n\nThe Application may collect and store personal information as described in our Privacy Policy. By using the Application, you consent to the collection and use of your data as described in the Privacy Policy.\n\nInformation pursuant to EU Regulation 2016/679 (\"GDPR\")\n\nWHAT TYPES OF DATA DO WE COLLECT?\n\nWhen you use our services, you agree that our company collects certain of your personal data. This page is intended to inform you of the data we collect, why we collect it, and how we use it.\n\nWe process two types of data:\n\nDATA PROVIDED BY THE USER\n\nIf you are an individual\n\nIf you are an individual, when you register, submit, or respond to an ad, we ask you to provide us with certain data that is necessary for you to use our service.\n\nThese may include, for example, the following data we ask for:\n\naddress, email, and password, and mobile phone number\nother data related to the subject of your ad (for example, if you post an ad to sell your car, we ask for the brand, model, year of registration, and other relevant information)\nYou can also choose to provide us with the following information:\n\nname\ndate of birth\ngender\ncity or reference municipality\nidentity document, for the purpose of identification for certain categories of ads\nYour phone number is necessary for the completion of a specific identification procedure required to access the Service.\n\nYou can change your phone number in the settings of your reserved area; this number will be hidden and will not appear in ads published in certain categories unless you decide to make it visible.\n\nFurthermore, the phone number may be requested in the contact form of a professional user\'s ad, and this number may be used to send SMS if you choose to use the \"See Now\" service.\n\nTo facilitate registration and access to the service, you can also authenticate yourself through your Google Account login, giving Google the opportunity to become aware of your visit to our site. In this case, you will authorize Google to share with us data such as your name, surname, and email address.\n\nWhen you call a professional user, we may process your phone number in pseudonymized form for reporting and service improvement purposes.\n\nIn order to connect more with other users, the service allows you to show yourself online with a green dot next to your profile and ad details. You can decide at any time to opt-out by selecting the offline mode. As soon as you go offline, the time elapsed since your last connection and/or online viewing will be shown as indicative.\n\nWithin the use of the service, you can use the \"Messages\" and \"Chat\" functions to communicate with other users or with our Customer Happiness Center. For more information, please read the \"Messages and Chat\" section.\n\nThird-party data\n\nIf you provide personal data of third parties, such as those of your family members or friends, you must ensure that these individuals have been adequately informed and have consented to the relevant processing as described in this notice.\n\nData of minors under 16 years of age\n\nIf you are under 16 years of age, you cannot provide us with any personal data or register on MysticBlend, and in any case, we do not assume responsibility for any false statements you may provide. If we become aware of untrue statements, we will proceed with the immediate deletion of all personal data acquired.\n\nIf you are a professional\n\nIf you are a professional, when you create a professional account, we ask you to provide us with certain data:\n\ncompany name, VAT number, contact name, email address, and phone number\nother data: professional category and complete address\nWe may also collect and process publicly available data accessible electronically or in paper directories to promote services dedicated to your professional activity.\n\nIn this case, in contact phase, you will be given references to this notice, and you may object at any time to the processing of data as indicated in the following point 4.\n\nDATA WE AUTOMATICALLY COLLECT\n\nWe collect the following data through the services you use:\n\ntechnical data: such as IP address, browser type, information about your computer, data related to the current (approximate) location of the device you are using;\ndata collected using cookies or similar technologies: for more information, please visit the \"Cookies\" section.\n\n1. How do we use the data we collect?\n\nWe use the data collected to offer you our service every day, to inform you about our business activities, or to offer you a more personalized service in line with your interests.\n\n1.1. To ensure your access to our services and improve their delivery\n\nWe use your data to ensure your access to our services and their delivery, including:\n\nregistration and creation of the reserved area.\npublication of ads\nuse of the \"favorites\" and \"saved searches\" features\ncommunications related to the provision of the service\nmessaging between users (Messages)\nThese processes are necessary to properly provide Subito services to the users who adhere to them.\n\nWe also use your data to ensure better service and implement it through the following processes:\n\nassistance through the Customer Happiness Center, including via the Chat function\ndata analysis in aggregate form\nreview of ads, moderation or removal of content, fraud prevention\nadministrative, financial, or accounting activities, such as those related to the purchase of optional paid services and any credit recovery\ndetection of your current (approximate) location to facilitate the use of some service features, such as the display of ads from users near you\ncommunications related to services similar to those you use\nmarket research, optional surveys, and user satisfaction surveys\nThese processes are based on the legitimate interest of the Data Controller in improving the service and its implementation, and you may object, in cases provided for by law, at any time.\n\n1.2. To inform you about our business activities\n\nWe use the data collected, if you have expressly consented, to inform you about promotional activities that may interest you.\n\nIn particular, we use them to:\n\ncommunicate promotional, commercial, and advertising activities on events, initiatives, or partnerships of MysticBlend, via email, SMS, or push notifications; only if you are a professional, by phone through an operator, a customer care service consisting of offering dedicated services in sales and after-sales\nconduct analysis and reporting activities related to promotional communication systems\n\n, such as the detection of the number of emails opened, clicks on links within the communication, the type of device used to read the communication, and the related operating system or the list of unsubscribe from the newsletter.\n\n1.3. To offer you a personalized service\n\nWe process the data collected, if you have expressly consented, to analyze your consumption habits or choices in order to offer you a more personalized service in line with your interests and to improve our commercial offering. Such analyzes are in no case related to an automated decision-making process.\n\n2. Is the provision of data mandatory?\n\nThe provision of personal data is mandatory only for processing necessary for the provision of services offered by MysticBlend (any refusal for the purpose of providing the service makes it impossible to use the service itself); it is optional for promotional and profiling purposes, and any refusal to give consent has no negative consequences on the provision of the service offered within the app and its related website.\n\n3. USE OF THE FIREBASE DATABASE\n\nThe Application may use Firebase, a database service provided by Google, to store and retrieve data. The terms of service and privacy policy of Firebase apply to the use of Firebase services. You are responsible for complying with the terms and privacy policy of Firebase.\n\n4. ADVERTISING\n\nThe Application may display advertisements (\"Ads\") provided by third-party advertising networks. These ads may collect information about your device and may be personalized based on your interests as determined by your use of the Application and other websites and applications. Our Privacy Policy describes how your data is used in relation to advertisements.\n\n5. INTELLECTUAL PROPERTY\n\nThe Application, including all content, graphics, and other materials, is protected by copyright and other intellectual property laws. You are not allowed to modify, reproduce, distribute, create derivative works, or decode the Application.\n\n6. DISCLAIMER\n\nTHE APPLICATION IS PROVIDED \"AS IS\" AND \"AS AVAILABLE\" WITHOUT ANY WARRANTIES, EXPRESS OR IMPLIED. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, INCLUDING BUT NOT LIMITED TO IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.\n\n7. LIMITATION OF LIABILITY\n\nTO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, WE SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR FOR ANY LOSS OF PROFITS OR REVENUES, WHETHER INCURRED DIRECTLY OR INDIRECTLY, OR FOR ANY LOSS OF DATA, USE, GOODWILL, OR OTHER INTANGIBLE LOSSES, ARISING OUT OF YOUR USE OF THE APPLICATION.\n\n8. TERMINATION\n\nWe reserve the right to terminate or suspend access to the Application at any time and for any reason, without notice. In the event of termination, the user must cease all use of the Application.\n\n9. APPLICABLE LAW\n\nThis Agreement shall be governed and construed in accordance with the laws of [Your jurisdiction], regardless of the principles of conflict of laws.\n\n10. CONTACT INFORMATION\n\nFor questions or concerns about this Agreement or the Application, you can contact us at corpoespiritoshop@gmail.com.\n\nBy downloading, installing, or using the Application, the user acknowledges having read and understood this Agreement and agrees to be bound by its terms and conditions. If you do not agree with any part of this Agreement, do not download, install, or use the Application.\n\nMysticBlend corpoespiritoshop@gmail.com\n\nPlease keep a copy of this Agreement for your records.',
      'es':
          'ACUERDO FINAL DEL USUARIO\n\nÚltima actualización: 2 de septiembre de 2023\n\nAVISO IMPORTANTE: LEA DETENIDAMENTE ESTE CONTRATO DE LICENCIA DE USUARIO FINAL (\"ACUERDO\") ANTES DE DESCARGAR, INSTALAR O UTILIZAR ESTA APLICACIÓN. AL DESCARGAR, INSTALAR O UTILIZAR ESTA APLICACIÓN, USTED ACEPTA ESTAR OBLIGADO POR LOS TÉRMINOS Y CONDICIONES DE ESTE ACUERDO. SI NO ACEPTA ESTOS TÉRMINOS Y CONDICIONES, NO DESCARGUE, INSTALE NI UTILICE ESTA APLICACIÓN.\n\nEste Acuerdo de licencia de usuario final (\"Acuerdo\") es un acuerdo legalmente vinculante entre usted (\"Usuario\" o \"Usted\") y MysticBlend (\"Compañía\", \"Nosotros\", \"Nos\" o \"Nuestro\") para el uso de la aplicación móvil MysticBlend para IOS y Android proporcionada por la Compañía. Este Acuerdo rige el uso de la Aplicación, que incluye, entre otros, el acceso a la base de datos de Firebase y la visualización de publicidad.\n\n1. ACEPTACIÓN DE TÉRMINOS\n\nAl descargar, instalar o utilizar MysticBlend, usted reconoce y acepta cumplir con los términos y condiciones establecidos en este Acuerdo, incluidas cualquier actualización o modificación que podamos realizar en la Aplicación. Si no está de acuerdo con alguna parte de este Acuerdo, no debe utilizar la Aplicación.\n\n2. PRIVACIDAD Y RECOPILACIÓN DE DATOS\n\nLa Aplicación puede recopilar y almacenar información personal como se describe en nuestra Política de Privacidad. Al utilizar la Aplicación, usted acepta la recopilación y el uso de sus datos como se describe en la Política de Privacidad.\n\nInformación conforme al Reglamento UE 2016/679 (\"GDPR\")\n\n¿QUÉ TIPOS DE DATOS RECOGEMOS?\n\nCuando utiliza nuestros servicios, acepta que nuestra empresa recopile algunos de sus datos personales. Esta página tiene como objetivo informarle sobre los datos que recopilamos, por qué los recopilamos y cómo los utilizamos.\n\nTratamos dos tipos de datos:\n\nDATOS SUMINISTRADOS POR EL USUARIO\n\nSi eres un individuo\n\nSi es un individuo, cuando se registra, envía o responde a un anuncio, le pedimos que nos proporcione ciertos datos que son necesarios para utilizar nuestro servicio.\n\nEstos pueden incluir, por ejemplo, los siguientes datos que solicitamos:\n\ndirección, correo electrónico, contraseña y número de teléfono móvil\notros datos relacionados con el tema de su anuncio (por ejemplo, si publica un anuncio para vender su automóvil, le solicitamos la marca, modelo, año de registro y otra información relevante)\nTambién puede optar por proporcionarnos la siguiente información:\n\nnombre\nfecha de nacimiento\ngénero\nciudad o municipio de referencia\ndocumento de identidad, con fines de identificación para determinadas categorías de anuncios\nSu número de teléfono es necesario para completar un procedimiento de identificación específico requerido para acceder al Servicio.\n\nPuedes cambiar tu número de teléfono en la configuración de tu área reservada; este número estará oculto y no aparecerá en los anuncios publicados en determinadas categorías a menos que decidas hacerlo visible.\n\nAdemás, el número de teléfono podrá solicitarse en el formulario de contacto de un anuncio de usuario profesional, y este número podrá utilizarse para enviar SMS si opta por utilizar el servicio \"Ver Ahora\".\n\nPara facilitar el registro y el acceso al servicio, también puede autenticarse a través de su cuenta de Google, dándole a Google la oportunidad de tomar conocimiento de su visita a nuestro sitio. En este caso, autorizarás a Google a compartir con nosotros datos como tu nombre, apellidos y dirección de correo electrónico.\n\nCuando llama a un usuario profesional, podemos procesar su número de teléfono de forma seudonimizada con fines de generación de informes y mejora del servicio.\n\nPara conectarse más con otros usuarios, el servicio le permite mostrarse en línea con un punto verde al lado de su perfil y los detalles del anuncio. Puede decidir en cualquier momento darse de baja seleccionando el modo fuera de línea. En el momento en que te desconectes, se mostrará de forma orientativa el tiempo transcurrido desde tu última conexión y/o visualización online.\n\nDentro del uso del servicio, puede utilizar las funciones \"Mensajes\" y \"Chat\" para comunicarse con otros usuarios o con nuestro Centro de Felicidad del Cliente. Para obtener más información, lea la sección \"Mensajes y chat\".\n\nDatos de terceros\n\nSi proporciona datos personales de terceros, como los de sus familiares o amigos, debe asegurarse de que estas personas hayan sido informadas adecuadamente y hayan dado su consentimiento para el procesamiento relevante como se describe en este aviso.\n\nDatos de menores de 16 años\n\nSi eres menor de 16 años no podrás facilitarnos ningún dato personal ni registrarte en MysticBlend, y en cualquier caso, no asumimos responsabilidad por las manifestaciones falsas que puedas realizar. Si tenemos conocimiento de declaraciones falsas, procederemos a la eliminación inmediata de todos los datos personales adquiridos.\n\nSi eres un profesional\n\nSi eres un profesional, al crear una cuenta profesional, te pedimos que nos facilites ciertos datos:\n\nnombre de la empresa, número de IVA, nombre de contacto, dirección de correo electrónico y número de teléfono\notros datos: categoría profesional y dirección completa\nTambién podemos recopilar y procesar datos disponibles públicamente, accesibles electrónicamente o en directorios impresos, para promover servicios dedicados a su actividad profesional.\n\nEn este caso, en la fase de contacto, se le harán referencias a este aviso, pudiendo oponerse en cualquier momento al tratamiento de sus datos tal y como se indica en el siguiente punto 4.\n\nDATOS QUE RECOPILAMOS AUTOMÁTICAMENTE\n\nRecopilamos los siguientes datos a través de los servicios que utiliza:\n\ndatos técnicos: como dirección IP, tipo de navegador, información sobre su computadora, datos relacionados con la ubicación actual (aproximada) del dispositivo que está utilizando;\nDatos recogidos mediante cookies o tecnologías similares: para obtener más información, visite la sección \"Cookies\".\n\n1. ¿Cómo utilizamos los datos que recopilamos?\n\nUtilizamos los datos recopilados para ofrecerle nuestro servicio cada día, informarle sobre nuestras actividades comerciales o ofrecerle un servicio más personalizado y acorde a sus intereses.\n\n1.1. Para garantizar su acceso a nuestros servicios y mejorar su prestación.\n\nUtilizamos sus datos para garantizar su acceso a nuestros servicios y su prestación, incluyendo:\n\nregistro y creación del área reservada.\npublicación de anuncios\nuso de las funciones \"favoritos\" y \"búsquedas guardadas\"\ncomunicaciones relacionadas con la prestación del servicio\nmensajería entre usuarios (Mensajes)\nEstos procesos son necesarios para prestar adecuadamente los servicios de Subito a los usuarios que se adhieren a los mismos.\n\nTambién utilizamos sus datos para garantizar un mejor servicio e implementarlo a través de los siguientes procesos:\n\nasistencia a través del Centro de Felicidad del Cliente, incluso a través de la función de Chat\nanálisis de datos en forma agregada\nrevisión de anuncios, moderación o eliminación de contenidos, prevención de fraude\nactividades administrativas, financieras o contables, como las relacionadas con la compra de servicios de pago opcionales y cualquier recuperación de crédito\ndetección de su ubicación actual (aproximada) para facilitar el uso de algunas funciones del servicio, como la visualización de anuncios de usuarios cercanos a usted\nComunicaciones relacionadas con servicios similares a los que usted utiliza.\nEstudios de mercado, encuestas opcionales y encuestas de satisfacción del usuario.\nEstos procesos se basan en el interés legítimo del Responsable del Tratamiento en la mejora del servicio y su implementación, pudiendo oponerse, en los casos previstos por la ley, en cualquier momento.\n\n1.2. Para informarle sobre nuestras actividades comerciales.\n\nUtilizamos los datos recopilados, si usted ha dado su consentimiento expreso, para informarle sobre actividades promocionales que puedan interesarle.\n\nEn particular, los utilizamos para:\n\ncomunicar actividades promocionales, comerciales y publicitarias sobre eventos, iniciativas o asociaciones de MysticBlend, por correo electrónico, SMS o notificaciones automáticas; Sólo si eres un profesional, por teléfono a través de un operador, un servicio de atención al cliente consistente en ofrecer servicios dedicados en venta y posventa.\nRealizar actividades de análisis y presentación de informes relacionados con los sistemas de comunicación promocional.\n\n, como la detección del número de correos electrónicos abiertos, clics en enlaces dentro de la comunicación, el tipo de dispositivo utilizado para leer la comunicación y el sistema operativo relacionado o la lista de bajas de la newsletter.\n\n1.3. Para ofrecerle un servicio personalizado\n\nTratamos los datos recabados, si usted ha dado su consentimiento expreso, para analizar sus hábitos o elecciones de consumo con el fin de ofrecerle un servicio más personalizado y acorde a sus intereses y mejorar nuestra oferta comercial. Dichos análisis no están en ningún caso relacionados con un proceso automatizado de toma de decisiones.\n\n2. ¿Es obligatorio el suministro de datos?\n\nEl suministro de datos personales es obligatorio únicamente para el procesamiento necesario para la prestación de los servicios ofrecidos por MysticBlend (cualquier negativa con el fin de proporcionar el servicio imposibilita el uso del servicio en sí); es opcional con fines promocionales y de elaboración de perfiles, y cualquier negativa a dar el consentimiento no tiene consecuencias negativas para la prestación del servicio ofrecido dentro de la aplicación y su sitio web relacionado.\n\n3. USO DE LA BASE DE DATOS FIREBASE\n\nLa Aplicación puede utilizar Firebase, un servicio de base de datos proporcionado por Google, para almacenar y recuperar datos. Los términos de servicio y la política de privacidad de Firebase se aplican al uso de los servicios de Firebase. Usted es responsable de cumplir con los términos y la política de privacidad de Firebase.\n\n4. PUBLICIDAD\n\nLa Aplicación puede mostrar anuncios (\"Anuncios\") proporcionados por redes publicitarias de terceros. Estos anuncios pueden recopilar información sobre su dispositivo y pueden personalizarse según sus intereses según lo determine su uso de la Aplicación y otros sitios web y aplicaciones. Nuestra Política de Privacidad describe cómo se utilizan sus datos en relación con los anuncios.\n\n5. PROPIEDAD INTELECTUAL\n\nLa Aplicación, incluido todo el contenido, gráficos y otros materiales, está protegida por derechos de autor y otras leyes de propiedad intelectual. No se le permite modificar, reproducir, distribuir, crear trabajos derivados ni decodificar la Aplicación.\n\n6. DESCARGO DE RESPONSABILIDAD\n\nLA APLICACIÓN SE PROPORCIONA \"TAL CUAL\" Y \"SEGÚN DISPONIBILIDAD\" SIN NINGUNA GARANTÍA, EXPRESA O IMPLÍCITA. EN LA MEDIDA MÁXIMA PERMITIDA POR LA LEY APLICABLE, RENUNCIAMOS A TODAS LAS GARANTÍAS, INCLUYENDO, ENTRE OTRAS, LAS GARANTÍAS IMPLÍCITAS DE COMERCIABILIDAD, IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN.\n\n7. LIMITACIÓN DE RESPONSABILIDAD\n\nEN LA MEDIDA MÁXIMA PERMITIDA POR LA LEY APLICABLE, NO SEREMOS RESPONSABLES POR NINGÚN DAÑO INDIRECTO, INCIDENTAL, ESPECIAL, CONSECUENTE O PUNITIVO, NI POR CUALQUIER PÉRDIDA DE GANANCIAS O INGRESOS, YA SEA INCURRIDO DIRECTA O INDIRECTAMENTE, O POR CUALQUIER PÉRDIDA DE DATOS, USO, BUENA VOLUNTAD U OTRAS PÉRDIDAS INTANGIBLES QUE SURJAN DE SU USO DE LA APLICACIÓN.\n\n8. TERMINACIÓN\n\nNos reservamos el derecho de cancelar o suspender el acceso a la Aplicación en cualquier momento y por cualquier motivo, sin previo aviso. En caso de rescisión, el usuario deberá dejar de utilizar la Aplicación.\n\n9. LEY APLICABLE\n\nEste Acuerdo se regirá e interpretará de acuerdo con las leyes de [Su jurisdicción], independientemente de los principios de conflicto de leyes.\n\n10. INFORMACIÓN DE CONTACTO\n\nSi tiene preguntas o inquietudes sobre este Acuerdo o la Aplicación, puede contactarnos en corpoespiritoshop@gmail.com.\n\nAl descargar, instalar o utilizar la Aplicación, el usuario reconoce haber leído y comprendido este Acuerdo y acepta regirse por sus términos y condiciones. Si no está de acuerdo con alguna parte de este Acuerdo, no descargue, instale ni utilice la Aplicación.\n\nMysticBlend corpoespiritoshop@gmail.com\n\nGuarde una copia de este Acuerdo para sus registros.',
      'it':
          'CONTRATTO FINALE CON L\'UTENTE\n\nUltimo aggiornamento: 2 settembre 2023\n\nAVVISO IMPORTANTE: LEGGERE ATTENTAMENTE IL PRESENTE CONTRATTO DI LICENZA CON L\'UTENTE FINALE (\"CONTRATTO\") PRIMA DI SCARICARE, INSTALLARE O UTILIZZARE QUESTA APPLICAZIONE. SCARICANDO, INSTALLANDO O UTILIZZANDO QUESTA APPLICAZIONE, ACCETTI DI ESSERE VINCOLATO AI TERMINI E CONDIZIONI DEL PRESENTE CONTRATTO. SE NON ACCETTI QUESTI TERMINI E CONDIZIONI, NON SCARICARE, INSTALLARE O UTILIZZARE QUESTA APPLICAZIONE.\n\nIl presente Contratto di licenza con l\'utente finale (\"Contratto\") è un accordo legalmente vincolante tra te (\"Utente\" o \"Tu\") e MysticBlend (\"Società\", \"Noi\", \"Noi\" o \"Nostro\") per l\'uso di l\'applicazione mobile MysticBlend per IOS e Android fornita dalla Società. Il presente Contratto regola l\'utilizzo dell\'Applicazione, che include, a titolo esemplificativo, l\'accesso al database Firebase e la visualizzazione di pubblicità.\n\n1. ACCETTAZIONE DEI TERMINI\n\nScaricando, installando o utilizzando MysticBlend, riconosci e accetti di rispettare i termini e le condizioni stabiliti nel presente Accordo, inclusi eventuali aggiornamenti o modifiche che potrebbero essere apportati all\'Applicazione da noi. Se non sei d\'accordo con qualsiasi parte del presente Contratto, non devi utilizzare l\'Applicazione.\n\n2. PRIVACY E RACCOLTA DATI\n\nL\'Applicazione può raccogliere e archiviare informazioni personali come descritto nella nostra Informativa sulla privacy. Utilizzando l\'Applicazione, acconsenti alla raccolta e all\'utilizzo dei tuoi dati come descritto nella Privacy Policy.\n\nInformativa ai sensi del Regolamento UE 2016/679 (“GDPR”)\n\nCHE TIPI DI DATI RACCOGLIAMO?\n\nQuando utilizzi i nostri servizi, accetti che la nostra azienda raccolga alcuni dei tuoi dati personali. Questa pagina ha lo scopo di informarti sui dati che raccogliamo, sul motivo per cui li raccogliamo e su come li utilizziamo.\n\nTrattiamo due tipologie di dati:\n\nDATI FORNITI DALL\'UTENTE\n\nSe sei un individuo\n\nSe sei un privato, quando ti registri, invii o rispondi a un annuncio, ti chiediamo di fornirci alcuni dati necessari per poter utilizzare il nostro servizio.\n\nQuesti possono includere, ad esempio, i seguenti dati che chiediamo:\n\nindirizzo, e-mail, password e numero di cellulare\naltri dati relativi all\'oggetto del tuo annuncio (ad esempio, se pubblichi un annuncio per vendere la tua auto, ti chiediamo marca, modello, anno di immatricolazione e altre informazioni rilevanti)\nPuoi anche scegliere di fornirci le seguenti informazioni:\n\nnome\ndata di nascita\ngenere\ncittà o comune di riferimento\ndocumento d\'identità, ai fini dell\'identificazione per alcune categorie di annunci\nIl tuo numero di telefono è necessario per il completamento di una specifica procedura di identificazione necessaria per accedere al Servizio.\n\nPuoi modificare il tuo numero di telefono nelle impostazioni della tua area riservata; questo numero verrà nascosto e non apparirà negli annunci pubblicati in determinate categorie a meno che tu non decida di renderlo visibile.\n\nInoltre il numero di telefono potrà essere richiesto nel form contatti dell\'annuncio di un utente professionale e tale numero potrà essere utilizzato per inviare SMS se si sceglie di utilizzare il servizio \"Vedi Ora\".\n\nPer facilitare la registrazione e l\'accesso al servizio, puoi autenticarti anche tramite il login del tuo account Google, dando la possibilità a Google di venire a conoscenza della tua visita al nostro sito. In questo caso autorizzerai Google a condividere con noi dati come il tuo nome, cognome e indirizzo email.\n\nQuando chiami un utente professionale, potremmo elaborare il tuo numero di telefono in forma pseudonimizzata per scopi di reporting e miglioramento del servizio.\n\nPer connetterti maggiormente con gli altri utenti, il servizio ti consente di mostrarti online con un punto verde accanto al tuo profilo e ai dettagli dell\'annuncio. Potrai decidere in ogni momento di rinunciare selezionando la modalità offline. Non appena sarai offline, verrà mostrato a titolo indicativo il tempo trascorso dall\'ultima connessione e/o visualizzazione online.\n\nNell\'ambito dell\'utilizzo del servizio, puoi utilizzare le funzioni \"Messaggi\" e \"Chat\" per comunicare con altri utenti o con il nostro Customer Happiness Center. Per maggiori informazioni vi invitiamo a leggere la sezione \"Messaggi e Chat\".\n\nDati di terze parti\n\nSe fornisci dati personali di terzi, come quelli di tuoi familiari o amici, devi assicurarti che tali soggetti siano stati adeguatamente informati e abbiano acconsentito al relativo trattamento come descritto nella presente informativa.\n\nDati dei minori di 16 anni\n\nSe hai meno di 16 anni non puoi fornirci alcun dato personale né registrarti su MysticBlend e, in ogni caso, non ci assumiamo la responsabilità per eventuali dichiarazioni mendaci da te fornite. Qualora venissimo a conoscenza di dichiarazioni non veritiere, procederemo alla cancellazione immediata di tutti i dati personali acquisiti.\n\nSe sei un professionista\n\nSe sei un professionista, quando crei un account professionale, ti chiediamo di fornirci alcuni dati:\n\nragione sociale, partita IVA, nome del contatto, indirizzo email e numero di telefono\naltri dati: categoria professionale e indirizzo completo\nPotremo inoltre raccogliere e trattare dati pubblicamente disponibili accessibili in formato elettronico o in elenchi cartacei per promuovere servizi dedicati alla tua attività professionale.\n\nIn tal caso, in fase di contatto, ti verranno forniti i riferimenti alla presente informativa, e potrai opporti in ogni momento al trattamento dei dati come indicato al successivo punto 4.\n\nDATI CHE RACCOGLIAMO AUTOMATICAMENTE\n\nRaccogliamo i seguenti dati attraverso i servizi che utilizzi:\n\ndati tecnici: come indirizzo IP, tipo di browser, informazioni sul tuo computer, dati relativi alla posizione attuale (approssimativa) del dispositivo che stai utilizzando;\ndati raccolti utilizzando cookie o tecnologie simili: per maggiori informazioni ti invitiamo a visitare la sezione “Cookie”.\n\n1. Come utilizziamo i dati che raccogliamo?\n\nUtilizziamo i dati raccolti per offrirti ogni giorno il nostro servizio, per informarti sulle nostre attività commerciali, o per offrirti un servizio più personalizzato e in linea con i tuoi interessi.\n\n1.1. Per garantire il tuo accesso ai nostri servizi e migliorarne l’erogazione\n\nUtilizziamo i tuoi dati per garantire il tuo accesso ai nostri servizi e la loro erogazione, tra cui:\n\nregistrazione e creazione dell\'area riservata.\npubblicazione degli annunci\nutilizzo delle funzionalità “preferiti” e “ricerche salvate”.\ncomunicazioni relative alla fornitura del servizio\nmessaggistica tra utenti (Messaggi)\nQuesti processi sono necessari per fornire correttamente i servizi Subito agli utenti che vi aderiscono.\n\nUtilizziamo i tuoi dati anche per garantire un servizio migliore e implementarlo attraverso i seguenti processi:\n\nassistenza attraverso il Customer Happiness Center, anche tramite la funzione Chat\nanalisi dei dati in forma aggregata\nrevisione degli annunci, moderazione o rimozione di contenuti, prevenzione delle frodi\nattività amministrative, finanziarie o contabili, come quelle relative all\'acquisto di servizi opzionali a pagamento e all\'eventuale recupero del credito\nrilevamento della tua posizione attuale (approssimativa) per facilitare l\'utilizzo di alcune funzionalità del servizio, come la visualizzazione di annunci di utenti vicino a te\ncomunicazioni relative a servizi simili a quelli da te utilizzati\nricerche di mercato, sondaggi facoltativi e sondaggi sulla soddisfazione degli utenti\nTali trattamenti si basano sul legittimo interesse del Titolare al miglioramento del servizio e della sua implementazione, al quale Lei potrà opporsi, nei casi previsti dalla legge, in ogni momento.\n\n1.2. Per informarvi sulle nostre attività commerciali\n\nUtilizziamo i dati raccolti, se hai espressamente acconsentito, per informarti su attività promozionali che potrebbero interessarti.\n\nIn particolare, li utilizziamo per:\n\ncomunicare attività promozionali, commerciali e pubblicitarie su eventi, iniziative o partnership di MysticBlend, tramite email, SMS o notifiche push; solo se sei un professionista, telefonicamente tramite operatore, un servizio di customer care consistente nell\'offrire servizi dedicati di vendita e post vendita\ncondurre attività di analisi e reporting relative ai sistemi di comunicazione promozionale\n\n, come ad esempio il rilevamento del numero di email aperte, dei click sui link presenti all\'interno della comunicazione, del tipo di dispositivo utilizzato per leggere la comunicazione e del relativo sistema operativo o l\'elenco dei cancellati dalla newsletter.\n\n1.3. Per offrirti un servizio personalizzato\n\nTrattiamo i dati raccolti, qualora tu abbia espressamente acconsentito, per analizzare le tue abitudini o scelte di consumo al fine di offrirti un servizio più personalizzato e in linea con i tuoi interessi e per migliorare la nostra offerta commerciale. Tali analisi non sono in nessun caso riconducibili ad un processo decisionale automatizzato.\n\n2. Il conferimento dei dati è obbligatorio?\n\nIl conferimento dei dati personali è obbligatorio solo per i trattamenti necessari alla fornitura dei servizi offerti da MysticBlend (l\'eventuale rifiuto nella finalità di fornire il servizio comporta l\'impossibilità di usufruire del servizio stesso); per le finalità promozionali e di profilazione è facoltativo e l\'eventuale rifiuto a prestare il consenso non ha conseguenze negative sulla fornitura del servizio offerto all\'interno dell\'app e del relativo sito web.\n\n3. UTILIZZO DEL DATABASE FIREBASE\n\nL\'Applicazione può utilizzare Firebase, un servizio di database fornito da Google, per archiviare e recuperare dati. I termini di servizio e l\'informativa sulla privacy di Firebase si applicano all\'utilizzo dei servizi Firebase. Sei responsabile del rispetto dei termini e dell\'informativa sulla privacy di Firebase.\n\n4. PUBBLICITÀ\n\nL\'Applicazione può visualizzare annunci pubblicitari (\"Annunci\") forniti da reti pubblicitarie di terze parti. Questi annunci possono raccogliere informazioni sul tuo dispositivo e possono essere personalizzati in base ai tuoi interessi determinati dall\'utilizzo dell\'Applicazione e di altri siti Web e applicazioni. La nostra Informativa sulla privacy descrive come i tuoi dati vengono utilizzati in relazione agli annunci pubblicitari.\n\n5. PROPRIETÀ INTELLETTUALE\n\nL\'Applicazione, inclusi tutti i contenuti, la grafica e altri materiali, è protetta dalle leggi sul copyright e da altre leggi sulla proprietà intellettuale. Non è consentito modificare, riprodurre, distribuire, creare opere derivate o decodificare l\'Applicazione.\n\n6. ESCLUSIONE DI RESPONSABILITÀ\n\nL\'APPLICAZIONE VIENE FORNITA \"COSÌ COM\'È\" E \"COME DISPONIBILE\" SENZA ALCUNA GARANZIA, ESPLICITA O IMPLICITA. NELLA MISURA MASSIMA CONSENTITA DALLA LEGGE APPLICABILE, DECLINIAMO OGNI GARANZIA, INCLUSE MA NON LIMITATE A GARANZIE IMPLICITE DI COMMERCIABILITÀ, IDONEITÀ PER UNO SCOPO PARTICOLARE E NON VIOLAZIONE.\n\n7. LIMITAZIONE DI RESPONSABILITÀ\n\nNELLA MISURA MASSIMA CONSENTITA DALLA LEGGE APPLICABILE, NON SAREMO RESPONSABILI PER EVENTUALI DANNI INDIRETTI, ACCIDENTALI, SPECIALI, CONSEQUENZIALI O PUNITIVI, O PER EVENTUALI PERDITE DI PROFITTI O ENTRATE, SOSTENUTE DIRETTAMENTE O INDIRETTAMENTE, O PER EVENTUALI PERDITE DI DATI, UTILIZZO, AVVIAMENTO O ALTRE PERDITE IMMATERIALI DERIVANTI DALL\'UTILIZZO DELL\'APPLICAZIONE.\n\n8. RISOLUZIONE\n\nCi riserviamo il diritto di interrompere o sospendere l\'accesso all\'Applicazione in qualsiasi momento e per qualsiasi motivo, senza preavviso. In caso di risoluzione, l\'utente dovrà cessare ogni utilizzo dell\'Applicazione.\n\n9. LEGGE APPLICABILE\n\nIl presente Contratto sarà regolato e interpretato in conformità con le leggi di [La tua giurisdizione], indipendentemente dai principi di conflitto di leggi.\n\n10. INFORMAZIONI DI CONTATTO\n\nPer domande o dubbi sul presente Contratto o sull\'Applicazione, puoi contattarci all\'indirizzo corpoespiritoshop@gmail.com.\n\nScaricando, installando o utilizzando l\'Applicazione, l\'utente riconosce di aver letto e compreso il presente Contratto e accetta di essere vincolato dai suoi termini e condizioni. Se non sei d\'accordo con qualsiasi parte del presente Contratto, non scaricare, installare o utilizzare l\'Applicazione.\n\nMysticBlend corpoespiritoshop@gmail.com\n\nSi prega di conservare una copia del presente Contratto per i propri archivi.',
    },
  },
  // DropdownNotifications
  {
    '1bc4h8af': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'it': 'Notifiche',
    },
  },
  // Miscellaneous
  {
    '43rwy2i2': {
      'en':
          'Our app uses the camera to capture photos of the items and services the vendor provides.',
      'es':
          'Nuestra aplicación utiliza la cámara para capturar fotografías de los artículos y servicios que ofrece el proveedor.',
      'it':
          'La nostra app utilizza la fotocamera per acquisire foto degli articoli e dei servizi forniti dal venditore.',
    },
    'hphkd32h': {
      'en':
          'Our app uses the photo library to display photos of the items and services the vendor provides.',
      'es':
          'Nuestra aplicación utiliza la biblioteca de fotos para mostrar fotografías de los artículos y servicios que ofrece el proveedor.',
      'it':
          'La nostra app utilizza la libreria fotografica per visualizzare le foto degli articoli e dei servizi forniti dal venditore.',
    },
    'zx7ykjid': {
      'en':
          'In order to add the location of the items and services for tracking purposes, the app requires the access to your location',
      'es':
          'Para agregar la ubicación de los artículos y servicios con fines de seguimiento, la aplicación requiere acceso a su ubicación.',
      'it':
          'Per aggiungere la posizione degli articoli e dei servizi a scopo di monitoraggio, l\'app richiede l\'accesso alla tua posizione',
    },
    '39tdd8c0': {
      'en': 'Notifications are sent every time new items are avaiable',
      'es':
          'Se envían notificaciones cada vez que hay nuevos artículos disponibles.',
      'it':
          'Le notifiche vengono inviate ogni volta che sono disponibili nuovi articoli',
    },
    'csyrx4yo': {
      'en': '',
      'es': '',
      'it': '',
    },
    'gg7efcso': {
      'en': '',
      'es': '',
      'it': '',
    },
    'y73cywvs': {
      'en': '',
      'es': '',
      'it': '',
    },
    '23yftnc3': {
      'en': '',
      'es': '',
      'it': '',
    },
    'ogjl962e': {
      'en': '',
      'es': '',
      'it': '',
    },
    'a922rzyf': {
      'en': '',
      'es': '',
      'it': '',
    },
    'rehb3slt': {
      'en': '',
      'es': '',
      'it': '',
    },
    'i7uastb0': {
      'en': '',
      'es': '',
      'it': '',
    },
    'oxshevg0': {
      'en': '',
      'es': '',
      'it': '',
    },
    'cdcu635f': {
      'en': '',
      'es': '',
      'it': '',
    },
    'gsvujsi9': {
      'en': '',
      'es': '',
      'it': '',
    },
    'hmijqsr6': {
      'en': '',
      'es': '',
      'it': '',
    },
    '5owrlrup': {
      'en': '',
      'es': '',
      'it': '',
    },
    '9ibdkmbj': {
      'en': '',
      'es': '',
      'it': '',
    },
    'eupps9tx': {
      'en': '',
      'es': '',
      'it': '',
    },
    '9ee4dg83': {
      'en': '',
      'es': '',
      'it': '',
    },
    '1jwblrmh': {
      'en': '',
      'es': '',
      'it': '',
    },
    'aheilhbm': {
      'en': '',
      'es': '',
      'it': '',
    },
    'k9ispcc2': {
      'en': '',
      'es': '',
      'it': '',
    },
    'ypzxueyw': {
      'en': '',
      'es': '',
      'it': '',
    },
    '8tovxsof': {
      'en': '',
      'es': '',
      'it': '',
    },
    'oaoh9z98': {
      'en': '',
      'es': '',
      'it': '',
    },
    'ti5zkw1p': {
      'en': '',
      'es': '',
      'it': '',
    },
  },
].reduce((a, b) => a..addAll(b));
