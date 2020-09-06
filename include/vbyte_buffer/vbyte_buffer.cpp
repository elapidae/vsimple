/*! \file vbyte_buffer.cpp
 * \authors Alexander Gromtsev
 * \date December 2019
 */

//=======================================================================================

#include "vbyte_buffer.h"
#include "vbyte_buffer_view.h"

#include <algorithm>

//=======================================================================================

using namespace std;

//=======================================================================================
VByteBuffer::VByteBuffer()
{}
//=======================================================================================
VByteBuffer::VByteBuffer( std::string seed )
    : _buf( std::move( seed ) )
{}
//=======================================================================================
VByteBuffer::VByteBuffer( const char* seed )
    : _buf( seed )
{}
//=======================================================================================


//=======================================================================================
bool VByteBuffer::operator ==( const VByteBuffer& rhs ) const noexcept
{
    return _buf == rhs._buf;
}
//=======================================================================================
bool VByteBuffer::operator !=( const VByteBuffer& rhs ) const noexcept
{
    return _buf != rhs._buf;
}
//=======================================================================================
VByteBuffer& VByteBuffer::operator += ( const VByteBuffer& rhs )
{
    _buf += rhs._buf;
    return *this;
}
//=======================================================================================


//=======================================================================================
const std::string & VByteBuffer::str() const noexcept
{
    return _buf;
}
//=======================================================================================
VByteBuffer::operator const std::string&() const noexcept
{
    return _buf;
}
//=======================================================================================
size_t VByteBuffer::size() const noexcept
{
    return _buf.size();
}
//=======================================================================================
bool VByteBuffer::empty() const noexcept
{
    return _buf.empty();
}
//=======================================================================================
const char *VByteBuffer::data() const noexcept
{
    return _buf.data();
}
//=======================================================================================
const int8_t *VByteBuffer::sdata() const noexcept
{
    return static_cast<const int8_t*>( static_cast<const void*>(data()) );
}
//=======================================================================================
const uint8_t *VByteBuffer::udata() const noexcept
{
    return static_cast<const uint8_t*>( static_cast<const void*>(data()) );
}
//=======================================================================================
VByteBufferView VByteBuffer::view() const
{
    return { _buf.data(), _buf.size() };
}
//=======================================================================================
void VByteBuffer::clear()
{
    _buf.clear();
}
//=======================================================================================


