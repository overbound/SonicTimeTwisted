//save_level(room)
 switch room {
        
        case AA1_f:
        room_string = aAA1_f;  
        break;
        
        case AA1_p:
        room_string = aAA1_p;        
        break;
        
        case AA2_f:
        room_string = aAA2_f;  
        break;
        
        case AA2_p:
        room_string = aAA2_p;  
        break;
        
        case RR1_f:
        room_string = aRR1_f;  
        break;
        
        case RR1_p:
        room_string = aRR1_p;  
        break;
        
        case RR2_f:
        room_string = aRR2_f;  
        break;
        
        case RR2_p:
        room_string = aRR2_p;  
        break;
        
        case FF1_f:
        room_string = aFF1_f;  
        break;
        
        case FF1_p:
        room_string = aFF1_p;  
        break;
        
        case FF2_f:
        room_string = aFF2_f;  
        break;
        
        case FF2_p:
        room_string = aFF2_p;  
        break;
        
        case VV1_f:
        room_string = aVV1_f;  
        break;
        
        case VV1_p:
        room_string = aVV1_p;  
        break;
        
        case VV2_f:
        room_string = aVV2_f;  
        break;
        
        case VV2_p:
        room_string = aVV2_p;    
        break;
        
        case DD1_f:
        room_string = aDD1_f;  
        break;
        
        case DD1_p:
        room_string = aDD1_p;  
        break;
                
        case DD2_f:
        room_string = aDD2_f;  
        break;
        
        case DD2_p:
        room_string = aDD2_p;      
        break;
        
       case TT1_f:
       room_string = aTT1_f;  
        break;
        
        case TT1_p:
        room_string = aTT1_p;  
        break;
        
        case TT2_f:
       room_string = aTT2_f;  
        break;
        
        case TT2_p:
        room_string = aTT2_p;  
        break;
        
        case SS1:
        room_string = aSS1;    
        break;
        
        case PP1:
        room_string = aPP1;            
        break;
        
        case PP2:
        room_string = aPP2;    
        break;
        
        case MM1:
        room_string = aMM1;
        break;
    }
    
save_data_write(LEVELS, room_string, 1);
