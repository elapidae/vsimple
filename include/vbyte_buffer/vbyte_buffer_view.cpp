/*! \file vbyte_buffer_view.cpp
 * \authors Alexander Gromtsev
 * \date December 2019
 */

//=======================================================================================

#include "vbyte_buffer_view.h"

//=======================================================================================
template<typename Res, typename T>
const Res * any_cast( const T* p )
{
    return static_cast<const Res*>( static_cast<const void*>(p) );
}
//=======================================================================================


//=======================================================================================
vbyte_buffer_view::vbyte_buffer_view( const char* buf, const size_t len ) noexcept
    : _buffer   ( buf )
    , _remained ( len )
{}
//=======================================================================================
vbyte_buffer_view::vbyte_buffer_view( const signed char* buf, const size_t len ) noexcept
    : _buffer   ( any_cast<char>(buf) )
    , _remained ( len )
{}
//=======================================================================================
vbyte_buffer_view::vbyte_buffer_view( const unsigned char *buf, const size_t len ) noexcept
    : _buffer   ( any_cast<char>(buf) )
    , _remained ( len )
{}
//=======================================================================================


//=======================================================================================
const char * vbyte_buffer_view::data() const noexcept
{
    return _buffer;
}
//=======================================================================================
const int8_t * vbyte_buffer_view::sdata() const noexcept
{
    return any_cast<int8_t>( _buffer );
}
//=======================================================================================
const uint8_t * vbyte_buffer_view::udata() const noexcept
{
    return any_cast<uint8_t>( _buffer );
}
//=======================================================================================
size_t vbyte_buffer_view::remained() const noexcept
{
    return _remained;
}
//=======================================================================================
bool vbyte_buffer_view::finished() const noexcept
{
    return _remained == 0;
}
//=======================================================================================
void vbyte_buffer_view::omit( const size_t count )
{
    auto sz = std::min( count, remained() );

    _buffer   += sz;
    _remained -= sz;
}
//=======================================================================================


//=======================================================================================
std::string vbyte_buffer_view::show_string( const size_t sz ) const
{
    if ( _remained < sz )
        throw std::out_of_range( "vbyte_buffer_view::show_string: not enough data" );


    return std::string( _buffer, sz );
}
//=======================================================================================
vbyte_buffer vbyte_buffer_view::show_buffer( const size_t sz ) const
{
    return vbyte_buffer{ show_string( sz ) };
}
//=======================================================================================
vbyte_buffer vbyte_buffer_view::show_tail() const
{
    return show_buffer( remained() );
}
//=======================================================================================


//=======================================================================================
std::string vbyte_buffer_view::string( const size_t sz )
{
    auto res = show_string( sz );

    _buffer   += sz;
    _remained -= sz;

    return res;
}
//=======================================================================================
vbyte_buffer vbyte_buffer_view::buffer( const size_t sz )
{
    return vbyte_buffer{ string(sz) };
}
//=======================================================================================
vbyte_buffer vbyte_buffer_view::tail()
{
    return buffer( remained() );
}
//=======================================================================================


//=======================================================================================
char vbyte_buffer_view::show_ch() const
{
    return show_LE<char>();
}
//=======================================================================================
int8_t vbyte_buffer_view::show_i8() const
{
    return show_LE<int8_t>();
}
//=======================================================================================
uint8_t vbyte_buffer_view::show_u8() const
{
    return show_LE<uint8_t>();
}
//=======================================================================================
int16_t vbyte_buffer_view::show_i16_LE() const
{
    return show_LE<int16_t>();
}
//=======================================================================================
int16_t vbyte_buffer_view::show_i16_BE() const
{
    return show_BE<int16_t>();
}
//=======================================================================================
uint16_t vbyte_buffer_view::show_u16_LE() const
{
    return show_LE<uint16_t>();
}
//=======================================================================================
uint16_t vbyte_buffer_view::show_u16_BE() const
{
    return show_BE<uint16_t>();
}
//=======================================================================================
int32_t vbyte_buffer_view::show_i32_LE() const
{
    return show_LE<int32_t>();
}
//=======================================================================================
int32_t vbyte_buffer_view::show_i32_BE() const
{
    return show_BE<int32_t>();
}
//=======================================================================================
uint32_t vbyte_buffer_view::show_u32_LE() const
{
    return show_LE<uint32_t>();
}
//=======================================================================================
uint32_t vbyte_buffer_view::show_u32_BE() const
{
    return show_BE<uint32_t>();
}
//=======================================================================================
int64_t vbyte_buffer_view::show_i64_LE() const
{
    return show_LE<int64_t>();
}
//=======================================================================================
int64_t vbyte_buffer_view::show_i64_BE() const
{
    return show_BE<int64_t>();
}
//=======================================================================================
uint64_t vbyte_buffer_view::show_u64_LE() const
{
    return show_LE<uint64_t>();
}
//=======================================================================================
uint64_t vbyte_buffer_view::show_u64_BE() const
{
    return show_BE<uint64_t>();
}
//=======================================================================================
float vbyte_buffer_view::show_float_LE() const
{
    return show_LE<float>();
}
//=======================================================================================
float vbyte_buffer_view::show_float_BE() const
{
    return show_BE<float>();
}
//=======================================================================================
double vbyte_buffer_view::show_double_LE() const
{
    return show_LE<double>();
}
//=======================================================================================
double vbyte_buffer_view::show_double_BE() const
{
    return show_BE<double>();
}
//=======================================================================================


//=======================================================================================
char vbyte_buffer_view::ch()
{
    return LE<char>();
}
//=======================================================================================
int8_t vbyte_buffer_view::i8()
{
    return LE<int8_t>();
}
//=======================================================================================
uint8_t vbyte_buffer_view::u8()
{
    return LE<uint8_t>();
}
//=======================================================================================
int16_t vbyte_buffer_view::i16_LE()
{
    return LE<int16_t>();
}
//=======================================================================================
int16_t vbyte_buffer_view::i16_BE()
{
    return BE<int16_t>();
}
//=======================================================================================
uint16_t vbyte_buffer_view::u16_LE()
{
    return LE<uint16_t>();
}
//=======================================================================================
uint16_t vbyte_buffer_view::u16_BE()
{
    return BE<uint16_t>();
}
//=======================================================================================
int32_t vbyte_buffer_view::i32_LE()
{
    return LE<int32_t>();
}
//=======================================================================================
int32_t vbyte_buffer_view::i32_BE()
{
    return BE<int32_t>();
}
//=======================================================================================
uint32_t vbyte_buffer_view::u32_LE()
{
    return LE<uint32_t>();
}
//=======================================================================================
uint32_t vbyte_buffer_view::u32_BE()
{
    return BE<uint32_t>();
}
//=======================================================================================
int64_t vbyte_buffer_view::i64_LE()
{
    return LE<int64_t>();
}
//=======================================================================================
int64_t vbyte_buffer_view::i64_BE()
{
    return BE<int64_t>();
}
//=======================================================================================
uint64_t vbyte_buffer_view::u64_LE()
{
    return LE<uint64_t>();
}
//=======================================================================================
uint64_t vbyte_buffer_view::u64_BE()
{
    return BE<uint64_t>();
}
//=======================================================================================
float vbyte_buffer_view::float_LE()
{
    return LE<float>();
}
//=======================================================================================
float vbyte_buffer_view::float_BE()
{
    return BE<float>();
}
//=======================================================================================
double vbyte_buffer_view::double_LE()
{
    return LE<double>();
}
//=======================================================================================
double vbyte_buffer_view::double_BE()
{
    return BE<double>();
}
//=======================================================================================
