// Auto-generated. Do not edit!

// (in-package robot_msg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetDeviceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.device_id = null;
      this.cmd = null;
      this.parameter1 = null;
      this.parameter2 = null;
    }
    else {
      if (initObj.hasOwnProperty('device_id')) {
        this.device_id = initObj.device_id
      }
      else {
        this.device_id = '';
      }
      if (initObj.hasOwnProperty('cmd')) {
        this.cmd = initObj.cmd
      }
      else {
        this.cmd = '';
      }
      if (initObj.hasOwnProperty('parameter1')) {
        this.parameter1 = initObj.parameter1
      }
      else {
        this.parameter1 = 0;
      }
      if (initObj.hasOwnProperty('parameter2')) {
        this.parameter2 = initObj.parameter2
      }
      else {
        this.parameter2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetDeviceRequest
    // Serialize message field [device_id]
    bufferOffset = _serializer.string(obj.device_id, buffer, bufferOffset);
    // Serialize message field [cmd]
    bufferOffset = _serializer.string(obj.cmd, buffer, bufferOffset);
    // Serialize message field [parameter1]
    bufferOffset = _serializer.int32(obj.parameter1, buffer, bufferOffset);
    // Serialize message field [parameter2]
    bufferOffset = _serializer.int32(obj.parameter2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetDeviceRequest
    let len;
    let data = new SetDeviceRequest(null);
    // Deserialize message field [device_id]
    data.device_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [cmd]
    data.cmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [parameter1]
    data.parameter1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [parameter2]
    data.parameter2 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.device_id.length;
    length += object.cmd.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SetDeviceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f106c1f9f8a8140fe8f99ed8cf38a8b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # srv definition
    
    #request constants
    # device_id:            cmd                 param1           param2
    #    "motor"
    #                       "release_motor"     0： 上电锁轴
    #                                           1: 下电松轴
    #    "humidifier"
    #                       "power"             0： 开机
    #                                           1： 关机
    #                       "fog_level"         雾量等级
    #
    #request fields
    string  device_id       # 硬件设备id
    string  cmd             # 命令id
    int32   parameter1      # 参数1
    int32   parameter2      # 参数2
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetDeviceRequest(null);
    if (msg.device_id !== undefined) {
      resolved.device_id = msg.device_id;
    }
    else {
      resolved.device_id = ''
    }

    if (msg.cmd !== undefined) {
      resolved.cmd = msg.cmd;
    }
    else {
      resolved.cmd = ''
    }

    if (msg.parameter1 !== undefined) {
      resolved.parameter1 = msg.parameter1;
    }
    else {
      resolved.parameter1 = 0
    }

    if (msg.parameter2 !== undefined) {
      resolved.parameter2 = msg.parameter2;
    }
    else {
      resolved.parameter2 = 0
    }

    return resolved;
    }
};

class SetDeviceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.message_code = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
      if (initObj.hasOwnProperty('message_code')) {
        this.message_code = initObj.message_code
      }
      else {
        this.message_code = 0;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetDeviceResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    // Serialize message field [message_code]
    bufferOffset = _serializer.int32(obj.message_code, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetDeviceResponse
    let len;
    let data = new SetDeviceResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message_code]
    data.message_code = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SetDeviceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '78947ce1619fa3db9ffcf25e821343c6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    #response constants
    
    #response fields
    bool    result          #   收到命令，成功或者失败
    int32   message_code    #   额外信息代码
    string  message         #   额外信息，e.g. for error messages
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetDeviceResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    if (msg.message_code !== undefined) {
      resolved.message_code = msg.message_code;
    }
    else {
      resolved.message_code = 0
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetDeviceRequest,
  Response: SetDeviceResponse,
  md5sum() { return '4bbe5313598b86e0231eb9e4ecd3e0c0'; },
  datatype() { return 'robot_msg/SetDevice'; }
};
