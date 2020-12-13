var script = rumble_none;

switch(argument0)
{
    case RUMBLE_EVENT_GIANT_RING:
    case RUMBLE_EVENT_EMERALD_GET:
        script = rumble_short_mid;
        break;
    case RUMBLE_EVENT_BREAK_ROBOT:
    case RUMBLE_EVENT_BREAK_BLOCK:
    case RUMBLE_EVENT_BREAK_MONITOR:
    case RUMBLE_EVENT_BUMPER:
        script = rumble_short_strong;
        break;
    case RUMBLE_EVENT_SS_ITEM_GET:
        script = rumble_ss_item_get;
        break;
    case RUMBLE_EVENT_HURT_ROBOT:
        script = rumble_short_strong_double;
        break;
    case RUMBLE_EVENT_ACT1_SPIN_SIGNPOST:
        script = rumble_act1_spin_signpost;
        break;
    case RUMBLE_EVENT_ACT2_BREAK_CAPSULE:
        script = rumble_act2_break_capsule;
        break;
    case RUMBLE_EVENT_GROUND_SHAKE:
        script = rumble_ground_shake;
        break;
    case RUMBLE_EVENT_LAMPPOST:
        script = rumble_short_mid_double;
        break;
    case RUMBLE_EVENT_SPRING:
        script = rumble_short_strong_and_mid;
        break;
    case RUMBLE_EVENT_HURT_SHIELDS:
        script = rumble_short_strongest;
        break;
    case RUMBLE_EVENT_HURT_RINGS:
        script = rumble_long_decreasing;
        break;
    case RUMBLE_EVENT_DIE:
        script = rumble_verylong_strong;
        break;
    case RUMBLE_EVENT_TAILS_FLY:
    case RUMBLE_EVENT_SPINDASH:
    case RUMBLE_EVENT_CONTROLLED_BY_OBJECT:
        script = rumble_short_weakest;
        break;
    case RUMBLE_EVENT_KNUCKLES_CLIMB:
        script = rumble_short_mid;
        break;
    case RUMBLE_EVENT_KNUCKLES_FALL:
        script = rumble_short_strong;
        break;
    case RUMBLE_EVENT_SHAKE_ONCE:
        script = rumble_instant_strong;
        break;
}
rumble_enqueue(script_execute(script));
