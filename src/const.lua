--[[
Copyright (C) 2018 Sean Anderson

This file is part of Realistic Nukes

Realistic Nukes is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Realistic Nukes is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]]

local const = {}

-- Conversions in the form from_to

const.foot_meter = 0.3048
const.meter_foot = 3.2808
const.second_tick = 60
const.tick_second = 1/const.second_tick

-- Physical constants
const.atm = 14.69595 -- psi
const.sound_speed = 343 -- m/s

-- Amount of damage from 1 psi overpressure
const.psi_dmg = 20

-- From nukeeffects.js, originally from Glasstone 77; converted to lua
-- Peak overpressures of a 1kT burst
-- in the form table[overpressure (psi)] = {{height (feet), range (feet)}, ...}
const.overpressure_table = {
	[10000] = {
		{0  , 69},
		{10 , 70},
		{22 , 70},
		{33 , 71},
		{44 , 71},
		{54 , 71},
		{65 , 70},
		{73 , 68},
		{79 , 66},
		{88 , 63},
		{94 , 58},
		{99 , 53},
		{104, 47},
		{108, 40},
		{111, 33},
		{114, 26},
		{116, 18},
		{117, 11},
		{117, 3},
		{117, 0}
	},
	[5000] = {
		{0  , 88},
		{10 , 88},
		{22 , 89},
		{35 , 90},
		{46 , 90},
		{57 , 90},
		{68 , 89},
		{78 , 88},
		{90 , 85},
		{99 , 81},
		{106, 78},
		{113, 74},
		{119, 69},
		{125, 63},
		{131, 55},
		{135, 48},
		{138, 41},
		{141, 34},
		{143, 26},
		{144, 17},
		{145, 9},
		{146, 0},
	},
	[2000] = {
		{0  , 119},
		{7  , 119},
		{16 , 120},
		{26 , 121},
		{36 , 122},
		{45 , 122},
		{55 , 122},
		{67 , 122},
		{77 , 122},
		{86 , 121},
		{96 , 120},
		{104, 119},
		{113, 117},
		{121, 115},
		{130, 112},
		{138, 108},
		{144, 105},
		{151, 100},
		{156, 94},
		{161, 88},
		{167, 81},
		{172, 73},
		{177, 64},
		{180, 56},
		{183, 48},
		{186, 40},
		{188, 30},
		{190, 21},
		{191, 11},
		{192, 0}
	},
	[1000] = {
		{0  , 154},
		{7  , 154},
		{17 , 154},
		{27 , 155},
		{37 , 155},
		{47 , 156},
		{58 , 156},
		{71 , 157},
		{82 , 157},
		{94 , 158},
		{104, 157},
		{115, 156},
		{126, 154},
		{135, 152},
		{144, 149},
		{153, 146},
		{161, 142},
		{170, 137},
		{178, 131},
		{184, 127},
		{191, 121},
		{196, 115},
		{202, 108},
		{206, 102},
		{210, 96},
		{214, 91},
		{218, 83},
		{222, 75},
		{225, 67},
		{228, 59},
		{230, 52},
		{232, 43},
		{234, 33},
		{236, 24},
		{237, 15},
		{238, 8},
		{239, 0}
	},
	[500] = {
		{0  , 193},
		{9  , 194},
		{19 , 195},
		{29 , 196},
		{39 , 198},
		{50 , 199},
		{61 , 200},
		{76 , 202},
		{89 , 203},
		{103, 203},
		{118, 204},
		{130, 203},
		{142, 202},
		{153, 200},
		{166, 198},
		{179, 194},
		{191, 189},
		{199, 184},
		{209, 179},
		{221, 170},
		{229, 163},
		{236, 154},
		{244, 144},
		{250, 134},
		{256, 125},
		{261, 117},
		{266, 107},
		{271, 96},
		{277, 84},
		{281, 73},
		{284, 60},
		{286, 48},
		{289, 33},
		{290, 18},
		{291, 0}
	},
	[200] = {
		{0  , 264},
		{13 , 264},
		{26 , 265},
		{39 , 265},
		{54 , 266},
		{69 , 266},
		{86 , 267},
		{103, 268},
		{119, 269},
		{136, 269},
		{156, 270},
		{177, 270},
		{195, 269},
		{209, 268},
		{227, 265},
		{240, 261},
		{249, 257},
		{258, 253},
		{266, 249},
		{274, 243},
		{283, 238},
		{290, 231},
		{302, 221},
		{310, 213},
		{317, 204},
		{324, 195},
		{331, 186},
		{338, 175},
		{343, 166},
		{349, 155},
		{356, 142},
		{362, 131},
		{367, 121},
		{372, 107},
		{376, 94},
		{380, 78},
		{382, 64},
		{386, 44},
		{387, 32},
		{390, 0}
	},
	[100] = {
		{0  , 342},
		{10 , 342},
		{25 , 343},
		{42 , 345},
		{60 , 345},
		{78 , 346},
		{96 , 347},
		{113, 348},
		{131, 350},
		{152, 351},
		{175, 353},
		{194, 354},
		{212, 355},
		{230, 355},
		{249, 355},
		{269, 354},
		{286, 353},
		{299, 351},
		{313, 349},
		{326, 344},
		{338, 339},
		{349, 332},
		{360, 324},
		{368, 317},
		{377, 307},
		{386, 297},
		{394, 287},
		{400, 279},
		{407, 270},
		{415, 258},
		{422, 247},
		{429, 237},
		{438, 223},
		{447, 206},
		{455, 191},
		{462, 176},
		{468, 163},
		{474, 149},
		{478, 135},
		{485, 117},
		{489, 100},
		{493, 81},
		{496, 58},
		{498, 39},
		{500, 17},
		{501, 0}
	},
	[50] = {
		{0  , 459},
		{19 , 459},
		{50 , 461},
		{90 , 463},
		{136, 465},
		{174, 469},
		{209, 473},
		{244, 478},
		{279, 483},
		{319, 489},
		{346, 492},
		{371, 493},
		{391, 492},
		{406, 490},
		{427, 484},
		{447, 474},
		{459, 463},
		{472, 442},
		{481, 427},
		{490, 406},
		{504, 386},
		{516, 365},
		{527, 347},
		{537, 329},
		{548, 310},
		{558, 290},
		{568, 270},
		{579, 250},
		{588, 227},
		{598, 202},
		{606, 181},
		{613, 159},
		{620, 138},
		{625, 115},
		{630, 90},
		{633, 68},
		{635, 46},
		{637, 20},
		{638, 0}
	},
	[30] = {
		{0  , 592},
		{24 , 593},
		{54 , 593},
		{84 , 594},
		{114, 594},
		{143, 596},
		{179, 597},
		{215, 600},
		{250, 604},
		{292, 609},
		{328, 612},
		{365, 618},
		{403, 624},
		{441, 631},
		{476, 638},
		{502, 642},
		{527, 642},
		{552, 640},
		{574, 628},
		{587, 609},
		{589, 585},
		{591, 557},
		{596, 524},
		{612, 486},
		{628, 453},
		{647, 421},
		{665, 392},
		{685, 353},
		{703, 319},
		{721, 280},
		{736, 244},
		{747, 214},
		{758, 180},
		{766, 141},
		{773, 107},
		{779, 65},
		{782, 21},
		{784, 0}
	},
	[20] = {
		{0  , 714},
		{34 , 719},
		{84 , 727},
		{130, 737},
		{176, 747},
		{223, 757},
		{274, 771},
		{319, 782},
		{358, 795},
		{399, 812},
		{427, 826},
		{458, 843},
		{485, 860},
		{512, 879},
		{537, 898},
		{566, 914},
		{597, 922},
		{627, 919},
		{651, 907},
		{673, 887},
		{687, 860},
		{694, 826},
		{692, 788},
		{683, 757},
		{674, 729},
		{672, 704},
		{672, 686},
		{677, 662},
		{685, 639},
		{697, 612},
		{713, 586},
		{730, 559},
		{748, 533},
		{764, 508},
		{781, 478},
		{801, 446},
		{814, 419},
		{827, 394},
		{844, 358},
		{858, 327},
		{870, 297},
		{881, 269},
		{892, 232},
		{898, 205},
		{906, 165},
		{912, 124},
		{919, 68},
		{922, 26},
		{924, 0}
	},
	[15] = {
		{0   , 818},
		{27  , 827},
		{67  , 840},
		{114 , 858},
		{160 , 873},
		{209 , 893},
		{250 , 912},
		{294 , 933},
		{319 , 946},
		{359 , 974},
		{398 , 1002},
		{434 , 1033},
		{459 , 1057},
		{488 , 1083},
		{515 , 1111},
		{538 , 1133},
		{565 , 1158},
		{594 , 1178},
		{624 , 1193},
		{650 , 1196},
		{676 , 1191},
		{692 , 1183},
		{711 , 1173},
		{726 , 1161},
		{739 , 1146},
		{750 , 1129},
		{761 , 1109},
		{771 , 1082},
		{776 , 1058},
		{779 , 1028},
		{778 , 990},
		{773 , 956},
		{764 , 923},
		{751 , 892},
		{738 , 865},
		{731 , 838},
		{733 , 811},
		{740 , 784},
		{750 , 757},
		{765 , 727},
		{780 , 698},
		{798 , 668},
		{815 , 640},
		{831 , 615},
		{845 , 589},
		{861 , 563},
		{874 , 539},
		{889 , 512},
		{907 , 481},
		{921 , 452},
		{935 , 425},
		{948 , 397},
		{958 , 377},
		{968 , 352},
		{980 , 331},
		{1000, 277},
		{1004, 215},
		{1017, 153},
		{1033, 74},
		{1041, 0}
	},
	[10] = {
		{0   , 1024},
		{30  , 1037},
		{73  , 1056},
		{115 , 1074},
		{151 , 1092},
		{191 , 1112},
		{235 , 1133},
		{269 , 1151},
		{312 , 1173},
		{345 , 1193},
		{380 , 1214},
		{412 , 1238},
		{442 , 1261},
		{471 , 1285},
		{500 , 1312},
		{528 , 1336},
		{558 , 1360},
		{592 , 1387},
		{627 , 1412},
		{658 , 1430},
		{692 , 1447},
		{724 , 1455},
		{749 , 1455},
		{767 , 1450},
		{785 , 1443},
		{805 , 1433},
		{820 , 1422},
		{835 , 1407},
		{851 , 1388},
		{862 , 1370},
		{872 , 1348},
		{881 , 1320},
		{888 , 1291},
		{893 , 1265},
		{896 , 1246},
		{894 , 1227},
		{888 , 1196},
		{881 , 1173},
		{872 , 1148},
		{859 , 1119},
		{850 , 1097},
		{846 , 1065},
		{848 , 1047},
		{852 , 1026},
		{858 , 1007},
		{867 , 983},
		{880 , 957},
		{891 , 934},
		{904 , 911},
		{916 , 890},
		{926 , 874},
		{941 , 852},
		{953 , 833},
		{965 , 814},
		{980 , 795},
		{989 , 778},
		{1000, 765},
		{1017, 740},
		{1045, 690},
		{1074, 636},
		{1103, 583},
		{1136, 512},
		{1169, 450},
		{1190, 380},
		{1215, 293},
		{1236, 211},
		{1244, 128},
		{1252, 58},
		{1260, 0}
	},
	[8] = {
		{0   , 1124},
		{83  , 1169},
		{161 , 1223},
		{256 , 1277},
		{364 , 1347},
		{459 , 1409},
		{587 , 1492},
		{661 , 1558},
		{744 , 1636},
		{847 , 1694},
		{930 , 1694},
		{975 , 1645},
		{996 , 1591},
		{1004, 1550},
		{983 , 1483},
		{950 , 1376},
		{934 , 1289},
		{942 , 1194},
		{967 , 1103},
		{1029, 1012},
		{1095, 909},
		{1145, 831},
		{1198, 740},
		{1244, 649},
		{1289, 550},
		{1314, 496},
		{1351, 393},
		{1384, 248},
		{1401, 145},
		{1417, 0}
	},
	[6] = {
		{0   , 1339},
		{62  , 1393},
		{120 , 1438},
		{202 , 1500},
		{273 , 1554},
		{364 , 1624},
		{434 , 1682},
		{500 , 1740},
		{595 , 1822},
		{686 , 1893},
		{777 , 1959},
		{888 , 2012},
		{979 , 2017},
		{1041, 1988},
		{1083, 1926},
		{1095, 1843},
		{1079, 1756},
		{1054, 1669},
		{1025, 1570},
		{1025, 1508},
		{1033, 1450},
		{1074, 1360},
		{1145, 1240},
		{1227, 1132},
		{1310, 1008},
		{1368, 926},
		{1421, 847},
		{1488, 723},
		{1537, 603},
		{1570, 512},
		{1570, 492},
		{1603, 384},
		{1628, 256},
		{1645, 124},
		{1653, 37},
		{1653, 0}
	},
	[4] = {
		{0   , 1665},
		{37  , 1702},
		{87  , 1764},
		{153 , 1847},
		{244 , 1946},
		{331 , 2045},
		{421 , 2136},
		{529 , 2244},
		{661 , 2364},
		{777 , 2459},
		{905 , 2554},
		{988 , 2599},
		{1070, 2624},
		{1132, 2620},
		{1186, 2591},
		{1231, 2512},
		{1240, 2438},
		{1223, 2331},
		{1198, 2227},
		{1182, 2153},
		{1174, 2050},
		{1194, 1942},
		{1260, 1798},
		{1326, 1686},
		{1413, 1570},
		{1521, 1426},
		{1612, 1310},
		{1694, 1182},
		{1781, 1058},
		{1860, 926},
		{1913, 810},
		{1971, 657},
		{2017, 496},
		{2050, 343},
		{2074, 182},
		{2087, 62},
		{2087, 0}
	},
	[2] = {
		{0   , 2558},
		{25  , 2616},
		{58  , 2682},
		{136 , 2847},
		{186 , 2942},
		{227 , 3033},
		{293 , 3136},
		{368 , 3281},
		{434 , 3380},
		{479 , 3467},
		{529 , 3545},
		{591 , 3632},
		{632 , 3702},
		{686 , 3781},
		{740 , 3868},
		{798 , 3942},
		{851 , 4021},
		{921 , 4099},
		{1017, 4182},
		{1099, 4207},
		{1198, 4182},
		{1264, 4136},
		{1318, 4079},
		{1372, 3992},
		{1413, 3901},
		{1430, 3777},
		{1429, 3649},
		{1421, 3525},
		{1422, 3401},
		{1438, 3264},
		{1508, 3116},
		{1587, 3000},
		{1702, 2876},
		{1818, 2752},
		{1988, 2579},
		{2190, 2364},
		{2302, 2236},
		{2426, 2091},
		{2492, 2000},
		{2517, 1971},
		{2612, 1839},
		{2698, 1707},
		{2793, 1537},
		{2893, 1351},
		{2971, 1161},
		{3041, 950},
		{3079, 793},
		{3103, 682},
		{3136, 545},
		{3157, 442},
		{3178, 302},
		{3190, 182},
		{3202, 70},
		{3211, 0}
	},
	[1] = {
		{0   , 3860},
		{58  , 3996},
		{140 , 4248},
		{219 , 4475},
		{322 , 4744},
		{405 , 4996},
		{496 , 5236},
		{579 , 5471},
		{678 , 5719},
		{810 , 6037},
		{888 , 6219},
		{971 , 6397},
		{1083, 6583},
		{1165, 6715},
		{1260, 6835},
		{1388, 6946},
		{1533, 7021},
		{1665, 7021},
		{1727, 6979},
		{1802, 6872},
		{1864, 6698},
		{1888, 6512},
		{1913, 6256},
		{1921, 6021},
		{1922, 5781},
		{1938, 5558},
		{2004, 5364},
		{2140, 5149},
		{2355, 4913},
		{2512, 4756},
		{2785, 4508},
		{3012, 4293},
		{3211, 4107},
		{3335, 3975},
		{3525, 3785},
		{3702, 3591},
		{3764, 3508},
		{3909, 3343},
		{4017, 3207},
		{4157, 3008},
		{4236, 2884},
		{4318, 2756},
		{4409, 2612},
		{4463, 2500},
		{4521, 2405},
		{4632, 2157},
		{4702, 2008},
		{4781, 1764},
		{4860, 1504},
		{4897, 1335},
		{4934, 1149},
		{4963, 942},
		{4992, 760},
		{5012, 612},
		{5008, 599},
		{5070, 0}
	}
}

return const