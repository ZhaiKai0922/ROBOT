// Generated by gencpp from file forward_server/forwardResult.msg
// DO NOT EDIT!


#ifndef FORWARD_SERVER_MESSAGE_FORWARDRESULT_H
#define FORWARD_SERVER_MESSAGE_FORWARDRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace forward_server
{
template <class ContainerAllocator>
struct forwardResult_
{
  typedef forwardResult_<ContainerAllocator> Type;

  forwardResult_()
    : output(0.0)
    , goal_stamp(0.0)  {
    }
  forwardResult_(const ContainerAllocator& _alloc)
    : output(0.0)
    , goal_stamp(0.0)  {
  (void)_alloc;
    }



   typedef double _output_type;
  _output_type output;

   typedef double _goal_stamp_type;
  _goal_stamp_type goal_stamp;





  typedef boost::shared_ptr< ::forward_server::forwardResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::forward_server::forwardResult_<ContainerAllocator> const> ConstPtr;

}; // struct forwardResult_

typedef ::forward_server::forwardResult_<std::allocator<void> > forwardResult;

typedef boost::shared_ptr< ::forward_server::forwardResult > forwardResultPtr;
typedef boost::shared_ptr< ::forward_server::forwardResult const> forwardResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::forward_server::forwardResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::forward_server::forwardResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::forward_server::forwardResult_<ContainerAllocator1> & lhs, const ::forward_server::forwardResult_<ContainerAllocator2> & rhs)
{
  return lhs.output == rhs.output &&
    lhs.goal_stamp == rhs.goal_stamp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::forward_server::forwardResult_<ContainerAllocator1> & lhs, const ::forward_server::forwardResult_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace forward_server

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::forward_server::forwardResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::forward_server::forwardResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::forward_server::forwardResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::forward_server::forwardResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::forward_server::forwardResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::forward_server::forwardResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::forward_server::forwardResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a377225fda5e62b0597f6f116b1ebe01";
  }

  static const char* value(const ::forward_server::forwardResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa377225fda5e62b0ULL;
  static const uint64_t static_value2 = 0x597f6f116b1ebe01ULL;
};

template<class ContainerAllocator>
struct DataType< ::forward_server::forwardResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "forward_server/forwardResult";
  }

  static const char* value(const ::forward_server::forwardResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::forward_server::forwardResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#result definition\n"
"float64 output\n"
"float64 goal_stamp\n"
;
  }

  static const char* value(const ::forward_server::forwardResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::forward_server::forwardResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.output);
      stream.next(m.goal_stamp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct forwardResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::forward_server::forwardResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::forward_server::forwardResult_<ContainerAllocator>& v)
  {
    s << indent << "output: ";
    Printer<double>::stream(s, indent + "  ", v.output);
    s << indent << "goal_stamp: ";
    Printer<double>::stream(s, indent + "  ", v.goal_stamp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FORWARD_SERVER_MESSAGE_FORWARDRESULT_H
