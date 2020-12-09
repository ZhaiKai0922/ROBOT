// Generated by gencpp from file forward_server/forwardGoal.msg
// DO NOT EDIT!


#ifndef FORWARD_SERVER_MESSAGE_FORWARDGOAL_H
#define FORWARD_SERVER_MESSAGE_FORWARDGOAL_H


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
struct forwardGoal_
{
  typedef forwardGoal_<ContainerAllocator> Type;

  forwardGoal_()
    : line(0.0)
    , linear_velocity(0.0)
    , time(0.0)  {
    }
  forwardGoal_(const ContainerAllocator& _alloc)
    : line(0.0)
    , linear_velocity(0.0)
    , time(0.0)  {
  (void)_alloc;
    }



   typedef double _line_type;
  _line_type line;

   typedef double _linear_velocity_type;
  _linear_velocity_type linear_velocity;

   typedef double _time_type;
  _time_type time;





  typedef boost::shared_ptr< ::forward_server::forwardGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::forward_server::forwardGoal_<ContainerAllocator> const> ConstPtr;

}; // struct forwardGoal_

typedef ::forward_server::forwardGoal_<std::allocator<void> > forwardGoal;

typedef boost::shared_ptr< ::forward_server::forwardGoal > forwardGoalPtr;
typedef boost::shared_ptr< ::forward_server::forwardGoal const> forwardGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::forward_server::forwardGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::forward_server::forwardGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::forward_server::forwardGoal_<ContainerAllocator1> & lhs, const ::forward_server::forwardGoal_<ContainerAllocator2> & rhs)
{
  return lhs.line == rhs.line &&
    lhs.linear_velocity == rhs.linear_velocity &&
    lhs.time == rhs.time;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::forward_server::forwardGoal_<ContainerAllocator1> & lhs, const ::forward_server::forwardGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace forward_server

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::forward_server::forwardGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::forward_server::forwardGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::forward_server::forwardGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::forward_server::forwardGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::forward_server::forwardGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::forward_server::forwardGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::forward_server::forwardGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5a5d7ce8423f13d47048e12b1e3362e0";
  }

  static const char* value(const ::forward_server::forwardGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5a5d7ce8423f13d4ULL;
  static const uint64_t static_value2 = 0x7048e12b1e3362e0ULL;
};

template<class ContainerAllocator>
struct DataType< ::forward_server::forwardGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "forward_server/forwardGoal";
  }

  static const char* value(const ::forward_server::forwardGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::forward_server::forwardGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#goal definition\n"
"float64 line\n"
"float64 linear_velocity\n"
"float64 time\n"
;
  }

  static const char* value(const ::forward_server::forwardGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::forward_server::forwardGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.line);
      stream.next(m.linear_velocity);
      stream.next(m.time);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct forwardGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::forward_server::forwardGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::forward_server::forwardGoal_<ContainerAllocator>& v)
  {
    s << indent << "line: ";
    Printer<double>::stream(s, indent + "  ", v.line);
    s << indent << "linear_velocity: ";
    Printer<double>::stream(s, indent + "  ", v.linear_velocity);
    s << indent << "time: ";
    Printer<double>::stream(s, indent + "  ", v.time);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FORWARD_SERVER_MESSAGE_FORWARDGOAL_H