'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "edac6610d63f93aebfb1c09a76230248",
"index.html": "7a5402b37b8cb7105f007e7e8b4fe1e8",
"/": "7a5402b37b8cb7105f007e7e8b4fe1e8",
"main.dart.js": "f8540ba3270dbd441f2c80531a97c8f7",
"favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"icons/Icon-192.png": "12d05db1c0b26d429b54e3f8c946a496",
"icons/favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"icons/Icon-512.png": "aabba36693aba0ec8d954adf297d3125",
"manifest.json": "c58884a2d51c23985850658029a90226",
"assets/AssetManifest.json": "633c28ea8fdfe73b708ca3ea87bbe3b8",
"assets/NOTICES": "eaa1153c633fb6aa029336a0ddde55af",
"assets/FontManifest.json": "a6a35a39ab693849dcde3aba2d4304a7",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/simple_dash_large.png": "c3100434238b1fe0f6b8e6d074ccd80e",
"assets/assets/images/audio_control/simple_on.png": "63e24186aec21d19e6f82f88d656a951",
"assets/assets/images/audio_control/dashatar_on.png": "927040d878eeeb9c0700d50fac87674f",
"assets/assets/images/audio_control/yellow_dashatar_off.png": "f1606e5fb255a5a48dbadc722a983060",
"assets/assets/images/audio_control/green_dashatar_off.png": "8aae7e7135d47a7536b2cca91d877c2a",
"assets/assets/images/audio_control/blue_dashatar_off.png": "fb9cf31f68997341215e5484252350fe",
"assets/assets/images/audio_control/simple_off.png": "ecac9ec0e8dc5d526e204651b5e62dcc",
"assets/assets/images/logo_flutter_color.png": "496548be6768a0945cafe0cf7c12b389",
"assets/assets/images/simple_dash_small.png": "b3f2ec92db7be8297f529f94d8e38136",
"assets/assets/images/shuffle_icon.png": "32ebb4a7c6f9b07157a57f537f254619",
"assets/assets/images/timer_icon.png": "284049eb59c25888ebe6ecf864728727",
"assets/assets/images/logo_flutter_white.png": "fe99d806f7819c9ef2d2c9a1dc350693",
"assets/assets/images/dashatar/green/8.png": "4f238cb5b59b8d246f3b45d64fa4065e",
"assets/assets/images/dashatar/green/9.png": "4b652f03ed51359a4729dacb9a3f7479",
"assets/assets/images/dashatar/green/14.png": "485fef2877b1e82ecf1e8c1fc76ce82b",
"assets/assets/images/dashatar/green/15.png": "dd8360ee77b91eb98590d38fe242f574",
"assets/assets/images/dashatar/green/12.png": "3eb9c7dce99bbf25206d3528651fc342",
"assets/assets/images/dashatar/green/13.png": "d64aff6c5f2a5aa8a2c5e4190c1664a1",
"assets/assets/images/dashatar/green/11.png": "cbde174349a89fb85b55d53f31fb113a",
"assets/assets/images/dashatar/green/10.png": "06b7f188768b1057a8e66347909f53ef",
"assets/assets/images/dashatar/green/4.png": "e44d562d1f26717216974e2604649dbb",
"assets/assets/images/dashatar/green/5.png": "70c96aa8481c1d899b70813a9ebe9464",
"assets/assets/images/dashatar/green/7.png": "33c182d78222e82fbc5ab27ab2f5c394",
"assets/assets/images/dashatar/green/6.png": "70f369d4a89fc9ef9008d99299e23777",
"assets/assets/images/dashatar/green/2.png": "f253681e729a485077e089ea0f6af8f2",
"assets/assets/images/dashatar/green/3.png": "026e60505858e27f4c38667ab345b5b7",
"assets/assets/images/dashatar/green/1.png": "1aaa0fc741c524e9072308c3a791783c",
"assets/assets/images/dashatar/yellow55/yellow_01_03.png": "f00337d5aaafac418bfac18623d1db1a",
"assets/assets/images/dashatar/yellow55/yellow_01_02.png": "39bfd116e85fc5f083734e4307aeb041",
"assets/assets/images/dashatar/yellow55/yellow_03_05.png": "dc3a85a20d4ae54eb2ec9cea8dc8ee07",
"assets/assets/images/dashatar/yellow55/yellow_03_04.png": "362314b15389fe0a60763c2b368b4a05",
"assets/assets/images/dashatar/yellow55/yellow_01_01.png": "b81339e9ba654e0d86c1769af4f6a566",
"assets/assets/images/dashatar/yellow55/yellow_01_05.png": "8595c226338e6dd69424f3b9e8b23431",
"assets/assets/images/dashatar/yellow55/yellow_03_01.png": "01beda469c2a7a2b74c5bcf0f1c4104e",
"assets/assets/images/dashatar/yellow55/yellow_01_04.png": "39bfd116e85fc5f083734e4307aeb041",
"assets/assets/images/dashatar/yellow55/yellow_03_03.png": "da47df964c886d460a2706c42fa34bc8",
"assets/assets/images/dashatar/yellow55/yellow_03_02.png": "10608c8655a94aeaa14da7afda053eb8",
"assets/assets/images/dashatar/yellow55/yellow_05_04.png": "046ed19990af4029dd9958a0de5118ef",
"assets/assets/images/dashatar/yellow55/yellow_05_05.png": "7c3375a21fb64b9c073990ccc399ff39",
"assets/assets/images/dashatar/yellow55/yellow_05_02.png": "35a051d74684ff58ac2053bf4737806f",
"assets/assets/images/dashatar/yellow55/yellow_05_03.png": "c65b48a12e8ea838430a56e3325d14ec",
"assets/assets/images/dashatar/yellow55/yellow_05_01.png": "b53eb4e2c8395c66f5ff2bd314f84a1e",
"assets/assets/images/dashatar/yellow55/yellow_02_04.png": "6c480335b8eca53424de8461b9e168a7",
"assets/assets/images/dashatar/yellow55/yellow_02_05.png": "db0964c16058dbaf2ee1c26104827a5a",
"assets/assets/images/dashatar/yellow55/yellow_02_02.png": "596b863a1e85fb4f9cf6bb4065e83025",
"assets/assets/images/dashatar/yellow55/yellow_02_03.png": "2c32d6a80d0c9e84b2e431dd00bf5b9a",
"assets/assets/images/dashatar/yellow55/yellow_02_01.png": "c0f209763e9d977adc1f0868bfaf516e",
"assets/assets/images/dashatar/yellow55/yellow_04_05.png": "e035e85716201dfc218f69aca6ff3945",
"assets/assets/images/dashatar/yellow55/yellow_04_04.png": "9db0bce0c23a8ab3832af022bba236c8",
"assets/assets/images/dashatar/yellow55/yellow_04_01.png": "1171ecd2931ced09cc0c11eb8ca8d06f",
"assets/assets/images/dashatar/yellow55/yellow_04_03.png": "03ac6befd87f509550867008ab194348",
"assets/assets/images/dashatar/yellow55/yellow_04_02.png": "ed09b6a84214a1213e30680552b1e641",
"assets/assets/images/dashatar/green44/green_01_03.png": "dc085475ba6b13c3150151f062e08e9c",
"assets/assets/images/dashatar/green44/green_01_02.png": "641fcd483631f9d1f625a1d4e57df3f9",
"assets/assets/images/dashatar/green44/green_01_01.png": "a0e32764027e1911b858ee9a6f4921a4",
"assets/assets/images/dashatar/green44/green_03_04.png": "a347c4ac645ab07db78e6b17be65657a",
"assets/assets/images/dashatar/green44/green_01_04.png": "b18ac53dc5bce5b296e476e502dd57de",
"assets/assets/images/dashatar/green44/green_03_01.png": "0bd6ddb3903ea18684a3b6a106b26dfa",
"assets/assets/images/dashatar/green44/green_03_03.png": "2789fb4131582f5028661ef2a9132cb9",
"assets/assets/images/dashatar/green44/green_03_02.png": "0c45ac933c0450dd4041377b1baf98c2",
"assets/assets/images/dashatar/green44/green_02_04.png": "9c8e062bdb9aa06a2ce3394970ce6a0b",
"assets/assets/images/dashatar/green44/green_02_02.png": "ce2613a80c016e377b858be015060d96",
"assets/assets/images/dashatar/green44/green_02_03.png": "9066494826bbc94c0751989ab569220b",
"assets/assets/images/dashatar/green44/green_02_01.png": "0e1b7dd2acde20e1ac8da1092a0462b6",
"assets/assets/images/dashatar/green44/green_04_04.png": "fea3f8489b1da28cb9ed09ba55ba2da8",
"assets/assets/images/dashatar/green44/green_04_01.png": "468dbf951c4ced614dab203fc82e6012",
"assets/assets/images/dashatar/green44/green_04_03.png": "a7ec409c964bcd98b4bb96f99a3863a2",
"assets/assets/images/dashatar/green44/green_04_02.png": "1dd8c6e95094283d68b90a9ed75e5e06",
"assets/assets/images/dashatar/success/yellow.png": "463f9b0eddcae6089e8fd33f3ded3164",
"assets/assets/images/dashatar/success/blue.png": "993266c9723f234300d052cd4fda43d1",
"assets/assets/images/dashatar/success/green.png": "7c284d7b36bb5388c4d87b1dd5cf3f88",
"assets/assets/images/dashatar/blue/8.png": "cd05b0e2b93549f4aac372874658161e",
"assets/assets/images/dashatar/blue/9.png": "a69e1869147b271c707255945b79b327",
"assets/assets/images/dashatar/blue/14.png": "b3930b781f602a18fecbc287eb8de536",
"assets/assets/images/dashatar/blue/15.png": "a7d13e26458a3945df47c5f867d91399",
"assets/assets/images/dashatar/blue/12.png": "f5c7df6eeb615606ec8a0824cf5edc01",
"assets/assets/images/dashatar/blue/13.png": "c0c339eb522ed4ee91842291b86bc083",
"assets/assets/images/dashatar/blue/11.png": "7cc92a508afb5f8f11398623dc87b13d",
"assets/assets/images/dashatar/blue/10.png": "4a8b897b54605febe3e52fc4e4af7be2",
"assets/assets/images/dashatar/blue/4.png": "2db99be298e081eb8e005c1c607ec855",
"assets/assets/images/dashatar/blue/5.png": "bf5a87a649c90a2063fcee6cc1d2bcfe",
"assets/assets/images/dashatar/blue/7.png": "33a6c0c5e4e019fba561e399494d4df8",
"assets/assets/images/dashatar/blue/6.png": "6f15995595827885e26620f0d28edaff",
"assets/assets/images/dashatar/blue/2.png": "f3175c4deda4e4da7b89fd70f4d47b20",
"assets/assets/images/dashatar/blue/3.png": "d3fe8adeec6576a60714495345c71536",
"assets/assets/images/dashatar/blue/1.png": "05d5a28959eb68afdc257d86f81df8df",
"assets/assets/images/dashatar/green33/green_01_03.png": "834fcc371338ee10f7f8c00b9ce17d6d",
"assets/assets/images/dashatar/green33/green_01_02.png": "24956a0bf49e18c7132e42fd623de898",
"assets/assets/images/dashatar/green33/green_01_01.png": "2f5458e0902106f1dd03d7793b8ea6c2",
"assets/assets/images/dashatar/green33/green_03_01.png": "653bcf6b3e7e403bb0c7d580b9cf2f5f",
"assets/assets/images/dashatar/green33/green_03_03.png": "2526e7c31b9b7599553f787405cb7e71",
"assets/assets/images/dashatar/green33/green_03_02.png": "a0f880189a31b388bf788618c07d9504",
"assets/assets/images/dashatar/green33/green_02_02.png": "02ede01fc5f0bbba89613bfbcef51b54",
"assets/assets/images/dashatar/green33/green_02_03.png": "763919b850478e7fc1363592d248fcce",
"assets/assets/images/dashatar/green33/green_02_01.png": "32a314586632e0a4683584dfd567aff6",
"assets/assets/images/dashatar/gallery/yellow.png": "8529c74259d6963491ceda3a82a8df30",
"assets/assets/images/dashatar/gallery/blue.png": "0d11f20efc6570a048f7fdaaaf91fb01",
"assets/assets/images/dashatar/gallery/green.png": "56aabe4c6f02f0000fb00cf8d7a93544",
"assets/assets/images/dashatar/blue55/blue_04_01.png": "ffe855e148ed6c83448c165e38987fda",
"assets/assets/images/dashatar/blue55/blue_04_03.png": "02570d4e0cac356865a12d635db777c1",
"assets/assets/images/dashatar/blue55/blue_04_02.png": "0950f0d0c7c8bed5bfc973e29661c231",
"assets/assets/images/dashatar/blue55/blue_04_05.png": "778176419cf3ac375e2b0bd4ad158631",
"assets/assets/images/dashatar/blue55/blue_04_04.png": "65b30e0f5938832f6b7af60994e07607",
"assets/assets/images/dashatar/blue55/blue_02_02.png": "ad5af5fd11f5fed968b70e2603fdd6e3",
"assets/assets/images/dashatar/blue55/blue_02_03.png": "82a069f3986745ee22d25cd1f5bf5e28",
"assets/assets/images/dashatar/blue55/blue_02_01.png": "9da4415f0b7fd66c8eb794f84a8184df",
"assets/assets/images/dashatar/blue55/blue_02_04.png": "2c4414c4e3fd428e37b20585c5636ad9",
"assets/assets/images/dashatar/blue55/blue_02_05.png": "39cbcbad1eaf845de1cbe50a33d5894f",
"assets/assets/images/dashatar/blue55/blue_05_02.png": "a335d48d82cd7461ca5d3e0d6802cc9d",
"assets/assets/images/dashatar/blue55/blue_05_03.png": "b8c75e13e7a50a2d24ab7800dbf04d67",
"assets/assets/images/dashatar/blue55/blue_05_01.png": "a71fafd3907ba7a8ea5aaed0451128ec",
"assets/assets/images/dashatar/blue55/blue_05_04.png": "b7a765c98ae6c2a1fe733ae15f364f3a",
"assets/assets/images/dashatar/blue55/blue_05_05.png": "2f536d08aca523f682a8c7acf82d98ef",
"assets/assets/images/dashatar/blue55/blue_01_05.png": "b085ee03770cc56e1395a30b868a9b8a",
"assets/assets/images/dashatar/blue55/blue_03_01.png": "a99669299dc1115af81f3d7c9639b8d6",
"assets/assets/images/dashatar/blue55/blue_01_04.png": "c9340fa2ed4b3dfa43d590bbe84f15b0",
"assets/assets/images/dashatar/blue55/blue_03_03.png": "48f089533412b5e5c559d2dd09beeb4a",
"assets/assets/images/dashatar/blue55/blue_03_02.png": "dfdba2d127c7b1e36fc29b2cb429c5c9",
"assets/assets/images/dashatar/blue55/blue_01_03.png": "bf95104936e4153154caeec2526188f6",
"assets/assets/images/dashatar/blue55/blue_01_02.png": "c9340fa2ed4b3dfa43d590bbe84f15b0",
"assets/assets/images/dashatar/blue55/blue_03_05.png": "bbdb5071cbcc2b427e0a7e5e24140c64",
"assets/assets/images/dashatar/blue55/blue_03_04.png": "0fa78de95dd43dddd62862263353965e",
"assets/assets/images/dashatar/blue55/blue_01_01.png": "48b2ebca310f74e7f233c087b66fb3c6",
"assets/assets/images/dashatar/blue44/blue_04_01.png": "9c62a7b50db4d3292a7f69813d20bf85",
"assets/assets/images/dashatar/blue44/blue_04_03.png": "1abf84dadd90b4bb4b7eeedab7393465",
"assets/assets/images/dashatar/blue44/blue_04_02.png": "bbfaf0383581212c4ac4e1aad47a1cb3",
"assets/assets/images/dashatar/blue44/blue_04_04.png": "8a4e6f041d81151c1376bbf175586434",
"assets/assets/images/dashatar/blue44/blue_02_02.png": "78750f71b81c4397996fa5bf363b2edb",
"assets/assets/images/dashatar/blue44/blue_02_03.png": "cb7993949d69e80221e693ef053bc496",
"assets/assets/images/dashatar/blue44/blue_02_01.png": "5f3195ec76bbbc4ff77c4f919a8985ef",
"assets/assets/images/dashatar/blue44/blue_02_04.png": "e76ebb3f12beec92122f8c35f6de05c6",
"assets/assets/images/dashatar/blue44/blue_03_01.png": "477cfb0f792b7e62aabbd8b57fd3be2f",
"assets/assets/images/dashatar/blue44/blue_01_04.png": "8bd8af11e200b6512be27b4486b90bae",
"assets/assets/images/dashatar/blue44/blue_03_03.png": "1631fb9fe591b42734f480c95d3aad4f",
"assets/assets/images/dashatar/blue44/blue_03_02.png": "7545f59ba2d122eaa64566d565366302",
"assets/assets/images/dashatar/blue44/blue_01_03.png": "4b659684f0b0326275e99e6ea341ae9b",
"assets/assets/images/dashatar/blue44/blue_01_02.png": "abb75f390db3de32abf81ad2497da748",
"assets/assets/images/dashatar/blue44/blue_03_04.png": "0e10af033cffd87b56f3c5b5a55b4e58",
"assets/assets/images/dashatar/blue44/blue_01_01.png": "4d333821109dc8e4a10de49cd07d11c7",
"assets/assets/images/dashatar/yellow33/yellow_01_03.png": "2f3b98f07665edd04032a85686f119f7",
"assets/assets/images/dashatar/yellow33/yellow_01_02.png": "d6b650415850b781292c91671f2a1c8d",
"assets/assets/images/dashatar/yellow33/yellow_01_01.png": "84933a80c3ab84fe60f65a88ef934871",
"assets/assets/images/dashatar/yellow33/yellow_03_01.png": "e2f7f462419ebd83941941ebbd0c05ad",
"assets/assets/images/dashatar/yellow33/yellow_03_03.png": "880a1345c1f5d73e61fffb9c40271fb4",
"assets/assets/images/dashatar/yellow33/yellow_03_02.png": "47ba9e6eb351b725b2e1eab62412279a",
"assets/assets/images/dashatar/yellow33/yellow_02_02.png": "1cd2bffec2805e67ee5e2bf9f433137d",
"assets/assets/images/dashatar/yellow33/yellow_02_03.png": "a06ccece4a44888854e3ebc10e75c2f4",
"assets/assets/images/dashatar/yellow33/yellow_02_01.png": "d67a7f6bc521f89f5f5a0945d7cdb3a4",
"assets/assets/images/dashatar/green55/green_01_03.png": "bb1740ecf502f2d832a951ffb6101e9a",
"assets/assets/images/dashatar/green55/green_01_02.png": "ccef7ed9d2591fcb14d33f3de0418b12",
"assets/assets/images/dashatar/green55/green_03_05.png": "75436c4e5cdf4f8342720d3220b9c2aa",
"assets/assets/images/dashatar/green55/green_01_01.png": "cf233dbb1af22ff417689f8cbd667146",
"assets/assets/images/dashatar/green55/green_03_04.png": "16fa32f4d5c722210dba0443f64ccd07",
"assets/assets/images/dashatar/green55/green_01_05.png": "bb1ff1a3c8e0017d27a1319152a8fc4b",
"assets/assets/images/dashatar/green55/green_01_04.png": "ccef7ed9d2591fcb14d33f3de0418b12",
"assets/assets/images/dashatar/green55/green_03_01.png": "69ff5151b31d2e734884bbf4071ae44f",
"assets/assets/images/dashatar/green55/green_03_03.png": "47fd1c901d5e2302c665906a88221f26",
"assets/assets/images/dashatar/green55/green_03_02.png": "54319c44cf3e2c13673dd45c400751b2",
"assets/assets/images/dashatar/green55/green_05_04.png": "258364997d240efebda7139b9b408dab",
"assets/assets/images/dashatar/green55/green_05_05.png": "3e78d9b60d5704df6999a07d0f4a1595",
"assets/assets/images/dashatar/green55/green_05_02.png": "52b171bbdb4bde044b304ca930c15979",
"assets/assets/images/dashatar/green55/green_05_03.png": "142f8f889759aa0c8c3c8af5eeda3736",
"assets/assets/images/dashatar/green55/green_05_01.png": "af752ad422842f4f789ad13b396d1202",
"assets/assets/images/dashatar/green55/green_02_04.png": "25e6634b3236545c54cda9875528445c",
"assets/assets/images/dashatar/green55/green_02_05.png": "b16b69a36a05db8baaa8f3ff8355cdcc",
"assets/assets/images/dashatar/green55/green_02_02.png": "1a29aa0794386c5de87579750424e685",
"assets/assets/images/dashatar/green55/green_02_03.png": "c4bf4f135c9aa82c655b0718b7ea54cf",
"assets/assets/images/dashatar/green55/green_02_01.png": "d56ed88adb722f2b8dd013b535f0b76a",
"assets/assets/images/dashatar/green55/green_04_05.png": "b091188ec8eaf44ad10b0f18a13390a5",
"assets/assets/images/dashatar/green55/green_04_04.png": "764baf59cc0dfb7647926c8988087901",
"assets/assets/images/dashatar/green55/green_04_01.png": "b4218b92539b67b5226f0dc5a3f8def3",
"assets/assets/images/dashatar/green55/green_04_03.png": "dcd87a58bc934899773e5eb8136b7f30",
"assets/assets/images/dashatar/green55/green_04_02.png": "dfe6d30a6c33a9bd6c5621260f3cf078",
"assets/assets/images/dashatar/yellow/8.png": "009119a3070bb1a26e1c0818416b9443",
"assets/assets/images/dashatar/yellow/9.png": "4871571dbf700aa442f0164de2741584",
"assets/assets/images/dashatar/yellow/14.png": "4305aad7dece1bf58563be4b1206462e",
"assets/assets/images/dashatar/yellow/15.png": "627fc0b4d5f7143d6054a12320e24ea3",
"assets/assets/images/dashatar/yellow/12.png": "aa572bdcf208950ba3ba18163843ce9b",
"assets/assets/images/dashatar/yellow/13.png": "125ce26c7037c3ce1b5cc5612c6f45a4",
"assets/assets/images/dashatar/yellow/11.png": "06b5abb83556b27e419fd25b6379718d",
"assets/assets/images/dashatar/yellow/10.png": "762f254e03a141c4f37f5266252e7fda",
"assets/assets/images/dashatar/yellow/4.png": "242529bdbff47093644ae7c3294a5605",
"assets/assets/images/dashatar/yellow/5.png": "004623c40322bfde14297f900e9fca9a",
"assets/assets/images/dashatar/yellow/7.png": "8f8ab4dc886aa6ab28ee3915cb253fef",
"assets/assets/images/dashatar/yellow/6.png": "eccda62166e60dd38eb2f7e8e299ad6d",
"assets/assets/images/dashatar/yellow/2.png": "27c9f436411e6fd5ae90747365567332",
"assets/assets/images/dashatar/yellow/3.png": "5819a2018af0001c722ab7bcc9dd68a8",
"assets/assets/images/dashatar/yellow/1.png": "f08b518484f7089f7efbd5b0fa582410",
"assets/assets/images/dashatar/blue33/blue_02_02.png": "f2ce0796c43f7138dbb5832f6038b3b5",
"assets/assets/images/dashatar/blue33/blue_02_03.png": "34342e308918c437bd0470dfe6fb6e79",
"assets/assets/images/dashatar/blue33/blue_02_01.png": "8c7467575a1ae7f2190b4307c654d2b1",
"assets/assets/images/dashatar/blue33/blue_03_01.png": "6067daa6761ffdf594a6ff6a0aa9f44a",
"assets/assets/images/dashatar/blue33/blue_03_03.png": "27523f9bc095b5f77cf8adcbaa6b0cf7",
"assets/assets/images/dashatar/blue33/blue_03_02.png": "0bcc1d93795fd05a98b9ded271ff8596",
"assets/assets/images/dashatar/blue33/blue_01_03.png": "e3a5f62656ef96782d1e6f48038ba651",
"assets/assets/images/dashatar/blue33/blue_01_02.png": "1d3da6cd24b739331405e8e91fb7c3de",
"assets/assets/images/dashatar/blue33/blue_01_01.png": "e43ce5572c27dffeb59b4c890d319ec9",
"assets/assets/images/dashatar/yellow44/yellow_01_03.png": "b38a9643aee623a4e3ae39aa778ff8d1",
"assets/assets/images/dashatar/yellow44/yellow_01_02.png": "264bb334e6a35ce4056494fdb8f7f4be",
"assets/assets/images/dashatar/yellow44/yellow_03_04.png": "2e9c0e25f09eceb7b44a7213ad9a2761",
"assets/assets/images/dashatar/yellow44/yellow_01_01.png": "63653fa32785d1a1d3ed4f4dd958c2dc",
"assets/assets/images/dashatar/yellow44/yellow_03_01.png": "f9d4f5b592daf0ccaa3c93c6816d058c",
"assets/assets/images/dashatar/yellow44/yellow_01_04.png": "e96a6b4c82f01a7c463c41c3c1c9bf1f",
"assets/assets/images/dashatar/yellow44/yellow_03_03.png": "0f4ad839ec6191132ae7e4f743285f69",
"assets/assets/images/dashatar/yellow44/yellow_03_02.png": "0f476360a25340ea31de765cc8f76180",
"assets/assets/images/dashatar/yellow44/yellow_02_04.png": "e9d9f894b2a04ee95de9aaf68c49eb5c",
"assets/assets/images/dashatar/yellow44/yellow_02_02.png": "55a218e7a0b0349054d6e6fe08fc0fd0",
"assets/assets/images/dashatar/yellow44/yellow_02_03.png": "bf7c2536dc83ee3a5e619e5b23056859",
"assets/assets/images/dashatar/yellow44/yellow_02_01.png": "82da3bc857f2dfd47c11dbe3084483b9",
"assets/assets/images/dashatar/yellow44/yellow_04_04.png": "d71e61c35f53f19dedf0295845405c82",
"assets/assets/images/dashatar/yellow44/yellow_04_01.png": "e377ff194db4bf65315687395a88d0d3",
"assets/assets/images/dashatar/yellow44/yellow_04_03.png": "3508e2d29734704834bf7c93f70fac1c",
"assets/assets/images/dashatar/yellow44/yellow_04_02.png": "d22ed7cda6c39e263f3262ded0814a5c",
"assets/assets/images/facebook_icon.png": "284d2a1d2782e5e24b1f9bce25f3ea9a",
"assets/assets/images/simple_dash_medium.png": "4e2fd9dee5fbd150653f06a83be3accf",
"assets/assets/images/twitter_icon.png": "f9a8b83fc280f6a6363783cdbdd81573",
"assets/assets/audio/sandwich.mp3": "5a3cf659842b0db22ab9495ea2cdc80a",
"assets/assets/audio/skateboard.mp3": "13e460479dc92b0ff1574d35a5204392",
"assets/assets/audio/tile_move.mp3": "f4056eec1581ee5264ab8f481a59d5d3",
"assets/assets/audio/shuffle.mp3": "0ac82d67f08b71d43046256dbc2db12d",
"assets/assets/audio/click.mp3": "7b257864b73a219a79572b785910e685",
"assets/assets/audio/success.mp3": "746679b7331cf687df94188b40ff6f67",
"assets/assets/audio/dumbbell.mp3": "aa341eb857b4fd972767430aa5babb30",
"assets/assets/fonts/GoogleSans-Italic.ttf": "b08c7421b2d5350ea3003c8f38932601",
"assets/assets/fonts/GoogleSans-Bold.ttf": "c0370e8a74992bab73461f8348e3b369",
"assets/assets/fonts/GoogleSans-BoldItalic.ttf": "aebc8fe5e393970fa3d468524e64b670",
"assets/assets/fonts/GoogleSans-Regular.ttf": "51134713ade7b1f137e06ce395d39d40"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
