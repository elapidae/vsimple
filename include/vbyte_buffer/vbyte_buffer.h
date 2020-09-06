/*! \file vbyte_buffer_view.h
 *
 * BYTE BUFFER FOR COMPOSING AND READING BINARY DATA, but with text buns.
 *
 * Read the API!
 *
 * The class does not have the task of providing a comprehensive interface for working with strings
 * (lesson from last time, VString works well, but heavy).
 *
 * The main task: compilation of data in binary protocols, but so that twice
 * get up, made a group of methods for processing text data.
 *
 * \authors Alexander Gromtsev
 * \date December 2019
 */

//=======================================================================================

#ifndef VBYTE_BUFFER_H
#define VBYTE_BUFFER_H

//=======================================================================================

#include "vcompiler_traits.h"

#include <string>
#include <vector>
#include <sstream>
#include <stdexcept>

//=======================================================================================
class VByteBufferView;
//=======================================================================================
class VByteBuffer
{
public:

    using vector = std::vector<VByteBuffer>;

    //-----------------------------------------------------------------------------------

    VByteBuffer();
    VByteBuffer( std::string seed );
    VByteBuffer( const char* seed );

    //-----------------------------------------------------------------------------------

    bool operator == ( const VByteBuffer& rhs ) const noexcept;
    bool operator != ( const VByteBuffer& rhs ) const noexcept;

    VByteBuffer & operator += ( const VByteBuffer& rhs );

    //-----------------------------------------------------------------------------------

    //! Return buffer as string.
    const std::string & str() const noexcept;

    //! Implicit conversion of VByteBuffer to std::string.
    operator const std::string&() const noexcept;

    size_t size()  const noexcept;
    bool   empty() const noexcept;

    //! Direct memory access of the buffer, for convenience, but be careful.
    const char    * data()  const noexcept;
    const int8_t  * sdata() const noexcept;
    const uint8_t * udata() const noexcept;

    //! NB! Never change the buffer while using the view!
    VByteBufferView view() const;

    //! Clearing the buffer.
    void clear();

    //-----------------------------------------------------------------------------------

    //! Group of basic methods: append

    //! Append Little Endian
    template<typename T>
    typename std::enable_if<std::is_arithmetic<T>::value, void>::type
    append_LE( T val );

    //! Append Big Endian
    template<typename T>
    typename std::enable_if<std::is_arithmetic<T>::value, void>::type
    append_BE( T val );

    void append( unsigned char val );
    void append( signed char   val );
    void append( char          val );
    void append( const std::string& val );
    void append( const char* val );

    //-----------------------------------------------------------------------------------

    //! Cut off count bytes from different sides.
    //! Exceptions are not thrown, if the size is larger, the buffer will be cleared.
    void chop_front ( const size_t count );
    void chop_back  ( const size_t count );

    //! NB! If count is larger than the current size, a std::length_error
    //! will be thrown because there is nothing to fill.
    void resize( const size_t count );

    //! Return count bytes from the left.
    VByteBuffer left ( const size_t count ) const;

    //! Return count bytes from the right.
    VByteBuffer right  ( const size_t count ) const;

    //! Return count bytes starting at buffer position pos.
    VByteBuffer middle ( const size_t pos,
                         const size_t count = std::string::npos ) const;

    //-----------------------------------------------------------------------------------

    //! Checking if a buffer starts with a given line.
    bool starts_with ( const std::string& what ) const;

    //! Checking if a buffer ends with a given string.
    bool ends_with ( const std::string& what ) const;

    //-----------------------------------------------------------------------------------

    template <typename T> T to_any() const;

    //! A set of methods that convert the buffer string to the required format.

