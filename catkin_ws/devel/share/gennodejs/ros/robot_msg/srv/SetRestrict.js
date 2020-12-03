// Auto-generated. Do not edit!

// (in-package robot_msg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Restrict = require('../msg/Restrict.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetRestrictRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd = null;
      this.virtual_walls = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd')) {
        this.cmd = initObj.cmd
      }
      else {
        this.cmd = '';
      }
      if (initObj.hasOwnProperty('virtual_walls')) {
        this.virtual_walls = initObj.virtual_walls
      }
      else {
        this.virtual_walls = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetRestrictRequest
    // Serialize message field [cmd]
    bufferOffset = _serializer.string(obj.cmd, buffer, bufferOffset);
    // Serialize message field [virtual_walls]
    // Serialize the length for message field [virtual_walls]
    bufferOffset = _serializer.uint32(obj.virtual_walls.length, buffer, bufferOffset);
    obj.virtual_walls.forEach((val) => {
      bufferOffset = Restrict.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetRestrictRequest
    let len;
    let data = new SetRestrictRequest(null);
    // Deserialize message field [cmd]
    data.cmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [virtual_walls]
    // Deserialize array length for message field [virtual_walls]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.virtual_walls = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.virtual_walls[i] = Restrict.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.cmd.length;
    object.virtual_walls.forEach((val) => {
      length += Restrict.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SetRestrictRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8721109f65c1f125e6ca905444ba0340';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # srv definition
    
    #request constants
    
    #   "add"      添加
    #   "remove"   移除
    #   "clean"    清除所有限制层文件
    
    #request fields
    string                  cmd                          # 操作命令
    robot_msg/Restrict[]    virtual_walls                # 虚拟墙描述
    
    ================================================================================
    MSG: robot_msg/Restrict
    # msg definition
    
    # virtual walls e.g.
    
    int32                   id          # id
    geometry_msgs/Polygon   polygon       # Clockwise
    
    
    
    ================================================================================
    MSG: geometry_msgs/Polygon
    #A specification of a polygon where the first and last points are assumed to be connected
    Point32[] points
    
    ================================================================================
    MSG: geometry_msgs/Point32
    # This contains the position of a point in free space(with 32 bits of precision).
    # It is recommeded to use Point wherever possible instead of Point32.  
    # 
    # This recommendation is to promote interoperability.  
    #
    # This message is designed to take up less space when sending
    # lots of points at once, as in the case of a PointCloud.  
    
    float32 x
    float32 y
    float32 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetRestrictRequest(null);
    if (msg.cmd !== undefined) {
      resolved.cmd = msg.cmd;
    }
    else {
      resolved.cmd = ''
    }

    if (msg.virtual_walls !== undefined) {
      resolved.virtual_walls = new Array(msg.virtual_walls.length);
      for (let i = 0; i < resolved.virtual_walls.length; ++i) {
        resolved.virtual_walls[i] = Restrict.Resolve(msg.virtual_walls[i]);
      }
    }
    else {
      resolved.virtual_walls = []
    }

    return resolved;
    }
};

class SetRestrictResponse {
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
    // Serializes a message object of type SetRestrictResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    // Serialize message field [message_code]
    bufferOffset = _serializer.int32(obj.message_code, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetRestrictResponse
    let len;
    let data = new SetRestrictResponse(null);
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
    return 'robot_msg/SetRestrictResponse';
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
    bool    result          #   执行结果，成功或者失败
    int32   message_code    #   额外信息代码
    string  message         #   额外信息，e.g. for error messages
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetRestrictResponse(null);
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
  Request: SetRestrictRequest,
  Response: SetRestrictResponse,
  md5sum() { return '1f3913cc9796519611b8018d97267e81'; },
  datatype() { return 'robot_msg/SetRestrict'; }
};
