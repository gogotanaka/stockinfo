require 'open-uri'
require 'kconv'

class BatchUpdate

  SC_OK = "200"

  def self.execute
    codes = ["1301", "1332", "1334", "1352", "1376", "1377", "1378", "1379", "1380", "1381", "1382", "1383", "1400", "1401", "1405", "1407", "1408", "1412", "1413", "1414", "1417", "1418", "1491", "1514", "1515", "1518", "1605", "1606", "1661", "1662", "1702", "1711", "1712", "1716", "1717", "1718", "1719", "1720", "1721", "1722", "1723", "1724", "1726", "1728", "1730", "1734", "1736", "1737", "1738", "1739", "1743", "1757", "1758", "1762", "1764", "1766", "1768", "1770", "1771", "1773", "1775", "1776", "1777", "1780", "1782", "1783", "1787", "1788", "1789", "1793", "1795", "1798", "1799", "1801", "1802", "1803", "1805", "1807", "1808", "1810", "1811", "1812", "1813", "1814", "1815", "1816", "1819", "1820", "1821", "1822", "1824", "1826", "1827", "1828", "1832", "1833", "1834", "1835", "1840", "1841", "1844", "1846", "1847", "1848", "1850", "1852", "1853", "1860", "1861", "1865", "1866", "1867", "1868", "1869", "1870", "1871", "1873", "1875", "1878", "1879", "1881", "1882", "1883", "1884", "1885", "1888", "1890", "1892", "1893", "1896", "1897", "1898", "1899", "1904", "1905", "1906", "1909", "1911", "1914", "1916", "1919", "1921", "1924", "1925", "1926", "1928", "1929", "1930", "1931", "1933", "1934", "1935", "1936", "1937", "1938", "1939", "1941", "1942", "1944", "1945", "1946", "1948", "1949", "1950", "1951", "1952", "1954", "1956", "1959", "1960", "1961", "1963", "1964", "1965", "1966", "1967", "1968", "1969", "1971", "1972", "1973", "1975", "1976", "1978", "1979", "1980", "1981", "1982", "1983", "1984", "1987", "1989", "1992", "1994", "1997", "1999", "2001", "2002", "2003", "2004", "2006", "2008", "2009", "2052", "2053", "2055", "2056", "2058", "2107", "2108", "2109", "2112", "2114", "2117", "2120", "2121", "2122", "2124", "2127", "2128", "2130", "2131", "2132", "2134", "2136", "2137", "2138", "2139", "2140", "2144", "2145", "2146", "2148", "2150", "2151", "2152", "2153", "2154", "2155", "2156", "2157", "2158", "2159", "2160", "2162", "2163", "2164", "2165", "2166", "2168", "2169", "2170", "2172", "2173", "2174", "2175", "2176", "2177", "2178", "2179", "2180", "2181", "2182", "2183", "2185", "2186", "2190", "2191", "2193", "2195", "2196", "2198", "2201", "2204", "2206", "2207", "2208", "2209", "2211", "2212", "2215", "2216", "2217", "2218", "2220", "2221", "2222", "2224", "2226", "2228", "2229", "2264", "2266", "2267", "2268", "2269", "2270", "2281", "2282", "2284", "2286", "2288", "2289", "2290", "2291", "2292", "2293", "2294", "2300", "2301", "2303", "2304", "2305", "2307", "2309", "2311", "2315", "2317", "2318", "2321", "2322", "2323", "2325", "2326", "2327", "2329", "2330", "2331", "2332", "2335", "2337", "2338", "2340", "2341", "2342", "2344", "2345", "2349", "2351", "2352", "2353", "2354", "2355", "2359", "2362", "2369", "2370", "2371", "2372", "2373", "2374", "2375", "2376", "2378", "2379", "2384", "2385", "2388", "2389", "2391", "2393", "2395", "2397", "2398", "2399", "2400", "2402", "2404", "2405", "2406", "2408", "2409", "2410", "2411", "2412", "2413", "2415", "2417", "2418", "2419", "2423", "2425", "2426", "2427", "2428", "2429", "2432", "2433", "2434", "2435", "2436", "2437", "2438", "2440", "2444", "2445", "2447", "2449", "2450", "2451", "2453", "2454", "2458", "2459", "2461", "2462", "2464", "2466", "2467", "2468", "2469", "2471", "2475", "2477", "2478", "2479", "2480", "2481", "2483", "2484", "2485", "2487", "2488", "2489", "2491", "2492", "2493", "2494", "2495", "2496", "2497", "2498", "2499", "2501", "2502", "2503", "2531", "2533", "2538", "2540", "2551", "2572", "2573", "2579", "2580", "2590", "2593", "2594", "2597", "2599", "2602", "2607", "2608", "2611", "2612", "2613", "2651", "2652", "2653", "2654", "2655", "2656", "2657", "2658", "2659", "2660", "2662", "2664", "2665", "2666", "2667", "2668", "2669", "2670", "2673", "2674", "2675", "2676", "2678", "2681", "2683", "2684", "2685", "2686", "2687", "2689", "2692", "2693", "2694", "2695", "2698", "2700", "2702", "2703", "2705", "2706", "2708", "2710", "2712", "2714", "2715", "2719", "2721", "2722", "2724", "2726", "2729", "2730", "2733", "2734", "2735", "2736", "2737", "2738", "2742", "2743", "2744", "2747", "2749", "2750", "2751", "2752", "2753", "2754", "2757", "2759", "2760", "2761", "2762", "2763", "2764", "2766", "2767", "2768", "2769", "2772", "2773", "2776", "2777", "2778", "2780", "2782", "2784", "2786", "2788", "2789", "2790", "2791", "2792", "2795", "2796", "2798", "2799", "2801", "2802", "2804", "2805", "2806", "2809", "2810", "2811", "2812", "2813", "2814", "2815", "2816", "2817", "2818", "2819", "2830", "2831", "2871", "2872", "2874", "2875", "2876", "2877", "2882", "2892", "2893", "2894", "2897", "2898", "2899", "2901", "2902", "2903", "2904", "2905", "2906", "2907", "2908", "2910", "2911", "2912", "2914", "2915", "2916", "2917", "2918", "2919", "2922", "2923", "2924", "2925", "2926", "2927", "2928", "2929", "3001", "3002", "3003", "3004", "3010", "3011", "3020", "3021", "3022", "3023", "3024", "3027", "3028", "3030", "3031", "3032", "3034", "3035", "3036", "3037", "3038", "3040", "3041", "3042", "3043", "3045", "3046", "3047", "3048", "3050", "3053", "3054", "3055", "3057", "3058", "3059", "3060", "3061", "3063", "3064", "3065", "3066", "3067", "3068", "3069", "3070", "3071", "3073", "3075", "3076", "3077", "3079", "3080", "3082", "3083", "3085", "3086", "3087", "3088", "3089", "3090", "3091", "3092", "3093", "3094", "3096", "3097", "3098", "3099", "3101", "3103", "3104", "3105", "3106", "3107", "3109", "3110", "3111", "3113", "3116", "3121", "3123", "3125", "3128", "3140", "3141", "3143", "3146", "3147", "3148", "3150", "3151", "3153", "3154", "3156", "3157", "3159", "3160", "3161", "3163", "3165", "3166", "3167", "3168", "3201", "3202", "3204", "3205", "3209", "3225", "3228", "3230", "3231", "3232", "3235", "3236", "3237", "3238", "3241", "3242", "3243", "3244", "3245", "3246", "3248", "3250", "3251", "3252", "3254", "3258", "3260", "3264", "3265", "3266", "3268", "3271", "3272", "3274", "3275", "3276", "3277", "3302", "3306", "3311", "3313", "3315", "3316", "3317", "3318", "3319", "3320", "3321", "3322", "3323", "3325", "3326", "3328", "3329", "3331", "3332", "3333", "3335", "3337", "3341", "3343", "3344", "3346", "3347", "3349", "3350", "3352", "3353", "3355", "3356", "3358", "3359", "3360", "3361", "3366", "3370", "3371", "3372", "3374", "3375", "3376", "3377", "3381", "3382", "3383", "3384", "3385", "3386", "3387", "3388", "3390", "3391", "3392", "3393", "3394", "3395", "3396", "3397", "3398", "3399", "3401", "3402", "3405", "3407", "3408", "3409", "3411", "3420", "3421", "3422", "3423", "3424", "3426", "3431", "3432", "3433", "3434", "3435", "3436", "3437", "3439", "3440", "3441", "3442", "3443", "3444", "3501", "3512", "3513", "3514", "3515", "3521", "3524", "3526", "3528", "3529", "3551", "3553", "3569", "3571", "3577", "3578", "3580", "3583", "3587", "3591", "3593", "3597", "3598", "3599", "3600", "3604", "3606", "3607", "3608", "3620", "3622", "3623", "3624", "3625", "3626", "3627", "3628", "3629", "3630", "3632", "3633", "3634", "3635", "3636", "3639", "3640", "3641", "3644", "3645", "3646", "3647", "3648", "3649", "3652", "3653", "3654", "3655", "3656", "3657", "3658", "3659", "3708", "3710", "3711", "3712", "3715", "3719", "3722", "3723", "3724", "3726", "3727", "3730", "3731", "3733", "3734", "3738", "3739", "3741", "3742", "3744", "3747", "3750", "3751", "3752", "3753", "3754", "3756", "3758", "3760", "3762", "3763", "3765", "3766", "3768", "3769", "3770", "3771", "3772", "3773", "3774", "3775", "3776", "3777", "3778", "3779", "3782", "3783", "3784", "3785", "3787", "3788", "3789", "3790", "3791", "3793", "3794", "3796", "3798", "3799", "3800", "3802", "3803", "3804", "3807", "3808", "3810", "3811", "3812", "3814", "3815", "3816", "3817", "3820", "3822", "3823", "3824", "3825", "3826", "3827", "3828", "3829", "3830", "3831", "3832", "3834", "3835", "3836", "3837", "3839", "3840", "3841", "3842", "3843", "3844", "3845", "3846", "3847", "3848", "3849", "3850", "3851", "3852", "3853", "3854", "3856", "3857", "3858", "3859", "3861", "3864", "3865", "3877", "3878", "3880", "3891", "3892", "3893", "3895", "3941", "3943", "3944", "3945", "3946", "3947", "3948", "3950", "3951", "3952", "3953", "3954", "3955", "3956", "4003", "4004", "4005", "4007", "4008", "4021", "4022", "4023", "4025", "4026", "4027", "4028", "4031", "4033", "4041", "4042", "4043", "4044", "4045", "4046", "4047", "4061", "4062", "4063", "4064", "4078", "4080", "4082", "4088", "4091", "4092", "4093", "4094", "4095", "4097", "4098", "4099", "4100", "4102", "4107", "4109", "4112", "4113", "4114", "4115", "4116", "4117", "4118", "4119", "4120", "4151", "4182", "4183", "4185", "4186", "4187", "4188", "4201", "4202", "4203", "4204", "4205", "4206", "4208", "4212", "4215", "4216", "4217", "4218", "4220", "4221", "4222", "4224", "4228", "4229", "4231", "4233", "4234", "4235", "4237", "4238", "4239", "4240", "4241", "4242", "4243", "4244", "4271", "4272", "4274", "4281", "4282", "4283", "4284", "4286", "4287", "4288", "4290", "4291", "4293", "4295", "4298", "4299", "4301", "4304", "4305", "4306", "4307", "4308", "4309", "4310", "4312", "4316", "4317", "4318", "4319", "4320", "4321", "4323", "4324", "4326", "4327", "4330", "4331", "4333", "4334", "4335", "4336", "4337", "4339", "4340", "4341", "4342", "4343", "4344", "4345", "4346", "4347", "4348", "4349", "4350", "4351", "4352", "4355", "4356", "4358", "4361", "4362", "4364", "4365", "4366", "4367", "4368", "4369", "4401", "4403", "4404", "4406", "4409", "4410", "4452", "4461", "4462", "4463", "4464", "4465", "4471", "4502", "4503", "4506", "4507", "4508", "4512", "4514", "4516", "4517", "4519", "4521", "4523", "4524", "4526", "4527", "4528", "4530", "4531", "4534", "4536", "4538", "4539", "4540", "4541", "4543", "4544", "4547", "4548", "4549", "4550", "4551", "4552", "4553", "4554", "4555", "4556", "4557", "4558", "4559", "4563", "4564", "4565", "4567", "4568", "4569", "4570", "4571", "4572", "4573", "4574", "4575", "4576", "4577", "4578", "4579", "4581", "4582", "4611", "4612", "4613", "4614", "4615", "4616", "4617", "4619", "4620", "4621", "4623", "4624", "4625", "4626", "4627", "4628", "4629", "4631", "4633", "4634", "4635", "4636", "4640", "4641", "4642", "4644", "4645", "4649", "4650", "4651", "4653", "4654", "4656", "4657", "4658", "4659", "4661", "4662", "4664", "4665", "4666", "4667", "4668", "4669", "4671", "4673", "4674", "4676", "4678", "4679", "4680", "4681", "4684", "4685", "4686", "4687", "4689", "4690", "4694", "4695", "4696", "4699", "4704", "4705", "4707", "4708", "4709", "4711", "4712", "4713", "4714", "4716", "4718", "4719", "4720", "4722", "4724", "4725", "4726", "4728", "4732", "4733", "4734", "4735", "4736", "4738", "4739", "4743", "4744", "4745", "4746", "4747", "4748", "4750", "4751", "4752", "4754", "4755", "4760", "4761", "4762", "4763", "4764", "4765", "4766", "4767", "4768", "4769", "4770", "4771", "4772", "4775", "4776", "4777", "4779", "4781", "4783", "4784", "4792", "4793", "4798", "4799", "4800", "4801", "4809", "4812", "4813", "4814", "4816", "4817", "4819", "4820", "4824", "4825", "4826", "4827", "4828", "4829", "4832", "4833", "4834", "4835", "4837", "4838", "4839", "4840", "4842", "4845", "4847", "4848", "4849", "4850", "4875", "4901", "4902", "4911", "4912", "4914", "4917", "4918", "4919", "4920", "4921", "4922", "4923", "4924", "4925", "4926", "4927", "4928", "4951", "4952", "4955", "4956", "4957", "4958", "4960", "4962", "4963", "4965", "4966", "4967", "4968", "4970", "4971", "4972", "4973", "4974", "4975", "4976", "4985", "4987", "4989", "4990", "4992", "4994", "4995", "4996", "4997", "4998", "4999", "5002", "5007", "5008", "5009", "5010", "5011", "5012", "5013", "5015", "5017", "5018", "5019", "5020", "5101", "5103", "5104", "5105", "5108", "5110", "5121", "5122", "5142", "5161", "5162", "5184", "5185", "5186", "5187", "5189", "5191", "5192", "5194", "5195", "5196", "5199", "5201", "5202", "5204", "5208", "5210", "5212", "5214", "5216", "5217", "5218", "5232", "5233", "5234", "5237", "5261", "5262", "5268", "5269", "5271", "5273", "5276", "5277", "5279", "5280", "5282", "5283", "5284", "5285", "5287", "5288", "5289", "5301", "5302", "5304", "5310", "5331", "5332", "5333", "5334", "5337", "5341", "5342", "5343", "5344", "5351", "5352", "5355", "5356", "5357", "5358", "5363", "5367", "5380", "5381", "5384", "5386", "5387", "5388", "5389", "5390", "5391", "5393", "5395", "5398", "5401", "5405", "5406", "5407", "5408", "5410", "5411", "5412", "5423", "5440", "5444", "5445", "5446", "5448", "5449", "5451", "5453", "5456", "5457", "5458", "5461", "5463", "5464", "5471", "5476", "5479", "5480", "5481", "5482", "5484", "5486", "5491", "5541", "5542", "5563", "5566", "5602", "5603", "5605", "5606", "5607", "5609", "5610", "5612", "5614", "5631", "5632", "5641", "5644", "5657", "5658", "5659", "5660", "5695", "5697", "5701", "5702", "5706", "5707", "5711", "5713", "5714", "5715", "5721", "5724", "5726", "5727", "5729", "5738", "5741", "5742", "5753", "5757", "5758", "5781", "5801", "5802", "5803", "5805", "5807", "5809", "5812", "5815", "5816", "5817", "5819", "5820", "5821", "5851", "5852", "5856", "5857", "5900", "5901", "5902", "5903", "5905", "5906", "5907", "5909", "5911", "5912", "5915", "5917", "5918", "5921", "5922", "5923", "5928", "5929", "5930", "5933", "5935", "5936", "5938", "5939", "5940", "5941", "5942", "5943", "5945", "5946", "5947", "5949", "5950", "5951", "5952", "5953", "5954", "5955", "5956", "5957", "5958", "5959", "5962", "5963", "5964", "5965", "5966", "5967", "5969", "5970", "5971", "5973", "5974", "5975", "5976", "5979", "5981", "5982", "5983", "5984", "5985", "5986", "5987", "5988", "5989", "5990", "5991", "5992", "5993", "5994", "5995", "5996", "5997", "5998", "5999", "6005", "6013", "6016", "6018", "6022", "6023", "6042", "6050", "6051", "6052", "6053", "6054", "6055", "6101", "6103", "6104", "6111", "6112", "6113", "6118", "6121", "6125", "6131", "6134", "6135", "6136", "6137", "6138", "6140", "6141", "6142", "6143", "6144", "6145", "6146", "6147", "6149", "6150", "6151", "6155", "6156", "6157", "6158", "6159", "6161", "6163", "6164", "6201", "6203", "6205", "6208", "6210", "6217", "6218", "6222", "6245", "6246", "6247", "6249", "6250", "6252", "6254", "6255", "6256", "6257", "6258", "6259", "6260", "6262", "6264", "6265", "6266", "6267", "6268", "6269", "6271", "6272", "6273", "6274", "6276", "6277", "6278", "6279", "6280", "6281", "6282", "6284", "6286", "6287", "6289", "6291", "6292", "6293", "6294", "6295", "6297", "6298", "6299", "6300", "6301", "6302", "6303", "6305", "6306", "6307", "6309", "6310", "6312", "6314", "6315", "6316", "6317", "6319", "6321", "6322", "6323", "6324", "6325", "6326", "6327", "6328", "6330", "6331", "6332", "6333", "6334", "6335", "6336", "6337", "6338", "6339", "6340", "6342", "6343", "6345", "6346", "6347", "6349", "6351", "6352", "6355", "6356", "6357", "6358", "6360", "6361", "6362", "6363", "6364", "6365", "6366", "6367", "6368", "6369", "6370", "6371", "6373", "6375", "6376", "6378", "6379", "6380", "6381", "6382", "6383", "6384", "6387", "6390", "6391", "6392", "6393", "6395", "6396", "6397", "6400", "6401", "6402", "6403", "6405", "6406", "6407", "6408", "6409", "6411", "6412", "6413", "6414", "6416", "6417", "6418", "6419", "6420", "6424", "6425", "6428", "6430", "6432", "6433", "6436", "6437", "6439", "6440", "6443", "6444", "6445", "6448", "6454", "6455", "6457", "6458", "6459", "6460", "6461", "6462", "6463", "6465", "6466", "6467", "6469", "6470", "6471", "6472", "6473", "6474", "6476", "6478", "6479", "6480", "6481", "6482", "6484", "6485", "6486", "6487", "6488", "6489", "6490", "6492", "6493", "6494", "6495", "6496", "6497", "6498", "6501", "6502", "6503", "6504", "6505", "6506", "6507", "6508", "6513", "6516", "6517", "6518", "6581", "6584", "6586", "6588", "6590", "6591", "6592", "6593", "6594", "6619", "6620", "6621", "6622", "6623", "6624", "6625", "6626", "6627", "6628", "6629", "6630", "6632", "6633", "6634", "6635", "6636", "6637", "6638", "6639", "6640", "6641", "6643", "6644", "6645", "6646", "6647", "6648", "6651", "6652", "6653", "6654", "6655", "6656", "6657", "6658", "6659", "6661", "6662", "6663", "6664", "6665", "6666", "6667", "6668", "6669", "6670", "6674", "6675", "6676", "6677", "6678", "6701", "6702", "6703", "6704", "6706", "6707", "6709", "6715", "6716", "6718", "6719", "6721", "6722", "6723", "6724", "6727", "6728", "6730", "6731", "6734", "6736", "6737", "6741", "6742", "6743", "6744", "6745", "6747", "6748", "6750", "6751", "6752", "6753", "6754", "6755", "6756", "6757", "6758", "6762", "6763", "6767", "6768", "6769", "6770", "6771", "6772", "6773", "6775", "6776", "6777", "6778", "6779", "6784", "6785", "6786", "6787", "6788", "6789", "6790", "6791", "6793", "6794", "6796", "6797", "6798", "6800", "6801", "6803", "6804", "6806", "6807", "6809", "6814", "6815", "6816", "6817", "6819", "6820", "6822", "6823", "6824", "6826", "6832", "6833", "6834", "6835", "6836", "6837", "6838", "6839", "6840", "6841", "6842", "6844", "6845", "6846", "6848", "6849", "6850", "6852", "6853", "6855", "6856", "6857", "6858", "6859", "6860", "6861", "6862", "6863", "6864", "6866", "6867", "6868", "6869", "6870", "6871", "6874", "6875", "6877", "6878", "6879", "6881", "6882", "6883", "6885", "6888", "6889", "6890", "6891", "6894", "6895", "6896", "6897", "6898", "6899", "6900", "6901", "6902", "6904", "6905", "6907", "6908", "6910", "6911", "6912", "6914", "6915", "6916", "6918", "6919", "6920", "6921", "6922", "6923", "6924", "6925", "6926", "6927", "6928", "6929", "6930", "6932", "6934", "6935", "6937", "6938", "6941", "6942", "6943", "6944", "6945", "6946", "6947", "6950", "6951", "6952", "6954", "6955", "6957", "6958", "6960", "6961", "6962", "6963", "6964", "6965", "6966", "6967", "6969", "6971", "6972", "6973", "6974", "6976", "6977", "6981", "6982", "6985", "6986", "6988", "6989", "6992", "6993", "6994", "6995", "6996", "6997", "6998", "6999", "7003", "7004", "7007", "7011", "7012", "7013", "7014", "7018", "7021", "7022", "7102", "7105", "7122", "7148", "7150", "7201", "7202", "7203", "7205", "7208", "7211", "7212", "7213", "7214", "7217", "7218", "7219", "7220", "7221", "7222", "7223", "7224", "7226", "7227", "7228", "7229", "7230", "7231", "7233", "7235", "7236", "7238", "7239", "7240", "7241", "7242", "7243", "7244", "7245", "7246", "7247", "7248", "7249", "7250", "7251", "7254", "7255", "7256", "7259", "7260", "7261", "7262", "7263", "7264", "7265", "7266", "7267", "7268", "7269", "7270", "7271", "7272", "7273", "7274", "7276", "7277", "7278", "7279", "7280", "7282", "7283", "7284", "7287", "7291", "7292", "7294", "7296", "7297", "7298", "7299", "7305", "7308", "7309", "7311", "7312", "7313", "7314", "7399", "7404", "7408", "7412", "7413", "7414", "7415", "7416", "7417", "7419", "7420", "7421", "7422", "7425", "7426", "7427", "7430", "7432", "7433", "7434", "7435", "7438", "7441", "7442", "7443", "7444", "7445", "7446", "7447", "7448", "7450", "7451", "7452", "7453", "7455", "7456", "7458", "7459", "7460", "7461", "7462", "7463", "7464", "7465", "7466", "7467", "7468", "7472", "7474", "7475", "7476", "7477", "7480", "7481", "7482", "7483", "7485", "7486", "7487", "7488", "7490", "7491", "7493", "7494", "7500", "7501", "7502", "7503", "7504", "7505", "7506", "7508", "7509", "7510", "7512", "7513", "7514", "7515", "7516", "7517", "7518", "7519", "7520", "7521", "7522", "7523", "7524", "7525", "7527", "7530", "7531", "7532", "7533", "7535", "7537", "7538", "7539", "7541", "7544", "7545", "7550", "7551", "7552", "7554", "7555", "7558", "7559", "7561", "7562", "7563", "7564", "7565", "7566", "7567", "7568", "7569", "7570", "7571", "7575", "7577", "7578", "7581", "7585", "7587", "7590", "7591", "7593", "7594", "7595", "7596", "7597", "7598", "7599", "7600", "7601", "7602", "7603", "7604", "7605", "7606", "7607", "7608", "7609", "7610", "7611", "7612", "7613", "7614", "7615", "7616", "7618", "7619", "7620", "7621", "7622", "7623", "7624", "7625", "7628", "7630", "7631", "7634", "7635", "7636", "7637", "7638", "7640", "7643", "7644", "7646", "7647", "7648", "7649", "7701", "7702", "7703", "7705", "7707", "7708", "7709", "7711", "7713", "7714", "7715", "7716", "7717", "7718", "7719", "7721", "7722", "7723", "7725", "7726", "7727", "7728", "7729", "7730", "7731", "7732", "7733", "7734", "7735", "7739", "7740", "7741", "7743", "7744", "7745", "7746", "7747", "7748", "7749", "7751", "7752", "7756", "7757", "7758", "7760", "7762", "7768", "7769", "7771", "7774", "7775", "7776", "7777", "7817", "7818", "7819", "7820", "7821", "7822", "7823", "7824", "7825", "7826", "7827", "7829", "7831", "7832", "7833", "7834", "7835", "7836", "7837", "7838", "7839", "7840", "7841", "7844", "7846", "7847", "7849", "7850", "7851", "7853", "7855", "7856", "7857", "7858", "7859", "7860", "7861", "7862", "7863", "7864", "7865", "7867", "7868", "7869", "7870", "7871", "7872", "7873", "7874", "7875", "7877", "7878", "7879", "7883", "7885", "7886", "7887", "7888", "7889", "7890", "7891", "7893", "7894", "7895", "7896", "7897", "7898", "7899", "7901", "7902", "7903", "7904", "7905", "7906", "7907", "7908", "7911", "7912", "7913", "7914", "7915", "7916", "7917", "7918", "7919", "7920", "7921", "7922", "7923", "7925", "7927", "7928", "7931", "7932", "7936", "7937", "7938", "7939", "7942", "7943", "7944", "7945", "7946", "7947", "7949", "7950", "7951", "7952", "7953", "7954", "7955", "7956", "7957", "7958", "7959", "7961", "7962", "7963", "7965", "7966", "7968", "7970", "7971", "7972", "7974", "7975", "7976", "7979", "7980", "7981", "7983", "7984", "7985", "7986", "7987", "7988", "7989", "7990", "7991", "7992", "7994", "7995", "7997", "7999", "8000", "8001", "8002", "8005", "8006", "8007", "8008", "8011", "8012", "8013", "8014", "8015", "8016", "8018", "8020", "8022", "8023", "8025", "8028", "8029", "8030", "8031", "8032", "8035", "8036", "8037", "8038", "8039", "8040", "8041", "8043", "8044", "8045", "8046", "8050", "8051", "8052", "8053", "8056", "8057", "8058", "8059", "8060", "8061", "8065", "8066", "8068", "8070", "8071", "8072", "8073", "8074", "8075", "8076", "8077", "8078", "8079", "8080", "8081", "8084", "8085", "8086", "8087", "8088", "8089", "8090", "8091", "8093", "8095", "8096", "8097", "8098", "8101", "8103", "8104", "8105", "8107", "8108", "8111", "8113", "8114", "8115", "8117", "8118", "8119", "8120", "8123", "8125", "8127", "8129", "8130", "8131", "8132", "8133", "8135", "8136", "8137", "8138", "8139", "8140", "8141", "8142", "8143", "8144", "8145", "8147", "8148", "8150", "8151", "8152", "8153", "8154", "8155", "8157", "8158", "8159", "8160", "8163", "8165", "8166", "8167", "8168", "8170", "8171", "8173", "8174", "8175", "8178", "8179", "8181", "8182", "8184", "8185", "8186", "8190", "8191", "8193", "8194", "8196", "8198", "8200", "8201", "8202", "8203", "8205", "8207", "8208", "8209", "8214", "8215", "8217", "8218", "8219", "8225", "8226", "8227", "8228", "8229", "8230", "8233", "8237", "8242", "8244", "8245", "8247", "8248", "8249", "8251", "8252", "8253", "8254", "8255", "8256", "8257", "8260", "8263", "8266", "8267", "8270", "8273", "8274", "8275", "8276", "8278", "8279", "8281", "8282", "8283", "8285", "8287", "8289", "8291", "8293", "8298", "8301", "8303", "8304", "8306", "8308", "8309", "8316", "8324", "8325", "8327", "8328", "8331", "8332", "8333", "8334", "8336", "8337", "8338", "8339", "8341", "8342", "8343", "8344", "8345", "8346", "8349", "8350", "8354", "8355", "8356", "8358", "8359", "8360", "8361", "8362", "8363", "8364", "8365", "8366", "8367", "8368", "8369", "8374", "8377", "8379", "8381", "8382", "8383", "8385", "8386", "8387", "8388", "8390", "8392", "8393", "8394", "8395", "8396", "8397", "8398", "8399", "8409", "8410", "8411", "8415", "8416", "8418", "8423", "8424", "8425", "8426", "8439", "8462", "8473", "8508", "8511", "8512", "8513", "8514", "8515", "8518", "8519", "8520", "8521", "8522", "8527", "8529", "8530", "8536", "8537", "8540", "8541", "8542", "8543", "8544", "8545", "8550", "8551", "8554", "8558", "8559", "8560", "8562", "8563", "8566", "8570", "8571", "8572", "8574", "8584", "8585", "8586", "8589", "8591", "8593", "8594", "8595", "8596", "8600", "8601", "8604", "8609", "8613", "8614", "8616", "8617", "8622", "8624", "8625", "8628", "8630", "8634", "8648", "8681", "8682", "8685", "8686", "8692", "8697", "8698", "8699", "8700", "8702", "8703", "8704", "8705", "8706", "8707", "8708", "8709", "8710", "8711", "8713", "8714", "8715", "8718", "8725", "8728", "8729", "8732", "8734", "8737", "8738", "8739", "8740", "8742", "8746", "8747", "8749", "8750", "8766", "8767", "8769", "8771", "8772", "8783", "8787", "8789", "8793", "8795", "8798", "8801", "8802", "8803", "8804", "8806", "8809", "8810", "8815", "8818", "8821", "8830", "8833", "8835", "8836", "8840", "8841", "8842", "8844", "8848", "8850", "8851", "8854", "8860", "8864", "8869", "8870", "8871", "8875", "8876", "8877", "8879", "8880", "8881", "8885", "8886", "8887", "8889", "8890", "8891", "8892", "8893", "8894", "8895", "8897", "8898", "8903", "8904", "8905", "8907", "8908", "8909", "8912", "8914", "8915", "8917", "8918", "8919", "8920", "8922", "8923", "8925", "8927", "8928", "8929", "8931", "8933", "8934", "8935", "8938", "8940", "8944", "8945", "8946", "8992", "8995", "8996", "8998", "8999", "9001", "9003", "9005", "9006", "9007", "9008", "9009", "9010", "9012", "9014", "9017", "9020", "9021", "9022", "9027", "9028", "9029", "9031", "9033", "9034", "9035", "9036", "9037", "9039", "9040", "9041", "9042", "9044", "9045", "9046", "9047", "9048", "9049", "9051", "9052", "9055", "9056", "9057", "9058", "9059", "9060", "9062", "9063", "9064", "9065", "9066", "9067", "9068", "9069", "9070", "9072", "9073", "9074", "9075", "9076", "9077", "9078", "9081", "9082", "9083", "9085", "9086", "9087", "9101", "9104", "9107", "9110", "9113", "9115", "9119", "9127", "9130", "9132", "9133", "9171", "9173", "9176", "9179", "9180", "9193", "9202", "9204", "9232", "9233", "9234", "9301", "9302", "9303", "9304", "9305", "9306", "9307", "9308", "9310", "9311", "9312", "9313", "9317", "9318", "9319", "9320", "9322", "9324", "9351", "9353", "9355", "9357", "9358", "9359", "9360", "9361", "9362", "9363", "9364", "9365", "9366", "9367", "9368", "9369", "9370", "9373", "9375", "9376", "9377", "9378", "9380", "9381", "9382", "9384", "9385", "9399", "9401", "9402", "9404", "9405", "9407", "9408", "9409", "9412", "9413", "9421", "9422", "9423", "9424", "9425", "9427", "9428", "9430", "9432", "9433", "9435", "9436", "9437", "9438", "9439", "9441", "9444", "9445", "9446", "9449", "9470", "9471", "9474", "9475", "9476", "9477", "9478", "9479", "9481", "9501", "9502", "9503", "9504", "9505", "9506", "9507", "9508", "9509", "9511", "9513", "9514", "9531", "9532", "9533", "9534", "9535", "9536", "9537", "9539", "9540", "9541", "9542", "9543", "9544", "9600", "9601", "9602", "9603", "9605", "9607", "9608", "9610", "9612", "9613", "9616", "9619", "9621", "9622", "9624", "9625", "9627", "9628", "9629", "9630", "9631", "9632", "9633", "9635", "9636", "9637", "9638", "9639", "9640", "9641", "9643", "9644", "9647", "9648", "9651", "9652", "9656", "9657", "9658", "9661", "9663", "9664", "9667", "9671", "9672", "9674", "9675", "9678", "9679", "9680", "9681", "9682", "9684", "9685", "9686", "9687", "9691", "9692", "9695", "9696", "9697", "9698", "9699", "9701", "9702", "9704", "9706", "9707", "9708", "9709", "9713", "9715", "9716", "9717", "9719", "9720", "9722", "9723", "9726", "9728", "9729", "9730", "9731", "9733", "9734", "9735", "9736", "9739", "9740", "9742", "9743", "9744", "9746", "9747", "9748", "9749", "9753", "9755", "9757", "9758", "9759", "9760", "9761", "9763", "9764", "9765", "9766", "9767", "9768", "9769", "9776", "9778", "9780", "9782", "9783", "9787", "9788", "9790", "9791", "9792", "9793", "9794", "9795", "9797", "9799", "9810", "9812", "9814", "9816", "9818", "9819", "9820", "9822", "9823", "9824", "9826", "9827", "9828", "9829", "9830", "9831", "9832", "9835", "9836", "9837", "9838", "9842", "9843", "9845", "9846", "9849", "9850", "9852", "9853", "9854", "9855", "9856", "9857", "9861", "9866", "9867", "9869", "9870", "9872", "9873", "9876", "9878", "9880", "9882", "9883", "9885", "9887", "9888", "9889", "9890", "9892", "9895", "9896", "9898", "9899", "9900", "9902", "9903", "9904", "9905", "9906", "9908", "9909", "9913", "9914", "9919", "9922", "9924", "9927", "9928", "9929", "9930", "9931", "9932", "9934", "9936", "9938", "9941", "9942", "9943", "9945", "9946", "9948", "9949", "9950", "9955", "9956", "9957", "9959", "9960", "9961", "9962", "9963", "9964", "9966", "9967", "9969", "9972", "9973", "9974", "9975", "9976", "9977", "9978", "9979", "9980", "9982", "9983", "9984", "9986", "9987", "9989", "9990", "9991", "9992", "9993", "9994", "9995", "9996", "9997"]
    start = Time.now.strftime("%M").to_i
    codes[start*59..(start+1)*59].each do |x|
      unless Stock.find_by_code(x.to_i)
        @stockCode = x
        begin
          page = open("http://stocks.finance.yahoo.co.jp/stocks/detail/?code=#{@stockCode}")
        rescue OpenURI::HTTPError
          return
        end
        html = Nokogiri::HTML(page.read, nil, 'utf-8')
        date = html.css('div.innerDate dd').map{|x| x.css('strong').inner_text }
      
        @stock = Stock.new(
          previousprice: date[0],
          opening: date[1],
          high: date[2],
          low: date[3],
          volume: date[4],
          price: html.css('table.stocksTable td.stoksPrice')[1].content,
          name: html.css('table.stocksTable th.symbol h1').inner_text,
          code: x,
          market: html.css('div.stocksDtlWp dd')[0].content,
          chart: html.css("div.styleChart img")[0][:src]
          )
        @stock.save
      end
    end
    
  end

  def self.blog_count
  	Blog.all.each do |blog|
  		blog.in += blog.ins.count
  		blog.week_in += blog.ins.count
  		blog.month_in += blog.ins.count
  		blog.save
  		blog.ins.destroy_all
  	end
  end

  def self.blog_count_week
  	Blog.all.each do |blog|
  		blog.week_in = 0
  		blog.save
  	end
  end

  def self.blog_count_month
  	Blog.all.each do |blog|
  		blog.month_in = 0
  		blog.save
  	end
  end

  def self.update_track
    puts("==== " + Time.now.to_s + " ====")

    not_found_id_list = Array.new
    track_list = Track.find(:all)
    track_list.each do |track|
      p track
      if !exist?(track.preview_url)
        not_found_id_list.push(track.id)
      end
    end

    not_found_id_list.each do |id|
      Track.delete(id)
      assert_raise(ActiveRecord::RecordNotFound) do
        Track.find(id)
      end
    end

    puts("==== update done!!! ====")
  end



  def self.exist?(url)
    result = false

    open(url) do |file|
      status_code = file.status[0]
      p status_code
      if file.status[0] == SC_OK
        result = true
      end
    end

    return result
  end
end