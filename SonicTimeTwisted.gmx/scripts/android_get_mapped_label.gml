// argument0 - player
// argument1 - code

var s = android_get_mapped_source(argument0, argument1);
var i = android_get_mapped_identifier(argument0, argument1);

switch(s)
{
    case 1: // button
        var button_placeholder = tr('::android_button::%k');
        var button_label = string(i);
        
        switch (i) {
            case 7: //KeyEvent.KEYCODE_0:
                button_label = tr("::android_button::0");
                break;

            case 8: //KeyEvent.KEYCODE_1:
                button_label = tr("::android_button::1");
                break;

            case 227: //KeyEvent.KEYCODE_11:
                button_label = tr("::android_button::11");
                break;

            case 228: //KeyEvent.KEYCODE_12:
                button_label = tr("::android_button::12");
                break;

            case 9: //KeyEvent.KEYCODE_2:
                button_label = tr("::android_button::2");
                break;

            case 10: //KeyEvent.KEYCODE_3:
                button_label = tr("::android_button::3");
                break;

            case 206: //KeyEvent.KEYCODE_3D_MODE:
                return tr("::android_button::3D Mode");

            case 11: //KeyEvent.KEYCODE_4:
                button_label = tr("::android_button::4");
                break;

            case 12: //KeyEvent.KEYCODE_5:
                button_label = tr("::android_button::5");
                break;

            case 13: //KeyEvent.KEYCODE_6:
                button_label = tr("::android_button::6");
                break;

            case 14: //KeyEvent.KEYCODE_7:
                button_label = tr("::android_button::7");
                break;

            case 15: //KeyEvent.KEYCODE_8:
                button_label = tr("::android_button::8");
                break;

            case 16: //KeyEvent.KEYCODE_9:
                button_label = tr("::android_button::9");
                break;

            case 29: //KeyEvent.KEYCODE_A:
                button_label = tr("::android_button::A");
                break;

            case 57: //KeyEvent.KEYCODE_ALT_LEFT:
                return tr("::android_button::Left Alt");

            case 58: //KeyEvent.KEYCODE_ALT_RIGHT:
                return tr("::android_button::Right Alt");

            case 75: //KeyEvent.KEYCODE_APOSTROPHE:
                return tr("::android_button::Apostrophe");

            case 187: //KeyEvent.KEYCODE_APP_SWITCH:
                return tr("::android_button::App switch");

            case 219: //KeyEvent.KEYCODE_ASSIST:
                return tr("::android_button::Assist");

            case 77: //KeyEvent.KEYCODE_AT:
                button_label = tr("::android_button::At");
                break;

            case 182: //KeyEvent.KEYCODE_AVR_INPUT:
                return tr("::android_button::AVR input");

            case 181: //KeyEvent.KEYCODE_AVR_POWER:
                return tr("::android_button::AVR power");

            case 30: //KeyEvent.KEYCODE_B:
                button_label = tr("::android_button::B");
                break;

            case 4: //KeyEvent.KEYCODE_BACK:
                return tr("::android_button::Back");

            case 73: //KeyEvent.KEYCODE_BACKSLASH:
                return tr("::android_button::Backslash");

            case 174: //KeyEvent.KEYCODE_BOOKMARK:
                return tr("::android_button::Bookmark");

            case 121: //KeyEvent.KEYCODE_BREAK:
                return tr("::android_button::Pause");

            case 220: //KeyEvent.KEYCODE_BRIGHTNESS_DOWN:
                return tr("::android_button::Brightness-");

            case 221: //KeyEvent.KEYCODE_BRIGHTNESS_UP:
                return tr("::android_button::Brightness+");

            case 188: //KeyEvent.KEYCODE_BUTTON_1:
                return tr("::android_button::1");

            case 197: //KeyEvent.KEYCODE_BUTTON_10:
                return tr("::android_button::10");

            case 198: //KeyEvent.KEYCODE_BUTTON_11:
                return tr("::android_button::11");

            case 199: //KeyEvent.KEYCODE_BUTTON_12:
                return tr("::android_button::12");

            case 200: //KeyEvent.KEYCODE_BUTTON_13:
                return tr("::android_button::13");

            case 201: //KeyEvent.KEYCODE_BUTTON_14:
                return tr("::android_button::14");

            case 202: //KeyEvent.KEYCODE_BUTTON_15:
                return tr("::android_button::15");

            case 203: //KeyEvent.KEYCODE_BUTTON_16:
                return tr("::android_button::16");

            case 189: //KeyEvent.KEYCODE_BUTTON_2:
                return tr("::android_button::2");

            case 190: //KeyEvent.KEYCODE_BUTTON_3:
                return tr("::android_button::3");

            case 191: //KeyEvent.KEYCODE_BUTTON_4:
                return tr("::android_button::4");

            case 192: //KeyEvent.KEYCODE_BUTTON_5:
                return tr("::android_button::5");

            case 193: //KeyEvent.KEYCODE_BUTTON_6:
                return tr("::android_button::6");

            case 194: //KeyEvent.KEYCODE_BUTTON_7:
                return tr("::android_button::7");

            case 195: //KeyEvent.KEYCODE_BUTTON_8:
                return tr("::android_button::8");

            case 196: //KeyEvent.KEYCODE_BUTTON_9:
                return tr("::android_button::9");

            case 96: //KeyEvent.KEYCODE_BUTTON_A:
                return tr("::android_button::A");

            case 97: //KeyEvent.KEYCODE_BUTTON_B:
                return tr("::android_button::B");

            case 98: //KeyEvent.KEYCODE_BUTTON_C:
                return tr("::android_button::C");

            case 102: //KeyEvent.KEYCODE_BUTTON_L1:
                return tr("::android_button::L1");

            case 104: //KeyEvent.KEYCODE_BUTTON_L2:
                return tr("::android_button::L2");

            case 110: //KeyEvent.KEYCODE_BUTTON_MODE:
                return tr("::android_button::Mode");

            case 103: //KeyEvent.KEYCODE_BUTTON_R1:
                return tr("::android_button::R1");

            case 105: //KeyEvent.KEYCODE_BUTTON_R2:
                return tr("::android_button::R2");

            case 109: //KeyEvent.KEYCODE_BUTTON_SELECT:
                return tr("::android_button::Select");

            case 108: //KeyEvent.KEYCODE_BUTTON_START:
                return tr("::android_button::Start");

            case 106: //KeyEvent.KEYCODE_BUTTON_THUMBL:
                return tr("::android_button::L3");

            case 107: //KeyEvent.KEYCODE_BUTTON_THUMBR:
                return tr("::android_button::R3");

            case 99: //KeyEvent.KEYCODE_BUTTON_X:
                return tr("::android_button::X");

            case 100: //KeyEvent.KEYCODE_BUTTON_Y:
                return tr("::android_button::Y");

            case 101: //KeyEvent.KEYCODE_BUTTON_Z:
                return tr("::android_button::Z");

            case 31: //KeyEvent.KEYCODE_C:
                return tr("::android_button::C");

            case 210: //KeyEvent.KEYCODE_CALCULATOR:
                return tr("::android_button::Calculator");

            case 208: //KeyEvent.KEYCODE_CALENDAR:
                return tr("::android_button::Calendar");

            case 5: //KeyEvent.KEYCODE_CALL:
                return tr("::android_button::Call");

            case 27: //KeyEvent.KEYCODE_CAMERA:
                return tr("::android_button::Camera");

            case 115: //KeyEvent.KEYCODE_CAPS_LOCK:
                return tr("::android_button::Caps Lock");

            case 175: //KeyEvent.KEYCODE_CAPTIONS:
                return tr("::android_button::Captions");

            case 167: //KeyEvent.KEYCODE_CHANNEL_DOWN:
                return tr("::android_button::Channel-");

            case 166: //KeyEvent.KEYCODE_CHANNEL_UP:
                return tr("::android_button::Channel+");

            case 28: //KeyEvent.KEYCODE_CLEAR:
                return tr("::android_button::Clear");

            case 55: //KeyEvent.KEYCODE_COMMA:
                return tr("::android_button::Comma");

            case 207: //KeyEvent.KEYCODE_CONTACTS:
                return tr("::android_button::Contacts");

            case 113: //KeyEvent.KEYCODE_CTRL_LEFT:
                return tr("::android_button::Left Ctrl");

            case 114: //KeyEvent.KEYCODE_CTRL_RIGHT:
                return tr("::android_button::Right Ctrl");

            case 32: //KeyEvent.KEYCODE_D:
                button_label = tr("::android_button::D");
                break;

            case 67: //KeyEvent.KEYCODE_DEL:
                return tr("::android_button::Delete");

            case 23: //KeyEvent.KEYCODE_DPAD_CENTER:
                return tr("::android_button::DPad Center");

            case 20: //KeyEvent.KEYCODE_DPAD_DOWN:
                return tr("::android_button::DPad Down");

            case 21: //KeyEvent.KEYCODE_DPAD_LEFT:
                return tr("::android_button::DPad Left");

            case 22: //KeyEvent.KEYCODE_DPAD_RIGHT:
                return tr("::android_button::DPad Right");

            case 19: //KeyEvent.KEYCODE_DPAD_UP:
                return tr("::android_button::DPad Up");

            case 173: //KeyEvent.KEYCODE_DVR:
                return tr("::android_button::DVR");

            case 33: //KeyEvent.KEYCODE_E:
                button_label = tr("::android_button::E");
                break;

            case 212: //KeyEvent.KEYCODE_EISU:
                return tr("::android_button::EISU");

            case 6: //KeyEvent.KEYCODE_ENDCALL:
                button_label = tr("::android_button::End Call");
                break;

            case 66: //KeyEvent.KEYCODE_ENTER:
                return tr("::android_button::Enter");

            case 65: //KeyEvent.KEYCODE_ENVELOPE:
                return tr("::android_button::Envelope");

            case 70: //KeyEvent.KEYCODE_EQUALS:
                return tr("::android_button::Equals");

            case 111: //KeyEvent.KEYCODE_ESCAPE:
                return tr("::android_button::Escape");

            case 64: //KeyEvent.KEYCODE_EXPLORER:
                return tr("::android_button::Explorer");

            case 34: //KeyEvent.KEYCODE_F:
                button_label = tr("::android_button::F");
                break;

            case 131: //KeyEvent.KEYCODE_F1:
                return tr("::android_button::F1");

            case 140: //KeyEvent.KEYCODE_F10:
                return tr("::android_button::F10");

            case 141: //KeyEvent.KEYCODE_F11:
                return tr("::android_button::F11");

            case 142: //KeyEvent.KEYCODE_F12:
                return tr("::android_button::F12");

            case 132: //KeyEvent.KEYCODE_F2:
                return tr("::android_button::F2");

            case 133: //KeyEvent.KEYCODE_F3:
                return tr("::android_button::F3");

            case 134: //KeyEvent.KEYCODE_F4:
                return tr("::android_button::F4");

            case 135: //KeyEvent.KEYCODE_F5:
                return tr("::android_button::F5");

            case 136: //KeyEvent.KEYCODE_F6:
                return tr("::android_button::F6");

            case 137: //KeyEvent.KEYCODE_F7:
                return tr("::android_button::F7");

            case 138: //KeyEvent.KEYCODE_F8:
                return tr("::android_button::F8");

            case 139: //KeyEvent.KEYCODE_F9:
                return tr("::android_button::F9");

            case 80: //KeyEvent.KEYCODE_FOCUS:
                return tr("::android_button::Focus");

            case 125: //KeyEvent.KEYCODE_FORWARD:
                return tr("::android_button::Forward");

            case 112: //KeyEvent.KEYCODE_FORWARD_DEL:
                return tr("::android_button::Forward Delete");

            case 119: //KeyEvent.KEYCODE_FUNCTION:
                return tr("::android_button::Function");

            case 35: //KeyEvent.KEYCODE_G:
                button_label = tr("::android_button::G");
                break;

            case 68: //KeyEvent.KEYCODE_GRAVE:
                return tr("::android_button::Backtick");

            case 172: //KeyEvent.KEYCODE_GUIDE:
                return tr("::android_button::Guide");

            case 36: //KeyEvent.KEYCODE_H:
                button_label = tr("::android_button::H");
                break;

            case 79: //KeyEvent.KEYCODE_HEADSETHOOK:
                return tr("::android_button::Headset");

            case 259: //KeyEvent.KEYCODE_HELP:
                return tr("::android_button::Help");

            case 214: //KeyEvent.KEYCODE_HENKAN:
                return tr("::android_button::HENKAN");

            case 3: //KeyEvent.KEYCODE_HOME:
                return tr("::android_button::Home");

            case 37: //KeyEvent.KEYCODE_I:
                button_label = tr("::android_button::I");
                break;

            case 165: //KeyEvent.KEYCODE_INFO:
                return tr("::android_button::Info");

            case 124: //KeyEvent.KEYCODE_INSERT:
                return tr("::android_button::Insert");

            case 38: //KeyEvent.KEYCODE_J:
                button_label = tr("::android_button::J");
                break;

            case 39: //KeyEvent.KEYCODE_K:
                button_label = tr("::android_button::K");
                break;

            case 218: //KeyEvent.KEYCODE_KANA:
                return tr("::android_button::Kana");

            case 215: //KeyEvent.KEYCODE_KATAKANA_HIRAGANA:
                return tr("::android_button::Katakana/hiragana");

            case 40: //KeyEvent.KEYCODE_L:
                button_label = tr("::android_button::L");
                break;

            case 204: //KeyEvent.KEYCODE_LANGUAGE_SWITCH:
                return tr("::android_button::Language");

            case 229: //KeyEvent.KEYCODE_LAST_CHANNEL:
                return tr("::android_button::Last Channel");

            case 71: //KeyEvent.KEYCODE_LEFT_BRACKET:
                return tr("::android_button::Left Bracket");

            case 41: //KeyEvent.KEYCODE_M:
                button_label = tr("::android_button::M");
                break;

            case 205: //KeyEvent.KEYCODE_MANNER_MODE:
                return tr("::android_button::Manner Mode");

            case 222: //KeyEvent.KEYCODE_MEDIA_AUDIO_TRACK:
                return tr("::android_button::Track");

            case 128: //KeyEvent.KEYCODE_MEDIA_CLOSE:
                return tr("::android_button::Close media");

            case 129: //KeyEvent.KEYCODE_MEDIA_EJECT:
                return tr("::android_button::Eject");

            case 90: //KeyEvent.KEYCODE_MEDIA_FAST_FORWARD:
                return tr("::android_button::FF");

            case 87: //KeyEvent.KEYCODE_MEDIA_NEXT:
                return tr("::android_button::Next");

            case 127: //KeyEvent.KEYCODE_MEDIA_PAUSE:
                return tr("::android_button::Pause");

            case 126: //KeyEvent.KEYCODE_MEDIA_PLAY:
                return tr("::android_button::Play");

            case 85: //KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE:
                return tr("::android_button::Play/Pause");

            case 88: //KeyEvent.KEYCODE_MEDIA_PREVIOUS:
                return tr("::android_button::Previous");

            case 130: //KeyEvent.KEYCODE_MEDIA_RECORD:
                return tr("::android_button::Record");

            case 89: //KeyEvent.KEYCODE_MEDIA_REWIND:
                return tr("::android_button::Rewind");

            case 273: //KeyEvent.KEYCODE_MEDIA_SKIP_BACKWARD:
                return tr("::android_button::Skip backward");

            case 272: //KeyEvent.KEYCODE_MEDIA_SKIP_FORWARD:
                return tr("::android_button::Skip forward");

            case 275: //KeyEvent.KEYCODE_MEDIA_STEP_BACKWARD:
                return tr("::android_button::Step backward");

            case 274: //KeyEvent.KEYCODE_MEDIA_STEP_FORWARD:
                return tr("::android_button::Step forward");

            case 86: //KeyEvent.KEYCODE_MEDIA_STOP:
                return tr("::android_button::Stop");

            case 226: //KeyEvent.KEYCODE_MEDIA_TOP_MENU:
                button_label = tr("::android_button::Media Top Menu");
                break;

            case 82: //KeyEvent.KEYCODE_MENU:
                return tr("::android_button::Menu");

            case 117: //KeyEvent.KEYCODE_META_LEFT:
                return tr("::android_button::Left Meta");

            case 118: //KeyEvent.KEYCODE_META_RIGHT:
                return tr("::android_button::Right Meta");

            case 69: //KeyEvent.KEYCODE_MINUS:
                return tr("::android_button::Minus");

            case 123: //KeyEvent.KEYCODE_MOVE_END:
                return tr("::android_button::End Movement");

            case 122: //KeyEvent.KEYCODE_MOVE_HOME:
                return tr("::android_button::Home Movement");

            case 213: //KeyEvent.KEYCODE_MUHENKAN:
                return tr("::android_button::Muhenkan");

            case 209: //KeyEvent.KEYCODE_MUSIC:
                return tr("::android_button::Music");

            case 91: //KeyEvent.KEYCODE_MUTE:
                return tr("::android_button::Mute");

            case 42: //KeyEvent.KEYCODE_N:
                button_label = tr("::android_button::N");
                break;

            case 262: //KeyEvent.KEYCODE_NAVIGATE_IN:
                return tr("::android_button::In");

            case 261: //KeyEvent.KEYCODE_NAVIGATE_NEXT:
                return tr("::android_button::Next");

            case 263: //KeyEvent.KEYCODE_NAVIGATE_OUT:
                return tr("::android_button::Out");

            case 260: //KeyEvent.KEYCODE_NAVIGATE_PREVIOUS:
                return tr("::android_button::Previous");

            case 83: //KeyEvent.KEYCODE_NOTIFICATION:
                return tr("::android_button::Notification");

            case 78: //KeyEvent.KEYCODE_NUM:
                return tr("::android_button::Numpad");

            case 144: //KeyEvent.KEYCODE_NUMPAD_0:
                return tr("::android_button::Numpad 0");

            case 145: //KeyEvent.KEYCODE_NUMPAD_1:
                return tr("::android_button::Numpad 1");

            case 146: //KeyEvent.KEYCODE_NUMPAD_2:
                return tr("::android_button::Numpad 2");

            case 147: //KeyEvent.KEYCODE_NUMPAD_3:
                return tr("::android_button::Numpad 3");

            case 148: //KeyEvent.KEYCODE_NUMPAD_4:
                return tr("::android_button::Numpad 4");

            case 149: //KeyEvent.KEYCODE_NUMPAD_5:
                return tr("::android_button::Numpad 5");

            case 150: //KeyEvent.KEYCODE_NUMPAD_6:
                return tr("::android_button::Numpad 6");

            case 151: //KeyEvent.KEYCODE_NUMPAD_7:
                return tr("::android_button::Numpad 7");

            case 152: //KeyEvent.KEYCODE_NUMPAD_8:
                return tr("::android_button::Numpad 8");

            case 153: //KeyEvent.KEYCODE_NUMPAD_9:
                return tr("::android_button::Numpad 9");

            case 157: //KeyEvent.KEYCODE_NUMPAD_ADD:
                return tr("::android_button::Add");

            case 159: //KeyEvent.KEYCODE_NUMPAD_COMMA:
                return tr("::android_button::Comma");

            case 154: //KeyEvent.KEYCODE_NUMPAD_DIVIDE:
                return tr("::android_button::Divide");

            case 158: //KeyEvent.KEYCODE_NUMPAD_DOT:
                return tr("::android_button::Decimal");

            case 160: //KeyEvent.KEYCODE_NUMPAD_ENTER:
                return tr("::android_button::Enter");

            case 161: //KeyEvent.KEYCODE_NUMPAD_EQUALS:
                return tr("::android_button::Equals");

            case 162: //KeyEvent.KEYCODE_NUMPAD_LEFT_PAREN:
                return tr("::android_button::Left parenthesis");

            case 155: //KeyEvent.KEYCODE_NUMPAD_MULTIPLY:
                return tr("::android_button::Multiply");

            case 163: //KeyEvent.KEYCODE_NUMPAD_RIGHT_PAREN:
                return tr("::android_button::Right parenthesis");

            case 156: //KeyEvent.KEYCODE_NUMPAD_SUBTRACT:
                return tr("::android_button::Subtract");

            case 143: //KeyEvent.KEYCODE_NUM_LOCK:
                return tr("::android_button::Num Lock");

            case 43: //KeyEvent.KEYCODE_O:
                button_label = tr("::android_button::O");
                break;

            case 44: //KeyEvent.KEYCODE_P:
                button_label = tr("::android_button::P");
                break;

            case 93: //KeyEvent.KEYCODE_PAGE_DOWN:
                return tr("::android_button::Page Down");

            case 92: //KeyEvent.KEYCODE_PAGE_UP:
                return tr("::android_button::Page Up");

            case 225: //KeyEvent.KEYCODE_PAIRING:
                return tr("::android_button::Pairing");

            case 56: //KeyEvent.KEYCODE_PERIOD:
                return tr("::android_button::Period");

            case 94: //KeyEvent.KEYCODE_PICTSYMBOLS:
                return tr("::android_button::Picture Symbols");

            case 81: //KeyEvent.KEYCODE_PLUS:
                return tr("::android_button::Plus");

            case 18: //KeyEvent.KEYCODE_POUND:
                button_label = tr("::android_button::#");
                break;

            case 26: //KeyEvent.KEYCODE_POWER:
                return tr("::android_button::Power");

            case 186: //KeyEvent.KEYCODE_PROG_BLUE:
                return tr("::android_button::Blue");

            case 184: //KeyEvent.KEYCODE_PROG_GREEN:
                return tr("::android_button::Green");

            case 183: //KeyEvent.KEYCODE_PROG_RED:
                return tr("::android_button::Red");

            case 185: //KeyEvent.KEYCODE_PROG_YELLOW:
                return tr("::android_button::Yellow");

            case 45: //KeyEvent.KEYCODE_Q:
                button_label = tr("::android_button::Q");
                break;

            case 46: //KeyEvent.KEYCODE_R:
                button_label = tr("::android_button::R");
                break;

            case 72: //KeyEvent.KEYCODE_RIGHT_BRACKET:
                return tr("::android_button::Right bracket");

            case 217: //KeyEvent.KEYCODE_RO:
                return tr("::android_button::Ro");

            case 47: //KeyEvent.KEYCODE_S:
                button_label = tr("::android_button::S");
                break;

            case 116: //KeyEvent.KEYCODE_SCROLL_LOCK:
                return tr("::android_button::Scroll Lock");

            case 84: //KeyEvent.KEYCODE_SEARCH:
                return tr("::android_button::Search");

            case 74: //KeyEvent.KEYCODE_SEMICOLON:
                return tr("::android_button::Semicolon");

            case 176: //KeyEvent.KEYCODE_SETTINGS:
                return tr("::android_button::Settings");

            case 59: //KeyEvent.KEYCODE_SHIFT_LEFT:
                return tr("::android_button::Left Shift");

            case 60: //KeyEvent.KEYCODE_SHIFT_RIGHT:
                return tr("::android_button::Right Shift");

            case 76: //KeyEvent.KEYCODE_SLASH:
                return tr("::android_button::Slash");

            case 223: //KeyEvent.KEYCODE_SLEEP:
                return tr("::android_button::Sleep");

            case 1: //KeyEvent.KEYCODE_SOFT_LEFT:
                return tr("::android_button::Soft Left");

            case 2: //KeyEvent.KEYCODE_SOFT_RIGHT:
                return tr("::android_button::Soft Right");

            case 62: //KeyEvent.KEYCODE_SPACE:
                return tr("::android_button::Space");

            case 17: //KeyEvent.KEYCODE_STAR:
                return tr("::android_button::Star");

            case 180: //KeyEvent.KEYCODE_STB_INPUT:
                return tr("::android_button::STB Input");

            case 179: //KeyEvent.KEYCODE_STB_POWER:
                return tr("::android_button::STB Power");

            case 95: //KeyEvent.KEYCODE_SWITCH_CHARSET:
                return tr("::android_button::Switch");

            case 63: //KeyEvent.KEYCODE_SYM:
                return tr("::android_button::Symbol");

            case 120: //KeyEvent.KEYCODE_SYSRQ:
                return tr("::android_button::Print Screen");

            case 48: //KeyEvent.KEYCODE_T:
                button_label = tr("::android_button::T");
                break;

            case 61: //KeyEvent.KEYCODE_TAB:
                return tr("::android_button::Tab");

            case 170: //KeyEvent.KEYCODE_TV:
                return tr("::android_button::TV");

            case 242: //KeyEvent.KEYCODE_TV_ANTENNA_CABLE:
                return tr("::android_button::Antenna/Cable");

            case 252: //KeyEvent.KEYCODE_TV_AUDIO_DESCRIPTION:
                return tr("::android_button::Audio Descr");

            case 254: //KeyEvent.KEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN:
                return tr("::android_button::Audio Desc Vol-");

            case 253: //KeyEvent.KEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP:
                return tr("::android_button::Audio Desc Vol+");

            case 256: //KeyEvent.KEYCODE_TV_CONTENTS_MENU:
                return tr("::android_button::Contents menu");

            case 230: //KeyEvent.KEYCODE_TV_DATA_SERVICE:
                return tr("::android_button::TV data");

            case 178: //KeyEvent.KEYCODE_TV_INPUT:
                return tr("::android_button::TV input");

            case 249: //KeyEvent.KEYCODE_TV_INPUT_COMPONENT_1:
                return tr("::android_button::Component 1");

            case 250: //KeyEvent.KEYCODE_TV_INPUT_COMPONENT_2:
                return tr("::android_button::Component 2");

            case 247: //KeyEvent.KEYCODE_TV_INPUT_COMPOSITE_1:
                return tr("::android_button::Composite 1");

            case 248: //KeyEvent.KEYCODE_TV_INPUT_COMPOSITE_2:
                return tr("::android_button::Composite 2");

            case 243: //KeyEvent.KEYCODE_TV_INPUT_HDMI_1:
                return tr("::android_button::HDMI 1");

            case 244: //KeyEvent.KEYCODE_TV_INPUT_HDMI_2:
                return tr("::android_button::HDMI 2");

            case 245: //KeyEvent.KEYCODE_TV_INPUT_HDMI_3:
                return tr("::android_button::HDMI 3");

            case 246: //KeyEvent.KEYCODE_TV_INPUT_HDMI_4:
                return tr("::android_button::HDMI 4");

            case 251: //KeyEvent.KEYCODE_TV_INPUT_VGA_1:
                return tr("::android_button::VGA 1");

            case 257: //KeyEvent.KEYCODE_TV_MEDIA_CONTEXT_MENU:
                return tr("::android_button::Media menu");

            case 241: //KeyEvent.KEYCODE_TV_NETWORK:
                return tr("::android_button::Toggle Network");

            case 234: //KeyEvent.KEYCODE_TV_NUMBER_ENTRY:
                return tr("::android_button::Number entry");

            case 177: //KeyEvent.KEYCODE_TV_POWER:
                return tr("::android_button::TV power");

            case 232: //KeyEvent.KEYCODE_TV_RADIO_SERVICE:
                return tr("::android_button::Radio");

            case 237: //KeyEvent.KEYCODE_TV_SATELLITE:
                return tr("::android_button::Satellite");

            case 238: //KeyEvent.KEYCODE_TV_SATELLITE_BS:
                return tr("::android_button::BS");

            case 239: //KeyEvent.KEYCODE_TV_SATELLITE_CS:
                return tr("::android_button::CS");

            case 240: //KeyEvent.KEYCODE_TV_SATELLITE_SERVICE:
                return tr("::android_button::BS/CS");

            case 233: //KeyEvent.KEYCODE_TV_TELETEXT:
                return tr("::android_button::Teletext");

            case 235: //KeyEvent.KEYCODE_TV_TERRESTRIAL_ANALOG:
                return tr("::android_button::ATV");

            case 236: //KeyEvent.KEYCODE_TV_TERRESTRIAL_DIGITAL:
                return tr("::android_button::DTV");

            case 258: //KeyEvent.KEYCODE_TV_TIMER_PROGRAMMING:
                return tr("::android_button::TV Timer");

            case 255: //KeyEvent.KEYCODE_TV_ZOOM_MODE:
                return tr("::android_button::Zoom mode");

            case 49: //KeyEvent.KEYCODE_U:
                button_label = tr("::android_button::U");
                break;

            case 0: //KeyEvent.KEYCODE_UNKNOWN:
                return tr("::android_button::Unknown");

            case 50: //KeyEvent.KEYCODE_V:
                button_label = tr("::android_button::V");
                break;

            case 231: //KeyEvent.KEYCODE_VOICE_ASSIST:
                return tr("::android_button::Voice Assist");

            case 25: //KeyEvent.KEYCODE_VOLUME_DOWN:
                return tr("::android_button::Vol-");

            case 164: //KeyEvent.KEYCODE_VOLUME_MUTE:
                return tr("::android_button::Mute");

            case 24: //KeyEvent.KEYCODE_VOLUME_UP:
                return tr("::android_button::Vol+");

            case 51: //KeyEvent.KEYCODE_W:
                button_label = tr("::android_button::W");
                break;

            case 224: //KeyEvent.KEYCODE_WAKEUP:
                return tr("::android_button::Wakeup");

            case 171: //KeyEvent.KEYCODE_WINDOW:
                return tr("::android_button::Window");

            case 52: //KeyEvent.KEYCODE_X:
                button_label = tr("::android_button::X");
                break;

            case 53: //KeyEvent.KEYCODE_Y:
                button_label = tr("::android_button::Y");
                break;

            case 216: //KeyEvent.KEYCODE_YEN:
                return tr("::android_button::Yen");

            case 54: //KeyEvent.KEYCODE_Z:
                button_label = tr("::android_button::Z");
                break;

            case 211: //KeyEvent.KEYCODE_ZENKAKU_HANKAKU:
                return tr("::android_button::Zenkaku/Hankaku");

            case 168: //KeyEvent.KEYCODE_ZOOM_IN:
                return tr("::android_button::Zoom in");

            case 169: //KeyEvent.KEYCODE_ZOOM_OUT:
                return tr("::android_button::Zoom out");

            default:
                button_label = string(i);
        }
        return string_replace(button_placeholder, "%k", button_label);
        break;
    case 2: // axis (positive)
    case 3: // axis (negative)
        var axis_sign = '+';
        if(s == 3)
        {
            axis_sign = '-';
        }
        var axis_placeholder = tr('::android_axis::%a %s');
        var axis_label = string(i);
        switch (i) {
            case 23: //MotionEvent.AXIS_BRAKE:
                axis_label = tr("::android_axis::Brake");
                break;

            case 24: //MotionEvent.AXIS_DISTANCE:
                axis_label = tr("::android_axis::Distance");
                break;

            case 22: //MotionEvent.AXIS_GAS:
                axis_label = tr("::android_axis::Gas");
                break;

            case 32: //MotionEvent.AXIS_GENERIC_1:
                axis_label = tr("::android_axis::Generic 1");
                break;

            case 41: //MotionEvent.AXIS_GENERIC_10:
                axis_label = tr("::android_axis::Generic 10");
                break;

            case 42: //MotionEvent.AXIS_GENERIC_11:
                axis_label = tr("::android_axis::Generic 11");
                break;

            case 43: //MotionEvent.AXIS_GENERIC_12:
                axis_label = tr("::android_axis::Generic 12");
                break;

            case 44: //MotionEvent.AXIS_GENERIC_13:
                axis_label = tr("::android_axis::Generic 13");
                break;

            case 45: //MotionEvent.AXIS_GENERIC_14:
                axis_label = tr("::android_axis::Generic 14");
                break;

            case 46: //MotionEvent.AXIS_GENERIC_15:
                axis_label = tr("::android_axis::Generic 15");
                break;

            case 47: //MotionEvent.AXIS_GENERIC_16:
                axis_label = tr("::android_axis::Generic 16");
                break;

            case 33: //MotionEvent.AXIS_GENERIC_2:
                axis_label = tr("::android_axis::Generic 2");
                break;

            case 34: //MotionEvent.AXIS_GENERIC_3:
                axis_label = tr("::android_axis::Generic 3");
                break;

            case 35: //MotionEvent.AXIS_GENERIC_4:
                axis_label = tr("::android_axis::Generic 4");
                break;

            case 36: //MotionEvent.AXIS_GENERIC_5:
                axis_label = tr("::android_axis::Generic 5");
                break;

            case 37: //MotionEvent.AXIS_GENERIC_6:
                axis_label = tr("::android_axis::Generic 6");
                break;

            case 38: //MotionEvent.AXIS_GENERIC_7:
                axis_label = tr("::android_axis::Generic 7");
                break;

            case 39: //MotionEvent.AXIS_GENERIC_8:
                axis_label = tr("::android_axis::Generic 8");
                break;

            case 40: //MotionEvent.AXIS_GENERIC_9:
                axis_label = tr("::android_axis::Generic 9");
                break;

            case 15: //MotionEvent.AXIS_HAT_X:
                axis_label = tr("::android_axis::Hat X");
                break;

            case 16: //MotionEvent.AXIS_HAT_Y:
                axis_label = tr("::android_axis::Hat Y");
                break;

            case 10: //MotionEvent.AXIS_HSCROLL:
                axis_label = tr("::android_axis::Horizontal Scroll");
                break;

            case 17: //MotionEvent.AXIS_LTRIGGER:
                axis_label = tr("::android_axis::Left Trigger");
                break;

            case 8: //MotionEvent.AXIS_ORIENTATION:
                axis_label = tr("::android_axis::Orientation");
                break;

            case 2: //MotionEvent.AXIS_PRESSURE:
                axis_label = tr("::android_axis::Pressure");
                break;

            case 18: //MotionEvent.AXIS_RTRIGGER:
                axis_label = tr("::android_axis::Right Trigger");
                break;

            case 20: //MotionEvent.AXIS_RUDDER:
                axis_label = tr("::android_axis::Rudder");
                break;

            case 12: //MotionEvent.AXIS_RX:
                axis_label = tr("::android_axis::X Rotation");
                break;

            case 13: //MotionEvent.AXIS_RY:
                axis_label = tr("::android_axis::Y Rotation");
                break;

            case 14: //MotionEvent.AXIS_RZ:
                axis_label = tr("::android_axis::Z Rotation");
                break;

            case 3: //MotionEvent.AXIS_SIZE:
                axis_label = tr("::android_axis::Size");
                break;

            case 19: //MotionEvent.AXIS_THROTTLE:
                axis_label = tr("::android_axis::Throttle");
                break;

            case 25: //MotionEvent.AXIS_TILT:
                axis_label = tr("::android_axis::Tilt");
                break;

            case 6: //MotionEvent.AXIS_TOOL_MAJOR:
                axis_label = tr("::android_axis::ToolMajor");
                break;

            case 7: //MotionEvent.AXIS_TOOL_MINOR:
                axis_label = tr("::android_axis::ToolMinor");
                break;

            case 4: //MotionEvent.AXIS_TOUCH_MAJOR:
                axis_label = tr("::android_axis::TouchMajor");
                break;

            case 5: //MotionEvent.AXIS_TOUCH_MINOR:
                axis_label = tr("::android_axis::TouchMinor");
                break;

            case 9: //MotionEvent.AXIS_VSCROLL:
                axis_label = tr("::android_axis::Vertical Scroll");
                break;

            case 21: //MotionEvent.AXIS_WHEEL:
                axis_label = tr("::android_axis::Wheel");
                break;

            case 0: //MotionEvent.AXIS_X:
                axis_label = tr("::android_axis::X");
                break;

            case 1: //MotionEvent.AXIS_Y:
                axis_label = tr("::android_axis::Y");
                break;

            case 11: //MotionEvent.AXIS_Z:
                axis_label = tr("::android_axis::Z");
                break;

            default:
                axis_label = string(i);
        }
        return string_replace(string_replace(axis_placeholder, "%a", axis_label), "%s", axis_sign);
        break;
    default:
        return tr('::android_input::None');
}

