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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetMapRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd = null;
      this.name = null;
      this.pose = null;
      this.virtual_wall = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd')) {
        this.cmd = initObj.cmd
      }
      else {
        this.cmd = '';
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('virtual_wall')) {
        this.virtual_wall = initObj.virtual_wall
      }
      else {
        this.virtual_wall = new Restrict();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetMapRequest
    // Serialize message field [cmd]
    bufferOffset = _serializer.string(obj.cmd, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [virtual_wall]
    bufferOffset = Restrict.serialize(obj.virtual_wall, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMapRequest
    let len;
    let data = new SetMapRequest(null);
    // Deserialize message field [cmd]
    data.cmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [virtual_wall]
    data.virtual_wall = Restrict.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.cmd.length;
    length += object.name.length;
    length += Restrict.getMessageSize(object.virtual_wall);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SetMapRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '116a254963ea83aa307bd4da3e81f397';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # srv definition
    
    #request constants
    
    #   "building_map",         构建地图
    #   "save_map",             保存地图
    #   "switch_map",           加载地图
    #   "delete_map",           删除地图
    #   "add_virtual_wall"      添加虚拟墙
    #   "remove_virtual_wall"   移除虚拟墙
    
    #request fields
    string                  cmd                 # 地图操作命令
    string                  name                # 地图名称
    geometry_msgs/Vector3   pose                # 加载地图的初始位姿
    robot_msg/Restrict      virtual_wall        # 设置虚拟墙
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
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
    const resolved = new SetMapRequest(null);
    if (msg.cmd !== undefined) {
      resolved.cmd = msg.cmd;
    }
    else {
      resolved.cmd = ''
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Vector3.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Vector3()
    }

    if (msg.virtual_wall !== undefined) {
      resolved.virtual_wall = Restrict.Resolve(msg.virtual_wall)
    }
    else {
      resolved.virtual_wall = new Restrict()
    }

    return resolved;
    }
};

class SetMapResponse {
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
    // Serializes a message object of type SetMapResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    // Serialize message field [message_code]
    bufferOffset = _serializer.int32(obj.message_code, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMapResponse
    let len;
    let data = new SetMapResponse(null);
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
    return 'robot_msg/SetMapResponse';
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
    const resolved = new SetMapResponse(null);
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
  Request: SetMapRequest,
  Response: SetMapResponse,
  md5sum() { return '7dbd698048cc10e20abf3ca951e09510'; },
  datatype() { return 'robot_msg/SetMap'; }
};
