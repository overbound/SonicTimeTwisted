/*
 * Sonic Time Twisted - Android rumble and gamepad support library
 * Copyright (C) 2020 Overbound Game Studio + contributors
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.example.sttandroid.lib;

import android.view.KeyEvent;
import android.view.MotionEvent;

/**
 * Static class providing labels for buttons and axes.
 *
 * @author AlexKhayrullin
 */
public class Labels {

    /**
     * @param keyCode Android Key code
     * @return Label
     */
    public static String getButtonLabel(int keyCode) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_0:
                return "0";
            case KeyEvent.KEYCODE_1:
                return "1";
            case KeyEvent.KEYCODE_11:
                return "11";
            case KeyEvent.KEYCODE_12:
                return "12";
            case KeyEvent.KEYCODE_2:
                return "2";
            case KeyEvent.KEYCODE_3:
                return "3";
            case KeyEvent.KEYCODE_3D_MODE:
                return "3D Mode";
            case KeyEvent.KEYCODE_4:
                return "4";
            case KeyEvent.KEYCODE_5:
                return "5";
            case KeyEvent.KEYCODE_6:
                return "6";
            case KeyEvent.KEYCODE_7:
                return "7";
            case KeyEvent.KEYCODE_8:
                return "8";
            case KeyEvent.KEYCODE_9:
                return "9";
            case KeyEvent.KEYCODE_A:
                return "A";
            case KeyEvent.KEYCODE_ALT_LEFT:
                return "Left Alt";
            case KeyEvent.KEYCODE_ALT_RIGHT:
                return "Right Alt";
            case KeyEvent.KEYCODE_APOSTROPHE:
                return "Apostrophe";
            case KeyEvent.KEYCODE_APP_SWITCH:
                return "App switch";
            case KeyEvent.KEYCODE_ASSIST:
                return "Assist";
            case KeyEvent.KEYCODE_AT:
                return "At";
            case KeyEvent.KEYCODE_AVR_INPUT:
                return "AVR input";
            case KeyEvent.KEYCODE_AVR_POWER:
                return "AVR power";
            case KeyEvent.KEYCODE_B:
                return "B";
            case KeyEvent.KEYCODE_BACK:
                return "Back";
            case KeyEvent.KEYCODE_BACKSLASH:
                return "Backslash";
            case KeyEvent.KEYCODE_BOOKMARK:
                return "Bookmark";
            case KeyEvent.KEYCODE_BREAK:
                return "Pause";
            case KeyEvent.KEYCODE_BRIGHTNESS_DOWN:
                return "Brightness-";
            case KeyEvent.KEYCODE_BRIGHTNESS_UP:
                return "Brightness+";
            case KeyEvent.KEYCODE_BUTTON_1:
                return "1";
            case KeyEvent.KEYCODE_BUTTON_10:
                return "10";
            case KeyEvent.KEYCODE_BUTTON_11:
                return "11";
            case KeyEvent.KEYCODE_BUTTON_12:
                return "12";
            case KeyEvent.KEYCODE_BUTTON_13:
                return "13";
            case KeyEvent.KEYCODE_BUTTON_14:
                return "14";
            case KeyEvent.KEYCODE_BUTTON_15:
                return "15";
            case KeyEvent.KEYCODE_BUTTON_16:
                return "16";
            case KeyEvent.KEYCODE_BUTTON_2:
                return "2";
            case KeyEvent.KEYCODE_BUTTON_3:
                return "3";
            case KeyEvent.KEYCODE_BUTTON_4:
                return "4";
            case KeyEvent.KEYCODE_BUTTON_5:
                return "5";
            case KeyEvent.KEYCODE_BUTTON_6:
                return "6";
            case KeyEvent.KEYCODE_BUTTON_7:
                return "7";
            case KeyEvent.KEYCODE_BUTTON_8:
                return "8";
            case KeyEvent.KEYCODE_BUTTON_9:
                return "9";
            case KeyEvent.KEYCODE_BUTTON_A:
                return "A";
            case KeyEvent.KEYCODE_BUTTON_B:
                return "B";
            case KeyEvent.KEYCODE_BUTTON_C:
                return "C";
            case KeyEvent.KEYCODE_BUTTON_L1:
                return "L1";
            case KeyEvent.KEYCODE_BUTTON_L2:
                return "L2";
            case KeyEvent.KEYCODE_BUTTON_MODE:
                return "Mode";
            case KeyEvent.KEYCODE_BUTTON_R1:
                return "R1";
            case KeyEvent.KEYCODE_BUTTON_R2:
                return "R2";
            case KeyEvent.KEYCODE_BUTTON_SELECT:
                return "Select";
            case KeyEvent.KEYCODE_BUTTON_START:
                return "Start";
            case KeyEvent.KEYCODE_BUTTON_THUMBL:
                return "L3";
            case KeyEvent.KEYCODE_BUTTON_THUMBR:
                return "R3";
            case KeyEvent.KEYCODE_BUTTON_X:
                return "X";
            case KeyEvent.KEYCODE_BUTTON_Y:
                return "Y";
            case KeyEvent.KEYCODE_BUTTON_Z:
                return "Z";
            case KeyEvent.KEYCODE_C:
                return "C";
            case KeyEvent.KEYCODE_CALCULATOR:
                return "Calculator";
            case KeyEvent.KEYCODE_CALENDAR:
                return "Calendar";
            case KeyEvent.KEYCODE_CALL:
                return "Call";
            case KeyEvent.KEYCODE_CAMERA:
                return "Camera";
            case KeyEvent.KEYCODE_CAPS_LOCK:
                return "Caps Lock";
            case KeyEvent.KEYCODE_CAPTIONS:
                return "Captions";
            case KeyEvent.KEYCODE_CHANNEL_DOWN:
                return "Channel-";
            case KeyEvent.KEYCODE_CHANNEL_UP:
                return "Channel+";
            case KeyEvent.KEYCODE_CLEAR:
                return "Clear";
            case KeyEvent.KEYCODE_COMMA:
                return "Comma";
            case KeyEvent.KEYCODE_CONTACTS:
                return "Contacts";
            case KeyEvent.KEYCODE_CTRL_LEFT:
                return "Left Ctrl";
            case KeyEvent.KEYCODE_CTRL_RIGHT:
                return "Right Ctrl";
            case KeyEvent.KEYCODE_D:
                return "D";
            case KeyEvent.KEYCODE_DEL:
                return "Delete";
            case KeyEvent.KEYCODE_DPAD_CENTER:
                return "DPad Center";
            case KeyEvent.KEYCODE_DPAD_DOWN:
                return "DPad Down";
            case KeyEvent.KEYCODE_DPAD_LEFT:
                return "DPad Left";
            case KeyEvent.KEYCODE_DPAD_RIGHT:
                return "DPad Right";
            case KeyEvent.KEYCODE_DPAD_UP:
                return "DPad Up";
            case KeyEvent.KEYCODE_DVR:
                return "DVR";
            case KeyEvent.KEYCODE_E:
                return "E";
            case KeyEvent.KEYCODE_EISU:
                return "EISU";
            case KeyEvent.KEYCODE_ENDCALL:
                return "End Call";
            case KeyEvent.KEYCODE_ENTER:
                return "Enter";
            case KeyEvent.KEYCODE_ENVELOPE:
                return "Envelope";
            case KeyEvent.KEYCODE_EQUALS:
                return "Equals";
            case KeyEvent.KEYCODE_ESCAPE:
                return "Escape";
            case KeyEvent.KEYCODE_EXPLORER:
                return "Explorer";
            case KeyEvent.KEYCODE_F:
                return "F";
            case KeyEvent.KEYCODE_F1:
                return "F1";
            case KeyEvent.KEYCODE_F10:
                return "F10";
            case KeyEvent.KEYCODE_F11:
                return "F11";
            case KeyEvent.KEYCODE_F12:
                return "F12";
            case KeyEvent.KEYCODE_F2:
                return "F2";
            case KeyEvent.KEYCODE_F3:
                return "F3";
            case KeyEvent.KEYCODE_F4:
                return "F4";
            case KeyEvent.KEYCODE_F5:
                return "F5";
            case KeyEvent.KEYCODE_F6:
                return "F6";
            case KeyEvent.KEYCODE_F7:
                return "F7";
            case KeyEvent.KEYCODE_F8:
                return "F8";
            case KeyEvent.KEYCODE_F9:
                return "F9";
            case KeyEvent.KEYCODE_FOCUS:
                return "Focus";
            case KeyEvent.KEYCODE_FORWARD:
                return "Forward";
            case KeyEvent.KEYCODE_FORWARD_DEL:
                return "Forward Delete";
            case KeyEvent.KEYCODE_FUNCTION:
                return "Function";
            case KeyEvent.KEYCODE_G:
                return "G";
            case KeyEvent.KEYCODE_GRAVE:
                return "Backtick";
            case KeyEvent.KEYCODE_GUIDE:
                return "Guide";
            case KeyEvent.KEYCODE_H:
                return "H";
            case KeyEvent.KEYCODE_HEADSETHOOK:
                return "Headset";
            case KeyEvent.KEYCODE_HELP:
                return "Help";
            case KeyEvent.KEYCODE_HENKAN:
                return "HENKAN";
            case KeyEvent.KEYCODE_HOME:
                return "Home";
            case KeyEvent.KEYCODE_I:
                return "I";
            case KeyEvent.KEYCODE_INFO:
                return "Info";
            case KeyEvent.KEYCODE_INSERT:
                return "Insert";
            case KeyEvent.KEYCODE_J:
                return "J";
            case KeyEvent.KEYCODE_K:
                return "K";
            case KeyEvent.KEYCODE_KANA:
                return "Kana";
            case KeyEvent.KEYCODE_KATAKANA_HIRAGANA:
                return "Katakana/hiragana";
            case KeyEvent.KEYCODE_L:
                return "L";
            case KeyEvent.KEYCODE_LANGUAGE_SWITCH:
                return "Language";
            case KeyEvent.KEYCODE_LAST_CHANNEL:
                return "Last Channel";
            case KeyEvent.KEYCODE_LEFT_BRACKET:
                return "Left Bracket";
            case KeyEvent.KEYCODE_M:
                return "M";
            case KeyEvent.KEYCODE_MANNER_MODE:
                return "Manner Mode";
            case KeyEvent.KEYCODE_MEDIA_AUDIO_TRACK:
                return "Track";
            case KeyEvent.KEYCODE_MEDIA_CLOSE:
                return "Close media";
            case KeyEvent.KEYCODE_MEDIA_EJECT:
                return "Eject";
            case KeyEvent.KEYCODE_MEDIA_FAST_FORWARD:
                return "FF";
            case KeyEvent.KEYCODE_MEDIA_NEXT:
                return "Next";
            case KeyEvent.KEYCODE_MEDIA_PAUSE:
                return "Pause";
            case KeyEvent.KEYCODE_MEDIA_PLAY:
                return "Play";
            case KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE:
                return "Play/Pause";
            case KeyEvent.KEYCODE_MEDIA_PREVIOUS:
                return "Previous";
            case KeyEvent.KEYCODE_MEDIA_RECORD:
                return "Record";
            case KeyEvent.KEYCODE_MEDIA_REWIND:
                return "Rewind";
            case KeyEvent.KEYCODE_MEDIA_SKIP_BACKWARD:
                return "Skip backward";
            case KeyEvent.KEYCODE_MEDIA_SKIP_FORWARD:
                return "Skip forward";
            case KeyEvent.KEYCODE_MEDIA_STEP_BACKWARD:
                return "Step backward";
            case KeyEvent.KEYCODE_MEDIA_STEP_FORWARD:
                return "Step forward";
            case KeyEvent.KEYCODE_MEDIA_STOP:
                return "Stop";
            case KeyEvent.KEYCODE_MEDIA_TOP_MENU:
                return "Media Top Menu";
            case KeyEvent.KEYCODE_MENU:
                return "Menu";
            case KeyEvent.KEYCODE_META_LEFT:
                return "Left Meta";
            case KeyEvent.KEYCODE_META_RIGHT:
                return "Right Meta";
            case KeyEvent.KEYCODE_MINUS:
                return "Minus";
            case KeyEvent.KEYCODE_MOVE_END:
                return "End Movement";
            case KeyEvent.KEYCODE_MOVE_HOME:
                return "Home Movement";
            case KeyEvent.KEYCODE_MUHENKAN:
                return "Muhenkan";
            case KeyEvent.KEYCODE_MUSIC:
                return "Music";
            case KeyEvent.KEYCODE_MUTE:
                return "Mute";
            case KeyEvent.KEYCODE_N:
                return "N";
            case KeyEvent.KEYCODE_NAVIGATE_IN:
                return "In";
            case KeyEvent.KEYCODE_NAVIGATE_NEXT:
                return "Next";
            case KeyEvent.KEYCODE_NAVIGATE_OUT:
                return "Out";
            case KeyEvent.KEYCODE_NAVIGATE_PREVIOUS:
                return "Previous";
            case KeyEvent.KEYCODE_NOTIFICATION:
                return "Notification";
            case KeyEvent.KEYCODE_NUM:
                return "Numpad";
            case KeyEvent.KEYCODE_NUMPAD_0:
                return "Numpad 0";
            case KeyEvent.KEYCODE_NUMPAD_1:
                return "Numpad 1";
            case KeyEvent.KEYCODE_NUMPAD_2:
                return "Numpad 2";
            case KeyEvent.KEYCODE_NUMPAD_3:
                return "Numpad 3";
            case KeyEvent.KEYCODE_NUMPAD_4:
                return "Numpad 4";
            case KeyEvent.KEYCODE_NUMPAD_5:
                return "Numpad 5";
            case KeyEvent.KEYCODE_NUMPAD_6:
                return "Numpad 6";
            case KeyEvent.KEYCODE_NUMPAD_7:
                return "Numpad 7";
            case KeyEvent.KEYCODE_NUMPAD_8:
                return "Numpad 8";
            case KeyEvent.KEYCODE_NUMPAD_9:
                return "Numpad 9";
            case KeyEvent.KEYCODE_NUMPAD_ADD:
                return "Add";
            case KeyEvent.KEYCODE_NUMPAD_COMMA:
                return "Comma";
            case KeyEvent.KEYCODE_NUMPAD_DIVIDE:
                return "Divide";
            case KeyEvent.KEYCODE_NUMPAD_DOT:
                return "Decimal";
            case KeyEvent.KEYCODE_NUMPAD_ENTER:
                return "Enter";
            case KeyEvent.KEYCODE_NUMPAD_EQUALS:
                return "Equals";
            case KeyEvent.KEYCODE_NUMPAD_LEFT_PAREN:
                return "Left parenthesis";
            case KeyEvent.KEYCODE_NUMPAD_MULTIPLY:
                return "Multiply";
            case KeyEvent.KEYCODE_NUMPAD_RIGHT_PAREN:
                return "Right parenthesis";
            case KeyEvent.KEYCODE_NUMPAD_SUBTRACT:
                return "Subtract";
            case KeyEvent.KEYCODE_NUM_LOCK:
                return "Num Lock";
            case KeyEvent.KEYCODE_O:
                return "O";
            case KeyEvent.KEYCODE_P:
                return "P";
            case KeyEvent.KEYCODE_PAGE_DOWN:
                return "Page Down";
            case KeyEvent.KEYCODE_PAGE_UP:
                return "Page Up";
            case KeyEvent.KEYCODE_PAIRING:
                return "Pairing";
            case KeyEvent.KEYCODE_PERIOD:
                return "Period";
            case KeyEvent.KEYCODE_PICTSYMBOLS:
                return "Picture Symbols";
            case KeyEvent.KEYCODE_PLUS:
                return "Plus";
            case KeyEvent.KEYCODE_POUND:
                return "#";
            case KeyEvent.KEYCODE_POWER:
                return "Power";
            case KeyEvent.KEYCODE_PROG_BLUE:
                return "Blue";
            case KeyEvent.KEYCODE_PROG_GREEN:
                return "Green";
            case KeyEvent.KEYCODE_PROG_RED:
                return "Red";
            case KeyEvent.KEYCODE_PROG_YELLOW:
                return "Yellow";
            case KeyEvent.KEYCODE_Q:
                return "Q";
            case KeyEvent.KEYCODE_R:
                return "R";
            case KeyEvent.KEYCODE_RIGHT_BRACKET:
                return "Right bracket";
            case KeyEvent.KEYCODE_RO:
                return "Ro";
            case KeyEvent.KEYCODE_S:
                return "S";
            case KeyEvent.KEYCODE_SCROLL_LOCK:
                return "Scroll Lock";
            case KeyEvent.KEYCODE_SEARCH:
                return "Search";
            case KeyEvent.KEYCODE_SEMICOLON:
                return "Semicolon";
            case KeyEvent.KEYCODE_SETTINGS:
                return "Settings";
            case KeyEvent.KEYCODE_SHIFT_LEFT:
                return "Left Shift";
            case KeyEvent.KEYCODE_SHIFT_RIGHT:
                return "Right Shift";
            case KeyEvent.KEYCODE_SLASH:
                return "Slash";
            case KeyEvent.KEYCODE_SLEEP:
                return "Sleep";
            case KeyEvent.KEYCODE_SOFT_LEFT:
                return "Soft Left";
            case KeyEvent.KEYCODE_SOFT_RIGHT:
                return "Soft Right";
            case KeyEvent.KEYCODE_SPACE:
                return "Space";
            case KeyEvent.KEYCODE_STAR:
                return "Star";
            case KeyEvent.KEYCODE_STB_INPUT:
                return "STB Input";
            case KeyEvent.KEYCODE_STB_POWER:
                return "STB Power";
            case KeyEvent.KEYCODE_SWITCH_CHARSET:
                return "Switch";
            case KeyEvent.KEYCODE_SYM:
                return "Symbol";
            case KeyEvent.KEYCODE_SYSRQ:
                return "Print Screen";
            case KeyEvent.KEYCODE_T:
                return "T";
            case KeyEvent.KEYCODE_TAB:
                return "Tab";
            case KeyEvent.KEYCODE_TV:
                return "TV";
            case KeyEvent.KEYCODE_TV_ANTENNA_CABLE:
                return "Antenna/Cable";
            case KeyEvent.KEYCODE_TV_AUDIO_DESCRIPTION:
                return "Audio Descr";
            case KeyEvent.KEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN:
                return "Audio Desc Vol-";
            case KeyEvent.KEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP:
                return "Audio Desc Vol+";
            case KeyEvent.KEYCODE_TV_CONTENTS_MENU:
                return "Contents menu";
            case KeyEvent.KEYCODE_TV_DATA_SERVICE:
                return "TV data";
            case KeyEvent.KEYCODE_TV_INPUT:
                return "TV input";
            case KeyEvent.KEYCODE_TV_INPUT_COMPONENT_1:
                return "Component 1";
            case KeyEvent.KEYCODE_TV_INPUT_COMPONENT_2:
                return "Component 2";
            case KeyEvent.KEYCODE_TV_INPUT_COMPOSITE_1:
                return "Composite 1";
            case KeyEvent.KEYCODE_TV_INPUT_COMPOSITE_2:
                return "Composite 2";
            case KeyEvent.KEYCODE_TV_INPUT_HDMI_1:
                return "HDMI 1";
            case KeyEvent.KEYCODE_TV_INPUT_HDMI_2:
                return "HDMI 2";
            case KeyEvent.KEYCODE_TV_INPUT_HDMI_3:
                return "HDMI 3";
            case KeyEvent.KEYCODE_TV_INPUT_HDMI_4:
                return "HDMI 4";
            case KeyEvent.KEYCODE_TV_INPUT_VGA_1:
                return "VGA 1";
            case KeyEvent.KEYCODE_TV_MEDIA_CONTEXT_MENU:
                return "Media menu";
            case KeyEvent.KEYCODE_TV_NETWORK:
                return "Toggle Network";
            case KeyEvent.KEYCODE_TV_NUMBER_ENTRY:
                return "Number entry";
            case KeyEvent.KEYCODE_TV_POWER:
                return "TV power";
            case KeyEvent.KEYCODE_TV_RADIO_SERVICE:
                return "Radio";
            case KeyEvent.KEYCODE_TV_SATELLITE:
                return "Satellite";
            case KeyEvent.KEYCODE_TV_SATELLITE_BS:
                return "BS";
            case KeyEvent.KEYCODE_TV_SATELLITE_CS:
                return "CS";
            case KeyEvent.KEYCODE_TV_SATELLITE_SERVICE:
                return "BS/CS";
            case KeyEvent.KEYCODE_TV_TELETEXT:
                return "Teletext";
            case KeyEvent.KEYCODE_TV_TERRESTRIAL_ANALOG:
                return "ATV";
            case KeyEvent.KEYCODE_TV_TERRESTRIAL_DIGITAL:
                return "DTV";
            case KeyEvent.KEYCODE_TV_TIMER_PROGRAMMING:
                return "TV Timer";
            case KeyEvent.KEYCODE_TV_ZOOM_MODE:
                return "Zoom mode";
            case KeyEvent.KEYCODE_U:
                return "U";
            case KeyEvent.KEYCODE_UNKNOWN:
                return "Unknown";
            case KeyEvent.KEYCODE_V:
                return "V";
            case KeyEvent.KEYCODE_VOICE_ASSIST:
                return "Voice Assist";
            case KeyEvent.KEYCODE_VOLUME_DOWN:
                return "Vol-";
            case KeyEvent.KEYCODE_VOLUME_MUTE:
                return "Mute";
            case KeyEvent.KEYCODE_VOLUME_UP:
                return "Vol+";
            case KeyEvent.KEYCODE_W:
                return "W";
            case KeyEvent.KEYCODE_WAKEUP:
                return "Wakeup";
            case KeyEvent.KEYCODE_WINDOW:
                return "Window";
            case KeyEvent.KEYCODE_X:
                return "X";
            case KeyEvent.KEYCODE_Y:
                return "Y";
            case KeyEvent.KEYCODE_YEN:
                return "Yen";
            case KeyEvent.KEYCODE_Z:
                return "Z";
            case KeyEvent.KEYCODE_ZENKAKU_HANKAKU:
                return "Zenkaku/Hankaku";
            case KeyEvent.KEYCODE_ZOOM_IN:
                return "Zoom in";
            case KeyEvent.KEYCODE_ZOOM_OUT:
                return "Zoom out";
            default:
                return Integer.toString(keyCode);
        }
    }

    /**
     * @param axisNumber Android Key number
     * @return Label
     */
    public static String getAxisLabel(int axisNumber) {
        switch (axisNumber) {
            case MotionEvent.AXIS_BRAKE:
                return "Brake";
            case MotionEvent.AXIS_DISTANCE:
                return "Distance";
            case MotionEvent.AXIS_GAS:
                return "Gas";
            case MotionEvent.AXIS_GENERIC_1:
                return "Generic 1";
            case MotionEvent.AXIS_GENERIC_10:
                return "Generic 10";
            case MotionEvent.AXIS_GENERIC_11:
                return "Generic 11";
            case MotionEvent.AXIS_GENERIC_12:
                return "Generic 12";
            case MotionEvent.AXIS_GENERIC_13:
                return "Generic 13";
            case MotionEvent.AXIS_GENERIC_14:
                return "Generic 14";
            case MotionEvent.AXIS_GENERIC_15:
                return "Generic 15";
            case MotionEvent.AXIS_GENERIC_16:
                return "Generic 16";
            case MotionEvent.AXIS_GENERIC_2:
                return "Generic 2";
            case MotionEvent.AXIS_GENERIC_3:
                return "Generic 3";
            case MotionEvent.AXIS_GENERIC_4:
                return "Generic 4";
            case MotionEvent.AXIS_GENERIC_5:
                return "Generic 5";
            case MotionEvent.AXIS_GENERIC_6:
                return "Generic 6";
            case MotionEvent.AXIS_GENERIC_7:
                return "Generic 7";
            case MotionEvent.AXIS_GENERIC_8:
                return "Generic 8";
            case MotionEvent.AXIS_GENERIC_9:
                return "Generic 9";
            case MotionEvent.AXIS_HAT_X:
                return "Hat X";
            case MotionEvent.AXIS_HAT_Y:
                return "Hat Y";
            case MotionEvent.AXIS_HSCROLL:
                return "Horizontal Scroll";
            case MotionEvent.AXIS_LTRIGGER:
                return "Left Trigger";
            case MotionEvent.AXIS_ORIENTATION:
                return "Orientation";
            case MotionEvent.AXIS_PRESSURE:
                return "Pressure";
            case MotionEvent.AXIS_RTRIGGER:
                return "Right Trigger";
            case MotionEvent.AXIS_RUDDER:
                return "Rudder";
            case MotionEvent.AXIS_RX:
                return "X Rotation";
            case MotionEvent.AXIS_RY:
                return "Y Rotation";
            case MotionEvent.AXIS_RZ:
                return "Z Rotation";
            case MotionEvent.AXIS_SIZE:
                return "Size";
            case MotionEvent.AXIS_THROTTLE:
                return "Throttle";
            case MotionEvent.AXIS_TILT:
                return "Tilt";
            case MotionEvent.AXIS_TOOL_MAJOR:
                return "ToolMajor";
            case MotionEvent.AXIS_TOOL_MINOR:
                return "ToolMinor";
            case MotionEvent.AXIS_TOUCH_MAJOR:
                return "TouchMajor";
            case MotionEvent.AXIS_TOUCH_MINOR:
                return "TouchMinor";
            case MotionEvent.AXIS_VSCROLL:
                return "Vertical Scroll";
            case MotionEvent.AXIS_WHEEL:
                return "Wheel";
            case MotionEvent.AXIS_X:
                return "X";
            case MotionEvent.AXIS_Y:
                return "Y";
            case MotionEvent.AXIS_Z:
                return "Z";
            default:
                return Integer.toString(axisNumber);
        }
    }
}
