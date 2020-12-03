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

class FeedBack {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.feedback = null;
      this.feedbackStr = null;
    }
    else {
      if (initObj.hasOwnProperty('feedback')) {
        this.feedback = initObj.feedback
      }
      else {
        this.feedback = 0;
      }
      if (initObj.hasOwnProperty('feedbackStr')) {
        this.feedbackStr = initObj.feedbackStr
      }
      else {
        this.feedbackStr = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FeedBack
    // Serialize message field [feedback]
    bufferOffset = _serializer.int32(obj.feedback, buffer, bufferOffset);
    // Serialize message field [feedbackStr]
    bufferOffset = _serializer.string(obj.feedbackStr, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FeedBack
    let len;
    let data = new FeedBack(null);
    // Deserialize message field [feedback]
    data.feedback = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [feedbackStr]
    data.feedbackStr = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.feedbackStr.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/FeedBack';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0f9d77a5ebec864d5c1481f385477d58';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg definition
    
    # feedback enum
    int32 NONE              = 0 # none
                                # others...
    
    int32           feedback 	    # result feedback
    string 		    feedbackStr  	# feedback to string
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FeedBack(null);
    if (msg.feedback !== undefined) {
      resolved.feedback = msg.feedback;
    }
    else {
      resolved.feedback = 0
    }

    if (msg.feedbackStr !== undefined) {
      resolved.feedbackStr = msg.feedbackStr;
    }
    else {
      resolved.feedbackStr = ''
    }

    return resolved;
    }
};

// Constants for message
FeedBack.Constants = {
  NONE: 0,
}

module.exports = FeedBack;
