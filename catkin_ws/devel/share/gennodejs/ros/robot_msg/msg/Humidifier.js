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

class Humidifier {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.power_state = null;
      this.fog_level = null;
      this.warn_water_low = null;
    }
    else {
      if (initObj.hasOwnProperty('power_state')) {
        this.power_state = initObj.power_state
      }
      else {
        this.power_state = 0;
      }
      if (initObj.hasOwnProperty('fog_level')) {
        this.fog_level = initObj.fog_level
      }
      else {
        this.fog_level = 0;
      }
      if (initObj.hasOwnProperty('warn_water_low')) {
        this.warn_water_low = initObj.warn_water_low
      }
      else {
        this.warn_water_low = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Humidifier
    // Serialize message field [power_state]
    bufferOffset = _serializer.uint8(obj.power_state, buffer, bufferOffset);
    // Serialize message field [fog_level]
    bufferOffset = _serializer.uint8(obj.fog_level, buffer, bufferOffset);
    // Serialize message field [warn_water_low]
    bufferOffset = _serializer.uint8(obj.warn_water_low, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Humidifier
    let len;
    let data = new Humidifier(null);
    // Deserialize message field [power_state]
    data.power_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fog_level]
    data.fog_level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [warn_water_low]
    data.warn_water_low = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/Humidifier';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f6577daff9e5c3c518197df2a56537ef';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg definition
    
    uint8   power_state     # 0 关机 1 开机
    uint8   fog_level       # 当前设置雾量等级      1~7挡
    uint8   warn_water_low      # 低水位告警状态        0 正常 1 告警
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Humidifier(null);
    if (msg.power_state !== undefined) {
      resolved.power_state = msg.power_state;
    }
    else {
      resolved.power_state = 0
    }

    if (msg.fog_level !== undefined) {
      resolved.fog_level = msg.fog_level;
    }
    else {
      resolved.fog_level = 0
    }

    if (msg.warn_water_low !== undefined) {
      resolved.warn_water_low = msg.warn_water_low;
    }
    else {
      resolved.warn_water_low = 0
    }

    return resolved;
    }
};

module.exports = Humidifier;
