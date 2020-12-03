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

class SaveFramesRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.save_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('save_flag')) {
        this.save_flag = initObj.save_flag
      }
      else {
        this.save_flag = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SaveFramesRequest
    // Serialize message field [save_flag]
    bufferOffset = _serializer.bool(obj.save_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SaveFramesRequest
    let len;
    let data = new SaveFramesRequest(null);
    // Deserialize message field [save_flag]
    data.save_flag = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SaveFramesRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ddeab5f16c6a569b8a3051f83ab73fd4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool save_flag  # true-发送保存帧请求；false-发送停止保存帧请求
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SaveFramesRequest(null);
    if (msg.save_flag !== undefined) {
      resolved.save_flag = msg.save_flag;
    }
    else {
      resolved.save_flag = false
    }

    return resolved;
    }
};

class SaveFramesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.finish_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('finish_flag')) {
        this.finish_flag = initObj.finish_flag
      }
      else {
        this.finish_flag = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SaveFramesResponse
    // Serialize message field [finish_flag]
    bufferOffset = _serializer.bool(obj.finish_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SaveFramesResponse
    let len;
    let data = new SaveFramesResponse(null);
    // Deserialize message field [finish_flag]
    data.finish_flag = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SaveFramesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4beddee2edc9a56424e7dee2f85e7ff0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool finish_flag # true-完成标志； false-未完成标志
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SaveFramesResponse(null);
    if (msg.finish_flag !== undefined) {
      resolved.finish_flag = msg.finish_flag;
    }
    else {
      resolved.finish_flag = false
    }

    return resolved;
    }
};

module.exports = {
  Request: SaveFramesRequest,
  Response: SaveFramesResponse,
  md5sum() { return '78fa97d242f9f98c3b258ac9794f610a'; },
  datatype() { return 'robot_msg/SaveFrames'; }
};