    int    to_int()    const; { return to_any<int>();        }
uint   to_uint()   const; { return to_any<uint>();       }
long   to_long()   const; { return to_any<long>();       }
ulong  to_ulong()  const; { return to_any<ulong>();      }
float  to_float()  const; { return to_any<float>();      }
double to_double() const; { return to_any<double>();     }

int8_t  to_i8() const;  { return to_any<int8_t>();     }
uint8_t to_u8() const;  { return to_any<uint8_t>();    }

int16_t  to_i16() const;   { return to_any<int16_t>();    }
uint16_t to_u16() const;   { return to_any<uint16_t>();   }

int32_t  to_i32() const;   { return to_any<int32_t>();    }
uint32_t to_u32() const;   { return to_any<uint32_t>();   }

int64_t  to_i64() const;   { return to_any<int64_t>();    }
uint64_t to_u64() const;   { return to_any<uint64_t>();   }

//-----------------------------------------------------------------------------------

//! Case insensitive, all characters except hex are ignored.
//! NB! If the number of valid characters is odd, the first is considered to be zero.
static  VByteBuffer from_hex(  const std::string& src );
VByteBuffer from_hex() const;

//! Solid text, lowercase.
VByteBuffer tohex () const;

//! Solid text, in capitals.
VByteBuffer toHex () const;

//! With delimiters, lowercase.
VByteBuffer to_hex( char separator = ' ' ) const;

//! With delimiters, in capitals.
VByteBuffer to_Hex( char separator = ' ' ) const;

static bool is_hex_symbol( char ch ) noexcept;

//-----------------------------------------------------------------------------------
//! NB! The split methods do not append a null value to the end if the separator
//! was the last character.
//! \example split("A|B", '|') == split("A|B|", '|')
//! But for an empty input string, an empty vector will be returned:
//! \example split("", '|') == vector{},
//! \example split("|", '|') == vector{vbyte_buffer{}};

//! split() cuts by splitter, it also captures empty ones.
static vector split( const std::string& data, char splitter );

vector split( char splitter ) const;

//! Cuts text using all stripes separators (std :: isspace).
//! Throws out all the empty ones, if we cut it like that, anyway, we work with text.
vector split_by_spaces() const;

//! Strips off leading and trailing spaces.
VByteBuffer & trim_spaces();

//-----------------------------------------------------------------------------------

//! Turns bytes inside out, i.e. <LE> <-> <BE>.
template<typename T>
static typename std::enable_if<std::is_arithmetic<T>::value, T>::type
reverse_T( T src ) noexcept;

//-----------------------------------------------------------------------------------

private:

std::string _buf;

//-----------------------------------------------------------------------------------

template<typename T> void _append( const T& val );

};
//=======================================================================================


//=======================================================================================

std::ostream & operator << ( std::ostream& os, const VByteBuffer& buf );

VByteBuffer operator + ( const VByteBuffer& lhs, const VByteBuffer& rhs );

//=======================================================================================


//=======================================================================================
//      Implememntation
//=======================================================================================
//  NB! Этот метод скопипащен из vcat::from_text.
//  Пока что, волевым усилием принято держать этот код и там и там.
template <typename T>
T VByteBuffer::to_any() const
{
    std::istringstream ss( _buf );
    T res;
    ss >> res;

    if ( ss.fail() || ss.bad() )
        throw std::runtime_error( std::string("Error during interpretation text: '") +
                                  _buf + "', in function " + __PRETTY_FUNCTION__ );

    return res;
}
//=======================================================================================

#pragma GCC diagnostic push
#ifdef V_PRAGMA_GCC_KNOWS_IMPLICIT_FALLTHROUGH
#pragma GCC diagnostic ignored "-Wimplicit-fallthrough"
#endif
template<typename T>
typename std::enable_if< std::is_arithmetic<T>::value, T>::type
VByteBuffer::reverse_T( T val ) noexcept
{
    static_assert ( sizeof(T) <= 8, "Cannot reverse values more than 8 bytes." );

    auto *ch = static_cast<char*>( static_cast<void*>(&val) );
    constexpr auto tsize = sizeof(T);

    switch( tsize )
    {
        case 8: std::swap( ch[3], ch[tsize-4] );
            std::swap( ch[2], ch[tsize-3] );

        case 4: std::swap( ch[1], ch[tsize-2] );

        case 2: std::swap( ch[0], ch[tsize-1] );
    }

    return val;
}
#pragma GCC diagnostic pop
//=======================================================================================
template<typename T>
void VByteBuffer::_append( const T& val )
{
    const char* ptr = static_cast<const char*>( static_cast<const void*>(&val) );
    _buf.append( ptr, sizeof(T) );
}
//=======================================================================================
template<typename T>
typename std::enable_if<std::is_arithmetic<T>::value, void>::type
VByteBuffer::append_LE( T val )
{
#if BYTE_ORDER == BIG_ENDIAN
    val = vbyte_buffer::reverse_T( val );
#endif
    _append( val );
}
//=======================================================================================
template<typename T>
typename std::enable_if<std::is_arithmetic<T>::value, void>::type
VByteBuffer::append_BE( T val )
{
#if BYTE_ORDER == LITTLE_ENDIAN
    val = VByteBuffer::reverse_T( val );
#endif
    _append( val );
}
//=======================================================================================

#endif // VBYTE_BUFFER_H
