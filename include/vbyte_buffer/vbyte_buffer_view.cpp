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
VByteBufferView::VByteBufferView( const char* buf, const size_t len ) noexcept
    : _buffer   ( buf )
    , _remained ( len )
{}
//=======================================================================================
VByteBufferView::VByteBufferView( const signed char* buf, const size_t len ) noexcept
    : _buffer   ( any_cast<char>(buf) )
    , _remained ( len )
{}
//=======================================================================================
VByteBufferView::VByteBufferView( const unsigned char *buf, const size_t len ) noexcept
    : _buffer   ( any_cast<char>(buf) )
    , _remained ( len )
{}
//=======================================================================================


//=======================================================================================
const char * VByteBufferView::data() const noexcept
{
    return _buffer;
}
//=======================================================================================
const int8_t * VByteBufferView::sdata() const noexcept
{
    return any_cast<int8_t>( _buffer );
}
//=======================================================================================
const uint8_t * VByteBufferView::udata() const noexcept
{
    return any_cast<uint8_t>( _buffer );
}
//=======================================================================================
size_t VByteBufferView::remained() const noexcept
{
    return _remained;
}
//=======================================================================================
bool VByteBufferView::finished() const noexcept
{
    return _remained == 0;
}
//=======================================================================================
void VByteBufferView::omit( const size_t count )
{
    auto sz = std::min( count, remained() );

    _buffer   += sz;
    _remained -= sz;
}
//=======================================================================================


//=======================================================================================
std::string VByteBufferView::show_string( const size_t sz ) const
{
    if ( _remained < sz )
        throw std::out_of_range( "vbyte_buffer_view::show_string: not enough data" );


    return std::string( _buffer, sz );
}
//=======================================================================================
VByteBuffer VByteBufferView::show_buffer( const size_t sz ) const
{
    return VByteBuffer{ show_string( sz ) };
}
//=======================================================================================
VByteBuffer VByteBufferView::show_tail() const
{
    return show_buffer( remained() );
}
//=======================================================================================


//=======================================================================================
std::string VByteBufferView::string( const size_t sz )
{
    auto res = show_string( sz );

    _buffer   += sz;
    _remained -= sz;

    return res;
}
//=======================================================================================
VByteBuffer VByteBufferView::buffer( const size_t sz )
{
    return VByteBuffer{ string(sz) };
}
//=======================================================================================
VByteBuffer VByteBufferView::tail()
{
    return buffer( remained() );
}
//=======================================================================================


//=======================================================================================
char VByteBufferView::show_ch() const
{
    return show_LE<char>();
}
//=======================================================================================
int8_t VByteBufferView::show_i8() const
{
    return show_LE<int8_t>();
}
//=======================================================================================
uint8_t VByteBufferView::show_u8() const
{
    return show_LE<uint8_t>();
}
//=======================================================================================
int16_t VByteBufferView::show_i16_LE() const
{
    return show_LE<int16_t>();
}
//=======================================================================================
int16_t VByteBufferView::show_i16_BE() const
{
    return show_BE<int16_t>();
}
//=======================================================================================
uint16_t VByteBufferView::show_u16_LE() const
{
    return show_LE<uint16_t>();
}
//=======================================================================================
uint16_t VByteBufferView::show_u16_BE() const
{
    return show_BE<uint16_t>();
}
//=======================================================================================
int32_t VByteBufferView::show_i32_LE() const
{
    return show_LE<int32_t>();
}
//=======================================================================================
int32_t VByteBufferView::show_i32_BE() const
{
    return show_BE<int32_t>();
}
//=======================================================================================
uint32_t VByteBufferView::show_u32_LE() const
{
    return show_LE<uint32_t>();
}
//=======================================================================================
uint32_t VByteBufferView::show_u32_BE() const
{
    return show_BE<uint32_t>();
}
//=======================================================================================
int64_t VByteBufferView::show_i64_LE() const
{
    return show_LE<int64_t>();
}
//=======================================================================================
int64_t VByteBufferView::show_i64_BE() const
{
    return show_BE<int64_t>();
}
//=======================================================================================
uint64_t VByteBufferView::show_u64_LE() const
{
    return show_LE<uint64_t>();
}
//=======================================================================================
uint64_t VByteBufferView::show_u64_BE() const
{
    return show_BE<uint64_t>();
}
//=======================================================================================
float VByteBufferView::show_float_LE() const
{
    return show_LE<float>();
}
//=======================================================================================
float VByteBufferView::show_float_BE() const
{
    return show_BE<float>();
}
//=======================================================================================
double VByteBufferView::show_double_LE() const
{
    return show_LE<double>();
}
//=======================================================================================
double VByteBufferView::show_double_BE() const
{
    return show_BE<double>();
}
//=======================================================================================


//=======================================================================================
char VByteBufferView::ch()
{
    return LE<char>();
}
//=======================================================================================
int8_t VByteBufferView::i8()
{
    return LE<int8_t>();
}
//=======================================================================================
uint8_t VByteBufferView::u8()
{
    return LE<uint8_t>();
}
//=======================================================================================
int16_t VByteBufferView::i16_LE()
{
    return LE<int16_t>();
}
//=======================================================================================
int16_t VByteBufferView::i16_BE()
{
    return BE<int16_t>();
}
//=======================================================================================
uint16_t VByteBufferView::u16_LE()
{
    return LE<uint16_t>();
}
//=======================================================================================
uint16_t VByteBufferView::u16_BE()
{
    return BE<uint16_t>();
}
//=======================================================================================
int32_t VByteBufferView::i32_LE()
{
    return LE<int32_t>();
}
//=======================================================================================
int32_t VByteBufferView::i32_BE()
{
    return BE<int32_t>();
}
//=======================================================================================
uint32_t VByteBufferView::u32_LE()
{
    return LE<uint32_t>();
}
//=======================================================================================
uint32_t VByteBufferView::u32_BE()
{
    return BE<uint32_t>();
}
//=======================================================================================
int64_t VByteBufferView::i64_LE()
{
    return LE<int64_t>();
}
//=======================================================================================
int64_t VByteBufferView::i64_BE()
{
    return BE<int64_t>();
}
//=======================================================================================
uint64_t VByteBufferView::u64_LE()
{
    return LE<uint64_t>();
}
//=======================================================================================
uint64_t VByteBufferView::u64_BE()
{
    return BE<uint64_t>();
}
//=======================================================================================
float VByteBufferView::float_LE()
{
    return LE<float>();
}
//=======================================================================================
float VByteBufferView::float_BE()
{
    return BE<float>();
}
//=======================================================================================
double VByteBufferView::double_LE()
{
    return LE<double>();
}
//=======================================================================================
double VByteBufferView::double_BE()
{
    return BE<double>();
}
//=======================================================================================
