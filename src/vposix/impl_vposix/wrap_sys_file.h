#ifndef IMPL_VPOSIX_WRAP_SYS_FILE_H
#define IMPL_VPOSIX_WRAP_SYS_FILE_H

//=======================================================================================
/*
 *  flock:
 *  http://man7.org/linux/man-pages/man2/flock.2.html
*/
//=======================================================================================


//=======================================================================================
namespace impl_vposix
{
    //===================================================================================
    struct wrap_sys_file final
    {
        //-------------------------------------------------------------------------------
        //  Делает advisory блокировку, т.е. действует по договореннсости.
        static bool try_lock_exclusive( int fd );
        //-------------------------------------------------------------------------------
    };
    //===================================================================================
} // namespace impl_vposix
//=======================================================================================

#endif // IMPL_VPOSIX_WRAP_SYS_FILE_H
