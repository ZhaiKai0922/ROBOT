// Auto-generated. Do not edit!

// (in-package robot_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class BaseInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.connected = null;
      this.base_device_state = null;
      this.cliff_left = null;
      this.cliff_front_left = null;
      this.cliff_front_right = null;
      this.cliff_right = null;
      this.bump_state_left = null;
      this.bump_state_right = null;
      this.chargingVol = null;
      this.chargingState = null;
      this.motor_left_err_code = null;
      this.motor_right_err_code = null;
      this.bump_enable = null;
      this.cliff_enable = null;
    }
    else {
      if (initObj.hasOwnProperty('connected')) {
        this.connected = initObj.connected
      }
      else {
        this.connected = false;
      }
      if (initObj.hasOwnProperty('base_device_state')) {
        this.base_device_state = initObj.base_device_state
      }
      else {
        this.base_device_state = 0;
      }
      if (initObj.hasOwnProperty('cliff_left')) {
        this.cliff_left = initObj.cliff_left
      }
      else {
        this.cliff_left = false;
      }
      if (initObj.hasOwnProperty('cliff_front_left')) {
        this.cliff_front_left = initObj.cliff_front_left
      }
      else {
        this.cliff_front_left = false;
      }
      if (initObj.hasOwnProperty('cliff_front_right')) {
        this.cliff_front_right = initObj.cliff_front_right
      }
      else {
        this.cliff_front_right = false;
      }
      if (initObj.hasOwnProperty('cliff_right')) {
        this.cliff_right = initObj.cliff_right
      }
      else {
        this.cliff_right = false;
      }
      if (initObj.hasOwnProperty('bump_state_left')) {
        this.bump_state_left = initObj.bump_state_left
      }
      else {
        this.bump_state_left = false;
      }
      if (initObj.hasOwnProperty('bump_state_right')) {
        this.bump_state_right = initObj.bump_state_right
      }
      else {
        this.bump_state_right = false;
      }
      if (initObj.hasOwnProperty('chargingVol')) {
        this.chargingVol = initObj.chargingVol
      }
      else {
        this.chargingVol = 0;
      }
      if (initObj.hasOwnProperty('chargingState')) {
        this.chargingState = initObj.chargingState
      }
      else {
        this.chargingState = 0;
      }
      if (initObj.hasOwnProperty('motor_left_err_code')) {
        this.motor_left_err_code = initObj.motor_left_err_code
      }
      else {
        this.motor_left_err_code = 0;
      }
      if (initObj.hasOwnProperty('motor_right_err_code')) {
        this.motor_right_err_code = initObj.motor_right_err_code
      }
      else {
        this.motor_right_err_code = 0;
      }
      if (initObj.hasOwnProperty('bump_enable')) {
        this.bump_enable = initObj.bump_enable
      }
      else {
        this.bump_enable = false;
      }
      if (initObj.hasOwnProperty('cliff_enable')) {
        this.cliff_enable = initObj.cliff_enable
      }
      else {
        this.cliff_enable = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BaseInfo
    // Serialize message field [connected]
    bufferOffset = _serializer.bool(obj.connected, buffer, bufferOffset);
    // Serialize message field [base_device_state]
    bufferOffset = _serializer.uint8(obj.base_device_state, buffer, bufferOffset);
    // Serialize message field [cliff_left]
    bufferOffset = _serializer.bool(obj.cliff_left, buffer, bufferOffset);
    // Serialize message field [cliff_front_left]
    bufferOffset = _serializer.bool(obj.cliff_front_left, buffer, bufferOffset);
    // Serialize message field [cliff_front_right]
    bufferOffset = _serializer.bool(obj.cliff_front_right, buffer, bufferOffset);
    // Serialize message field [cliff_right]
    bufferOffset = _serializer.bool(obj.cliff_right, buffer, bufferOffset);
    // Serialize message field [bump_state_left]
    bufferOffset = _serializer.bool(obj.bump_state_left, buffer, bufferOffset);
    // Serialize message field [bump_state_right]
    bufferOffset = _serializer.bool(obj.bump_state_right, buffer, bufferOffset);
    // Serialize message field [chargingVol]
    bufferOffset = _serializer.uint16(obj.chargingVol, buffer, bufferOffset);
    // Serialize message field [chargingState]
    bufferOffset = _serializer.uint8(obj.chargingState, buffer, bufferOffset);
    // Serialize message field [motor_left_err_code]
    bufferOffset = _serializer.uint16(obj.motor_left_err_code, buffer, bufferOffset);
    // Serialize message field [motor_right_err_code]
    bufferOffset = _serializer.uint16(obj.motor_right_err_code, buffer, bufferOffset);
    // Serialize message field [bump_enable]
    bufferOffset = _serializer.bool(obj.bump_enable, buffer, bufferOffset);
    // Serialize message field [cliff_enable]
    bufferOffset = _serializer.bool(obj.cliff_enable, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BaseInfo
    let len;
    let data = new BaseInfo(null);
    // Deserialize message field [connected]
    data.connected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [base_device_state]
    data.base_device_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cliff_left]
    data.cliff_left = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [cliff_front_left]
    data.cliff_front_left = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [cliff_front_right]
    data.cliff_front_right = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [cliff_right]
    data.cliff_right = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [bump_state_left]
    data.bump_state_left = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [bump_state_right]
    data.bump_state_right = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [chargingVol]
    data.chargingVol = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [chargingState]
    data.chargingState = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [motor_left_err_code]
    data.motor_left_err_code = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [motor_right_err_code]
    data.motor_right_err_code = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [bump_enable]
    data.bump_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [cliff_enable]
    data.cliff_enable = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/BaseInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3067a4347f837a8395157fa5164b6588';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg definition
    # base_device_state enum
    uint8   DEVICE_EMERGENCY    = 1 # 急停按下
    uint8   ROS_NO_CMD          = 2 # 未收到ros指令
    uint8   DRIVER_LOST         = 4 # 驱动器无响应
    uint8   IMU_LOST            = 8 # imu无响应
    uint8   RELEASE_MOTOR       = 16 # 电机下电失能
    uint8   BMS_LOST            = 32 # bms无响应
    
    # charging State enum
    uint8   UNCHARGING          = 0 # 未充电
    uint8   CHARGING            = 1 # 充电中
    uint8   DOCK_IN             = 2 # 接触，未充电
    
    bool        connected               #   底盘连接状态
    uint8       base_device_state       #   底盘基本外设状态
    bool        cliff_left              #   左跌落
    bool        cliff_front_left        #   前左
    bool        cliff_front_right       #   前右
    bool        cliff_right             #   右跌落
    bool        bump_state_left         #   左碰撞
    bool        bump_state_right        #   右碰撞
    uint16      chargingVol             #   充电电压  10mv
    uint8       chargingState           #   充电状态
    uint16      motor_left_err_code     #   电机错误码
    uint16      motor_right_err_code    #
    bool        bump_enable             #   碰撞传感器使能
    bool        cliff_enable            #   跌落使能
    #uint32[]    adc_channal             #   ADC传感器通道值，跌落传感器等
    #uint32[]    range_sensors           #   超声 tof数据等
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BaseInfo(null);
    if (msg.connected !== undefined) {
      resolved.connected = msg.connected;
    }
    else {
      resolved.connected = false
    }

    if (msg.base_device_state !== undefined) {
      resolved.base_device_state = msg.base_device_state;
    }
    else {
      resolved.base_device_state = 0
    }

    if (msg.cliff_left !== undefined) {
      resolved.cliff_left = msg.cliff_left;
    }
    else {
      resolved.cliff_left = false
    }

    if (msg.cliff_front_left !== undefined) {
      resolved.cliff_front_left = msg.cliff_front_left;
    }
    else {
      resolved.cliff_front_left = false
    }

    if (msg.cliff_front_right !== undefined) {
      resolved.cliff_front_right = msg.cliff_front_right;
    }
    else {
      resolved.cliff_front_right = false
    }

    if (msg.cliff_right !== undefined) {
      resolved.cliff_right = msg.cliff_right;
    }
    else {
      resolved.cliff_right = false
    }

    if (msg.bump_state_left !== undefined) {
      resolved.bump_state_left = msg.bump_state_left;
    }
    else {
      resolved.bump_state_left = false
    }

    if (msg.bump_state_right !== undefined) {
      resolved.bump_state_right = msg.bump_state_right;
    }
    else {
      resolved.bump_state_right = false
    }

    if (msg.chargingVol !== undefined) {
      resolved.chargingVol = msg.chargingVol;
    }
    else {
      resolved.chargingVol = 0
    }

    if (msg.chargingState !== undefined) {
      resolved.chargingState = msg.chargingState;
    }
    else {
      resolved.chargingState = 0
    }

    if (msg.motor_left_err_code !== undefined) {
      resolved.motor_left_err_code = msg.motor_left_err_code;
    }
    else {
      resolved.motor_left_err_code = 0
    }

    if (msg.motor_right_err_code !== undefined) {
      resolved.motor_right_err_code = msg.motor_right_err_code;
    }
    else {
      resolved.motor_right_err_code = 0
    }

    if (msg.bump_enable !== undefined) {
      resolved.bump_enable = msg.bump_enable;
    }
    else {
      resolved.bump_enable = false
    }

    if (msg.cliff_enable !== undefined) {
      resolved.cliff_enable = msg.cliff_enable;
    }
    else {
      resolved.cliff_enable = false
    }

    return resolved;
    }
};

// Constants for message
BaseInfo.Constants = {
  DEVICE_EMERGENCY: 1,
  ROS_NO_CMD: 2,
  DRIVER_LOST: 4,
  IMU_LOST: 8,
  RELEASE_MOTOR: 16,
  BMS_LOST: 32,
  UNCHARGING: 0,
  CHARGING: 1,
  DOCK_IN: 2,
}

module.exports = BaseInfo;