//      appends
//=======================================================================================
void VByteBuffer::append( unsigned char val )
{
    _buf.push_back( char(val) );
}
//=======================================================================================
void VByteBuffer::append( signed char val )
{
    _buf.push_back( char(val) );
}
//=======================================================================================
void VByteBuffer::append( char val )
{
    _buf.push_back( val );
}
//=======================================================================================
void VByteBuffer::append( const std::string& val )
{
    _buf.append( val );
}
//=======================================================================================
void VByteBuffer::append( const char * val )
{
    _buf.append( val );
}
//=======================================================================================
//      chop, resize, left, right, middle
//=======================================================================================
void VByteBuffer::chop_front( size_t count )
{
    _buf.erase( 0, count );
}
//=======================================================================================
void VByteBuffer::chop_back( size_t count )
{
    auto new_size = _buf.size() > count
                        ? _buf.size() - count
                        : 0;

    _buf.resize( new_size );
}
//=======================================================================================
void VByteBuffer::resize( size_t count )
{
    if ( _buf.size() < count )
        throw std::length_error( string("vbyte_buffer::resize(" +
                                 to_string(count) + "), but size = " +
                                 to_string(_buf.size())) );

    _buf.resize( count );
}
//=======================================================================================
VByteBuffer VByteBuffer::left( size_t count ) const
{
    return VByteBuffer{ _buf.substr(0,count) };
}
//=======================================================================================
VByteBuffer VByteBuffer::right( size_t count ) const
{
    if ( _buf.size() < count )
        return VByteBuffer{ _buf };

    return VByteBuffer{ _buf.substr(_buf.size() - count) };
}
//=======================================================================================
VByteBuffer VByteBuffer::middle( size_t pos, size_t len ) const
{
    return VByteBuffer { _buf.substr(pos, len) };
}
//=======================================================================================
//      starts, ends checking
//=======================================================================================
bool VByteBuffer::starts_with( const std::string& what ) const
{
    return _buf.find(what) == 0;
}
//=======================================================================================
bool VByteBuffer::ends_with( const std::string& what ) const
{
    if ( _buf.size() < what.size()  ) return false;

    return _buf.rfind(what) == size() - what.size();
}
//=======================================================================================
//      HEX
//=======================================================================================
static auto constexpr hex_syms = "0123456789abcdef";
static auto constexpr HEX_syms = "0123456789ABCDEF";
//---------------------------------------------------------------------------------------
static int ch_from_hex(char ch)
{
    if (ch >= '0' && ch <= '9') return ch - '0';
    if (ch >= 'A' && ch <= 'F') return 10 + ch - 'A';
    if (ch >= 'a' && ch <= 'f') return 10 + ch - 'a';
    return -1;
}
//---------------------------------------------------------------------------------------
//  Separator wiil ignore if with_separator == false.
static VByteBuffer _to_hex( const std::string& src,
                             const char* hsyms,
                             bool with_separator,
                             char separator )
{
    std::stringstream ss;

    for ( auto ch: src )
    {
        ss << hsyms[(ch >> 4) & 0xF] << hsyms[ch & 0xF];

        if ( with_separator )
            ss << separator;
    }

    auto res = ss.str();

    if ( with_separator && !src.empty() )   // Delete last space.
        res.pop_back();                     //

    return VByteBuffer{ std::move(res) };
}
//---------------------------------------------------------------------------------------
VByteBuffer VByteBuffer::from_hex( const std::string& src )
{
    std::string res;
    res.resize( (src.size() + 1)/2 );

    auto cur = res.rbegin();
    size_t real_res_size = 0;

    bool in_char = false;
    for ( auto src_it = src.rbegin(); src_it != src.rend(); ++src_it )
    {
        int tmp = ch_from_hex( *src_it );
        if (tmp < 0) continue;

        if ( in_char )
        {
            *cur++ |= tmp << 4;
        }
        else
        {
            *cur = static_cast<char>( tmp );
            ++real_res_size;
        }
        in_char = !in_char;
    }

    return VByteBuffer { res.erase(0, res.size() - real_res_size) };
}
//=======================================================================================
VByteBuffer VByteBuffer::from_hex() const
{
    return from_hex( *this );
}
//=======================================================================================
VByteBuffer VByteBuffer::tohex() const
{
    return _to_hex( *this, hex_syms, false, '\0' );
}
//=======================================================================================
VByteBuffer VByteBuffer::toHex() const
{
    return _to_hex( *this, HEX_syms, false, '\0' );
}
//=======================================================================================
VByteBuffer VByteBuffer::to_hex( char separator ) const
{
    return _to_hex( *this, hex_syms, true, separator );
}
//=======================================================================================
VByteBuffer VByteBuffer::to_Hex( char separator ) const
{
    return _to_hex( *this, HEX_syms, true, separator );
}
//=======================================================================================
bool VByteBuffer::is_hex_symbol( char ch ) noexcept
{
    return ch_from_hex(ch) >= 0;
}
//=======================================================================================
//      split by separators and spaces, trim spaces
//=======================================================================================
VByteBuffer::vector VByteBuffer::split( const std::string& data, char splitter )
{
    vector res;

    auto cur = data.begin();
    while ( cur != data.end() )
    {
        auto next = std::find( cur, data.end(), splitter );
        res.push_back( VByteBuffer{{cur, next}} );

        if ( next == data.end() ) break;
        cur = next + 1;
    }
    return res;
}
//=======================================================================================
VByteBuffer::vector VByteBuffer::split( char splitter ) const
{
    return split( *this, splitter );
}
//=======================================================================================
//  Нужен, чтобы в find_if типы совпадали.
static bool is_space( char ch )
{
    return std::isspace( ch );
}
//---------------------------------------------------------------------------------------
VByteBuffer::vector VByteBuffer::split_by_spaces() const
{
    vector res;

    auto cur = _buf.begin();
    while ( cur != _buf.end() )
    {
        auto next = std::find_if( cur, _buf.end(), is_space );

        if ( cur != next )                                  //  omit empties
            res.push_back( VByteBuffer({cur,next}) );      //

        if ( next == _buf.end() ) break;
        cur = next + 1;
    }
    return res;
}
//=======================================================================================
VByteBuffer& VByteBuffer::trim_spaces()
{
    if ( _buf.empty() ) return *this;

    auto from = _buf.begin();
    while( from != _buf.end() && std::isspace(*from) )
        ++from;

    auto to = _buf.end() - 1;
    while( to != from && std::isspace(*to) )
        --to;

    _buf = {from, to + 1};

    return *this;
}
//=======================================================================================
//      print
//=======================================================================================
ostream& operator <<( ostream& os, const VByteBuffer& buf )
{
    os << buf.str();
    return os;
}
//=======================================================================================
VByteBuffer operator +( const VByteBuffer& lhs, const VByteBuffer& rhs )
{
    auto res = lhs;
    res += rhs;
    return res;
}
//=======================================================================================
