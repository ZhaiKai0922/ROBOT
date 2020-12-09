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
    : output_x(0.0)
    , output_y(0.0)  {
    }
  forwardResult_(const ContainerAllocator& _alloc)
    : output_x(0.0)
    , output_y(0.0)  {
  (void)_alloc;
    }



   typedef double _output_x_type;
  _output_x_type output_x;

   typedef double _output_y_type;
  _output_y_type output_y;





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
  return lhs.output_x == rhs.output_x &&
    lhs.output_y == rhs.output_y;
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
    return "afbd32084a014b9ac53ccb0b88a798f5";
  }

  static const char* value(const ::forward_server::forwardResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xafbd32084a014b9aULL;
  static const uint64_t static_value2 = 0xc53ccb0b88a798f5ULL;
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
"float64 output_x\n"
"float64 output_y\n"
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
      stream.next(m.output_x);
      stream.next(m.output_y);
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
    s << indent << "output_x: ";
    Printer<double>::stream(s, indent + "  ", v.output_x);
    s << indent << "output_y: ";
    Printer<double>::stream(s, indent + "  ", v.output_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FORWARD_SERVER_MESSAGE_FORWARDRESULT_H