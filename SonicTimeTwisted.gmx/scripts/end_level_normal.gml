/// Level End Script

switch room {

case AA1_f:
    level_goto_next_transitoin(objLevelToSS);
break;

case AA1_p:
    level_goto_next_transitoin(objLevelToSS);
break;

case AA2_f:
    end_AA2();
break;

case AA2_p:
    end_AA2();
break;

case RR1_f:
    level_goto_next();
break;

case RR1_p:
    level_goto_next();
break;

case RR2_f:
    end_RR2();
break;

case RR2_p:
    end_RR2();
break;

case FF1_f:
    level_goto_next();
break;

case FF1_p:
    level_goto_next();
break;

case FF2_f:
    end_FF2();
break;

case FF2_p:
    end_FF2();
break;

case VV1_f:
    end_VV1();
break;

case VV1_p:
    end_VV1();
break;

case VV2_f:
    end_VV2();
break;

case VV2_p:
    end_VV2();
break;

case DD1_f:
    end_DD1();
break;

case DD1_p:
    end_DD1();
break;

case DD2_f:
    end_DD2_f();
break;

case DD2_p:
    end_DD2_p();
break;

case TT1_f:
    end_TT1();
break;

case TT1_p:
    end_TT1();
break;

case TT2_f:
    end_TT2();
break;

case TT2_p:
    end_TT2();
break;

case SS1:
    end_SSZ();
break;

case PP1:
    level_goto_next();
break;

case PP2:
    level_goto_next();
break;

case MM1:
    level_goto_next();
break;
}
reset_temp_values();
with objLevel silence = 1;
with objSignPost active = false;
with objCapsule active = false;
instance_destroy();
