///get_titlecard_array(roomIndex,[inst])
var roomIndex = argument[0];
var inst = objTitlecard; if (argument_count > 1) inst = argument[1];
with (inst) {
    // [0] - upper string
    // [1] - middle string
    // [2] - down string
    // [3] - ACT string
    
    switch (roomIndex) {
        case AA1_f: {
            title_string[0] = tr("_zonename_AAZ_A");
            title_string[1] = tr("_zonename_AAZ_B");
            title_string[2] = tr("_zonename_AAZ_C");
            title_string[3] = tr("_ACT1_FUTURE");
            return true;
        }
        
        case AA1_p: {
            title_string[0] = tr("_zonename_AAZ_A");
            title_string[1] = tr("_zonename_AAZ_B");
            title_string[2] = tr("_zonename_AAZ_C");
            title_string[3] = tr("_ACT1_PAST");
            return true;
        }
        
        case AA2_f: {
            title_string[0] = tr("_zonename_AAZ_A");
            title_string[1] = tr("_zonename_AAZ_B");
            title_string[2] = tr("_zonename_AAZ_C");
            title_string[3] = tr("_ACT2_FUTURE");
            return true;
        }
        
        case AA2_p: {
            title_string[0] = tr("_zonename_AAZ_A");
            title_string[1] = tr("_zonename_AAZ_B");
            title_string[2] = tr("_zonename_AAZ_C");
            title_string[3] = tr("_ACT2_PAST");
            return true;
        }
        
        case RR1_f: {
            title_string[0] = tr("_zonename_RRZ_A");
            title_string[1] = tr("_zonename_RRZ_B");
            title_string[2] = tr("_zonename_RRZ_C");
            title_string[3] = tr("_ACT1_FUTURE");
            return true;
        }
        
        case RR1_p: {
            title_string[0] = tr("_zonename_RRZ_A");
            title_string[1] = tr("_zonename_RRZ_B");
            title_string[2] = tr("_zonename_RRZ_C");
            title_string[3] = tr("_ACT1_PAST");
            return true;
        }
        
        case RR2_f: {
            title_string[0] = tr("_zonename_RRZ_A");
            title_string[1] = tr("_zonename_RRZ_B");
            title_string[2] = tr("_zonename_RRZ_C");
            title_string[3] = tr("_ACT2_FUTURE");
            return true;
        }
        
        case RR2_p: {
            title_string[0] = tr("_zonename_RRZ_A");
            title_string[1] = tr("_zonename_RRZ_B");
            title_string[2] = tr("_zonename_RRZ_C");
            title_string[3] = tr("_ACT2_PAST");
            return true;
        }
        
        case FF1_f: {
            title_string[0] = tr("_zonename_FFZ_A");
            title_string[1] = tr("_zonename_FFZ_B");
            title_string[2] = tr("_zonename_FFZ_C");
            title_string[3] = tr("_ACT1_FUTURE");
            return true;
        }
        
        case FF1_p: {
            title_string[0] = tr("_zonename_FFZ_A");
            title_string[1] = tr("_zonename_FFZ_B");
            title_string[2] = tr("_zonename_FFZ_C");
            title_string[3] = tr("_ACT1_PAST");
            return true;
        }
        
        case FF2_f: {
            title_string[0] = tr("_zonename_FFZ_A");
            title_string[1] = tr("_zonename_FFZ_B");
            title_string[2] = tr("_zonename_FFZ_C");
            title_string[3] = tr("_ACT2_FUTURE");
            return true;
        }
        
        case FF2_p: {
            title_string[0] = tr("_zonename_FFZ_A");
            title_string[1] = tr("_zonename_FFZ_B");
            title_string[2] = tr("_zonename_FFZ_C");
            title_string[3] = tr("_ACT2_PAST");
            return true;
        }
        
        case VV1_f: {
            title_string[0] = tr("_zonename_VVZ_A");
            title_string[1] = tr("_zonename_VVZ_B");
            title_string[2] = tr("_zonename_VVZ_C");
            title_string[3] = tr("_ACT1_FUTURE");
            return true;
        }
        
        case VV1_p: {
            title_string[0] = tr("_zonename_VVZ_A");
            title_string[1] = tr("_zonename_VVZ_B");
            title_string[2] = tr("_zonename_VVZ_C");
            title_string[3] = tr("_ACT1_PAST");
            return true;
        }
        
        case VV2_f: {
            title_string[0] = tr("_zonename_VVZ_A");
            title_string[1] = tr("_zonename_VVZ_B");
            title_string[2] = tr("_zonename_VVZ_C");
            title_string[3] = tr("_ACT2_FUTURE");
            return true;
        }
        
        case VV2_p: {
            title_string[0] = tr("_zonename_VVZ_A");
            title_string[1] = tr("_zonename_VVZ_B");
            title_string[2] = tr("_zonename_VVZ_C");
            title_string[3] = tr("_ACT2_PAST");
            return true;
        }
        
        case DD1_f: {
            title_string[0] = tr("_zonename_DDZ_A");
            title_string[1] = tr("_zonename_DDZ_B");
            title_string[2] = tr("_zonename_DDZ_C");
            title_string[3] = tr("_ACT1_FUTURE");
            return true;
        }
        
        case DD1_p: {
            title_string[0] = tr("_zonename_DDZ_A");
            title_string[1] = tr("_zonename_DDZ_B");
            title_string[2] = tr("_zonename_DDZ_C");
            title_string[3] = tr("_ACT1_PAST");
            return true;
        }
        
        case DD2_f: {
            title_string[0] = tr("_zonename_DDZ_A");
            title_string[1] = tr("_zonename_DDZ_B");
            title_string[2] = tr("_zonename_DDZ_C");
            title_string[3] = tr("_ACT2_FUTURE");
            return true;
        }
        
        case DD2_p: {
            title_string[0] = tr("_zonename_DDZ_A");
            title_string[1] = tr("_zonename_DDZ_B");
            title_string[2] = tr("_zonename_DDZ_C");
            title_string[3] = tr("_ACT2_PAST");
            return true;
        }
        
        case TT1_f: {
            title_string[0] = tr("_zonename_TTZ_A");
            title_string[1] = tr("_zonename_TTZ_B");
            title_string[2] = tr("_zonename_TTZ_C");
            title_string[3] = tr("_ACT1_FUTURE");
            return true;
        }
        
        case TT1_p: {
            title_string[0] = tr("_zonename_TTZ_A");
            title_string[1] = tr("_zonename_TTZ_B");
            title_string[2] = tr("_zonename_TTZ_C");
            title_string[3] = tr("_ACT1_PAST");
            return true;
        }
        
        case TT2_f: {
            title_string[0] = tr("_zonename_TTZ_A");
            title_string[1] = tr("_zonename_TTZ_B");
            title_string[2] = tr("_zonename_TTZ_C");
            title_string[3] = tr("_ACT2_FUTURE");
            return true;
        }
        
        case TT2_p: {
            title_string[0] = tr("_zonename_TTZ_A");
            title_string[1] = tr("_zonename_TTZ_B");
            title_string[2] = tr("_zonename_TTZ_C");
            title_string[3] = tr("_ACT2_PAST");
            return true;
        }
        
        case SS1: {
            title_string[0] = tr("_zonename_SSZ_A");
            title_string[1] = tr("_zonename_SSZ_B");
            title_string[2] = tr("_zonename_SSZ_C");
            title_string[3] = "";
            return true;
        }
        
        case PP1: {
            title_string[0] = tr("_zonename_PPZ_A");
            title_string[1] = tr("_zonename_PPZ_B");
            title_string[2] = tr("_zonename_PPZ_C");
            title_string[3] = tr("_ACT1");
            return true;
        }
        
        case PP2: {
            title_string[0] = tr("_zonename_PPZ_A");
            title_string[1] = tr("_zonename_PPZ_B");
            title_string[2] = tr("_zonename_PPZ_C");
            title_string[3] = tr("_ACT2");
            return true;
        }
        
        case MM1: {
            title_string[0] = tr("_zonename_GGZ_A");
            title_string[1] = tr("_zonename_GGZ_B");
            title_string[2] = tr("_zonename_GGZ_C");
            title_string[3] = "";
            return true;
        }
        
        default: {
            var errmsg = tr_format("Tried to get titlecard strings for an unknown room. (ind=%0,name=%1)", roomIndex, room_get_name(roomIndex));
            show_error(errmsg, false);
            return false;
        }
    }
}
