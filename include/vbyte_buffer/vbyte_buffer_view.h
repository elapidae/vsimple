/*! \file vbyte_buffer_view.h
 * \authors Alexander Gromtsev
 * \date December 2019
 */

//=======================================================================================

#ifndef VBYTE_BUFFER_VIEW_H
#define VBYTE_BUFFER_VIEW_H

//=======================================================================================

#include "vbyte_buffer.h"

//=======================================================================================
class VByteBufferView
{
public:

    //! \details A view constructors that looks at buf of length len.
    VByteBufferView( const char* buf,          const size_t len ) noexcept;
    VByteBufferView( const signed char* buf,   const size_t len ) noexcept;
    VByteBufferView( const unsigned char* buf, const size_t len ) noexcept;

    //-----------------------------------------------------------------------------------

    //! Direct memory access of the buffer, for convenience, but be careful.
    const char    * data()  const noexcept;
    const int8_t  * sdata() const noexcept;
    const uint8_t * udata() const noexcept;

    //! The number of buffer elements left in front.
    size_t remained() const noexcept;

    //! If the buffer being watched has run out.
    bool finished() const noexcept;

    //! Skip some elements.
    void omit( const size_t count );

    //-----------------------------------------------------------------------------------

    //! Display next item in Little Endian format.
    template<typename T> T show_LE()  const;

    //! Display next item in Big Endian format.
    template<typename T> T show_BE()  const;

    //! Display the sz of the following buffer elements as a string.
    std::string show_string ( const size_t sz ) const;

    //! Display the sz of the following buffer elements.
    VByteBuffer show_buffer ( const size_t sz ) const;

    //! View the rest of.
    VByteBuffer show_tail() const;

    //-----------------------------------------------------------------------------------

    //! Retrieve the next element from the clipboard in Little Endian format.
    template<typename T> T LE();

    //! Extract the next element from the buffer in Big Endian format.
    template<typename T> T BE();

    //! Extract sz size string from buffer.
    std::string string ( const size_t sz );

    //! Extract buffer of size sz from buffer.
    VByteBuffer buffer ( const size_t sz );

    //! Extract the rest.
    VByteBuffer tail();

    //-----------------------------------------------------------------------------------

    char show_ch() const;

    int8_t   show_i8() const;
    uint8_t  show_u8() const;

    int16_t  show_i16_LE() const;
    int16_t  show_i16_BE() const;
    uint16_t show_u16_LE() const;
    uint16_t show_u16_BE() const;

    int32_t  show_i32_LE() const;
    int32_t  show_i32_BE() const;
    uint32_t show_u32_LE() const;
    uint32_t show_u32_BE() const;

    int64_t  show_i64_LE() const;
    int64_t  show_i64_BE() const;
    uint64_t show_u64_LE() const;
    uint64_t show_u64_BE() const;

    float    show_float_LE() const;
    float    show_float_BE() const;

    double   show_double_LE() const;
    double   show_double_BE() const;

    //-----------------------------------------------------------------------------------

    char ch();

    int8_t   i8();
    uint8_t  u8();

    int16_t  i16_LE();
    int16_t  i16_BE();
    uint16_t u16_LE();
    uint16_t u16_BE();

    int32_t  i32_LE();
    int32_t  i32_BE();
    uint32_t u32_LE();
    uint32_t u32_BE();

    int64_t  i64_LE();
    int64_t  i64_BE();
    uint64_t u64_LE();
    uint64_t u64_BE();

    float    float_LE();
    float    float_BE();

    double   double_LE();
    double   double_BE();

    //-----------------------------------------------------------------------------------

private:

    const char* _buffer;
    size_t      _remained;

    //-----------------------------------------------------------------------------------

    template<typename T> T _show() const;
    template<typename T> T _extract();

};
//=======================================================================================


//=======================================================================================
//      Implementation
//=======================================================================================
template<typename T>
T VByteBufferView::_show() const
{
    if ( _remained < sizeof(T) )
        throw std::out_of_range( "vbyte_buffer_view: not enough data" );

    T res;
    auto ptr = static_cast<char*>( static_cast<void*>(&res) );
    std::copy( _buffer, _buffer + sizeof(T), ptr );

    return res;
}
//=======================================================================================
template<typename T>
T VByteBufferView::_extract()
{
    auto res = _show<T>();

    _remained -= sizeof (T);
    _buffer   += sizeof (T);

    return res;
}
//=======================================================================================
template<typename T>
T VByteBufferView::show_LE() const
{
    auto res = _show<T>();

    #if BYTE_ORDER == BIG_ENDIAN
        res = vbyte_buffer::reverse_T( res );
    #endif

    return res;
}
//=======================================================================================
template<typename T>
T VByteBufferView::show_BE() const
{
    auto res = _show<T>();

    #if BYTE_ORDER == LITTLE_ENDIAN
        res = VByteBuffer::reverse_T( res );
    #endif

    return res;
}
//=======================================================================================
template<typename T>
T VByteBufferView::LE()
{
    auto res = _extract<T>();

    #if BYTE_ORDER == BIG_ENDIAN
        res = vbyte_buffer::reverse_T( res );
    #endif

    return res;
}
//=======================================================================================
template<typename T>
T VByteBufferView::BE()
{
    auto res = _extract<T>();

    #if BYTE_ORDER == LITTLE_ENDIAN
        res = VByteBuffer::reverse_T( res );
    #endif

    return res;
}
//=======================================================================================

#endif // VBYTE_BUFFER_VIEW_H
