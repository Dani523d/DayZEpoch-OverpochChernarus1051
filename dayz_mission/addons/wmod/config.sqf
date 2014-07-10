DZE_WEAPON_MOD_ADMINS = ["38130182"];

//  **DZE_WEAPON_MODS FORMAT**
//  ```
//  DZE_WEAPON_MODS = [
//       [_attachment,_base,_upgrade],
//       [_attachment,_base,_upgrade],
//       [... more info here ...]
//  ];
//  ```
//  
//   parameter    | description                                                         |  type  | example
//  --------------|---------------------------------------------------------------------|--------|--------
//  _attachment   | the name of the weapon attachment                                   | string | "GP25 GL"
//  _base         | the classname that the attachment is put on to                      | string | "AK_74"
//  _upgrade      | the classname the item becomes after the attachment it put on       | string | "AK_74_GL"

DZE_WEAPON_MODS = [
    ["GP25 GL"      ,"AK_74"                ,"AK_74_GL"             ],
    ["Kobra Sight"  ,"AK_74_GL"             ,"AK_74_GL_kobra"       ],
    
    ["GP25 GL"      ,"AK_107_kobra"         ,"AK_107_GL_kobra"      ],
    ["PSO Scope"    ,"AK_107_kobra"         ,"AK_107_pso"           ],
    ["GP25 GL"      ,"AK_107_pso"           ,"AK_107_GL_pso"        ],
    ["PSO Scope"    ,"AK_107_GL_kobra"      ,"AK_107_GL_pso"        ],
    
    ["Gold Paint"   ,"AKS_74"               ,"AKS_GOLD"             ],
    ["Kobra Sight"  ,"AKS_74"               ,"AKS_74_kobra"         ],
    ["PSO Scope"    ,"AKS_74"               ,"AKS_74_pso"           ],
    ["NV Scope"     ,"AKS_74"               ,"AKS_74_NSPU"          ],
    ["Thermal Scope","AKS_74"               ,"AKS_74_GOSHAWK"       ],
    
    ["Thermal Scope","BAF_AS50_scoped_DZ"   ,"BAF_AS50_TWS"         ],
    
    ["US GL"        ,"BAF_L85A2_RIS_Holo"   ,"BAF_L85A2_UGL_Holo"   ],
    ["SUSAT Scope"  ,"BAF_L85A2_RIS_Holo"   ,"BAF_L85A2_RIS_SUSAT"  ],
    ["US GL"        ,"BAF_L85A2_RIS_SUSAT"  ,"BAF_L85A2_UGL_SUSAT"  ],
    ["SUSAT Scope"  ,"BAF_L85A2_UGL_Holo"   ,"BAF_L85A2_UGL_SUSAT"  ],
    ["ACOG Scope"   ,"BAF_L85A2_RIS_Holo"   ,"BAF_L85A2_RIS_ACOG"   ],
    ["US GL"        ,"BAF_L85A2_RIS_ACOG"   ,"BAF_L85A2_UGL_ACOG"   ],
    ["ACOG Scope"   ,"BAF_L85A2_UGL_Holo"   ,"BAF_L85A2_UGL_ACOG"   ],
    ["Thermal Scope","BAF_L85A2_RIS_Holo"   ,"BAF_L85A2_RIS_CWS"    ],
    
    ["Suppressor"   ,"bizon"                ,"bizon_silenced"       ],
    
    ["NV Scope"     ,"FN_FAL"               ,"FN_FAL_ANPVS4"        ],
    
    ["Camo Paint"   ,"G36a"                 ,"G36A_camo"            ],
    ["Camo Paint"   ,"G36C"                 ,"G36C_camo"            ],
    ["Camo Paint"   ,"G36K"                 ,"G36K_camo"            ],
    ["Suppressor"   ,"G36C"                 ,"G36_C_SD_eotech"      ],
    ["Camo Paint"   ,"G36_C_SD_eotech"      ,"G36_C_SD_camo"        ],
  
    ["Thermal Scope","M107_DZ"              ,"m107_TWS_EP1_DZ"      ],
        
    ["M203 GL"      ,"M16A2"                ,"M16A2GL"              ],

    ["ACOG Scope"   ,"m16a4"                ,"m16a4_acg"            ],
    ["M203 GL"      ,"m16a4"                ,"M16A4_GL"             ],
    ["M203 GL"      ,"m16a4_acg"            ,"M16A4_ACG_GL"         ],
    ["ACOG Scope"   ,"M16A4_GL"             ,"M16A4_ACG_GL"         ],
        
    ["Desert Paint" ,"M24"                  ,"M24_des_EP1"          ],
    
    ["SPR Scope"    ,"M240_DZ"              ,"m240_scoped_EP1_DZE"  ],
    
    ["SPR Scope"    ,"M249_EP1_DZ"          ,"M249_m145_EP1_DZE"    ],
    ["Thermal Scope","M249_EP1_DZ"          ,"M249_TWS_EP1"         ],
    
    ["Thermal Scope","M249_EP1_DZ"          ,"M249_TWS_EP1"         ],
    
    ["AIM Scope"    ,"M4A1"                 ,"M4A1_Aim"             ],
    ["Camo Paint"   ,"M4A1_Aim"             ,"M4A1_Aim_camo"        ],
    ["SPR Scope"    ,"M4A1"                 ,"M4SPR"                ],
    ["M203 GL"      ,"M4A1"                 ,"M4A1_HWS_GL"          ],
    ["SPR Scope"    ,"M4A1_HWS_GL"          ,"M4A1_RCO_GL"          ],
    ["M203 GL"      ,"M4SPR"                ,"M4A1_RCO_GL"          ],
    ["Suppressor"   ,"M4A1_Aim_camo"        ,"M4A1_AIM_SD_camo"     ],
    ["Camo Paint"   ,"M4A1_HWS_GL"          ,"M4A1_HWS_GL_camo"     ],
    ["Suppressor"   ,"M4A1_HWS_GL_camo"     ,"M4A1_HWS_GL_SD_Camo"  ],
    
    ["M320 GL"      ,"m8_carbine"           ,"m8_carbineGL"         ],
    ["SPR Scope"    ,"m8_carbine"           ,"m8_sharpshooter"      ],
    ["Thermal Scope","m8_carbine"           ,"m8_tws"               ],
    ["Suppressor"   ,"m8_tws"               ,"m8_tws_sd"            ],
        
    ["CCO Sight"    ,"m8_compact"           ,"m8_compact_pmc"       ],
    ["Suppressor"   ,"m8_compact_pmc"       ,"m8_holo_sd"           ],
 
    ["Suppressor"   ,"M9"                   ,"M9SD"                 ],
    
    ["Suppressor"   ,"Makarov"              ,"MakarovSD"            ],

    ["Camo Paint"   ,"MG36"                 ,"MG36_camo_Large"      ],
 
    ["Desert Paint" ,"MK_48_DZ"             ,"Mk_48_DES_EP1"        ],
    
    ["Suppressor"   ,"MP5A5"                ,"MP5SD"                ],   

    ["Gold Paint"   ,"revolver_EP1"         ,"revolver_gold_EP1"    ],  
    
    ["Sa58 Stock"   ,"Sa58V_EP1"             ,"SA58P_EP1"           ],
    ["ACOG Scope"   ,"Sa58V_EP1"             ,"Sa58V_RCO_EP1"       ],
    ["CCO Sight"    ,"Sa58V_EP1"             ,"Sa58V_CCO_EP1"       ],

    ["Suppressor"   ,"SCAR_H_CQC_CCO"        ,"SCAR_H_CQC_CCO_SD"   ],

    ["Suppressor"   ,"SCAR_H_LNG_Sniper"     ,"SCAR_H_LNG_Sniper_SD"],

    ["EGLM GL"      ,"SCAR_L_CQC_Holo"       ,"SCAR_L_CQC_EGLM_Holo"],
    ["SPR Scope"    ,"SCAR_L_CQC_EGLM_Holo"  ,"SCAR_L_STD_EGLM_RCO" ],
    ["Thermal Scope","SCAR_L_CQC_EGLM_Holo"  ,"SCAR_L_STD_EGLM_TWS" ],

    ["Suppressor"   ,"UZI_EP1"               ,"UZI_SD_EP1"          ],

    ["Camo Paint"   ,"SVD"                  ,"SVD_CAMO"             ],
    ["Desert Paint" ,"SVD"                  ,"SVD_des_EP1"          ],
    ["NV Scope"     ,"SVD"                  ,"SVD_NSPU_EP1"         ]
];