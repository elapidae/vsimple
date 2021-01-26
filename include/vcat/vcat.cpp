/****************************************************************************************
**
**  VSIMPLE codebase, NIIAS
**
**  GNU Lesser General Public License Usage
**  This file may be used under the terms of the GNU Lesser General Public License
**  version 3 as published by the Free Software Foundation and appearing in the file
**  LICENSE.LGPL3 included in the packaging of this file. Please review the following
**  information to ensure the GNU Lesser General Public License version 3 requirements
**  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
****************************************************************************************/

#include "vcat.h"

template<class T>
class TD;

//=======================================================================================
vcat::vcat()
{
    _init_default_modifiers();
}
//=======================================================================================
std::string vcat::str() const
{
    auto res = _stream.str();

    if ( _delimiter_has_been_added() )
    {
        res.pop_back();
    }

    return res;
}
//=======================================================================================
void vcat::_init_default_modifiers()
{
    // Эти флаги включаются по умолчанию.
    _stream << std::showbase << std::boolalpha;
}
//=======================================================================================
vcat::operator std::string() const
{
    return str();
}
//=======================================================================================

//=======================================================================================
std::ostream &operator <<( std::ostream &s, const vcat &c )
{
    s << c.str();
    return s;
}
//=======================================================================================
