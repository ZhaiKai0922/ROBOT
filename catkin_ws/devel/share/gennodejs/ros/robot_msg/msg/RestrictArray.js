// Auto-generated. Do not edit!

// (in-package robot_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Restrict = require('./Restrict.js');

//-----------------------------------------------------------

class RestrictArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.virtual_walls = null;
    }
    else {
      if (initObj.hasOwnProperty('virtual_walls')) {
        this.virtual_walls = initObj.virtual_walls
      }
      else {
        this.virtual_walls = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RestrictArray
    // Serialize message field [virtual_walls]
    // Serialize the length for message field [virtual_walls]
    bufferOffset = _serializer.uint32(obj.virtual_walls.length, buffer, bufferOffset);
    obj.virtual_walls.forEach((val) => {
      bufferOffset = Restrict.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RestrictArray
    let len;
    let data = new RestrictArray(null);
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
    object.virtual_walls.forEach((val) => {
      length += Restrict.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/RestrictArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd730ec60ad06fc558c39d4bf2bff233e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg definition
    
    # virtual walls e.g.
    
    robot_msg/Restrict[]  virtual_walls                # 虚拟墙描述
    
    
    
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
    const resolved = new RestrictArray(null);
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

module.exports = RestrictArray;
