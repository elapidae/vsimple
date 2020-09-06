#include "vapplication.h"

#include <cassert>
#include <mutex>

#include "vlog.h"
#include "vcat.h"
#include "impl_vposix/poll_context.h"
#include "impl_vposix/wrap_unistd.h"

using namespace impl_vposix;

using str  = std::string;
using cstr = const str&;

//=======================================================================================
//      vapplication
//=======================================================================================

//----------------------------------------
//  Can be only as static variable.
static poll_context *first_ctx = poll_context::current();
//----------------------------------------

//=======================================================================================
void vapplication::_invoke( task_type && f )
{
    first_ctx->push( std::move(f) );
}
//=======================================================================================
size_t vapplication::tasks_count() const
{
    return first_ctx->tasks_count();
}
//=======================================================================================
void vapplication::tasks_clear()
{
    first_ctx->tasks_clear();
}
//=======================================================================================
void vapplication::poll()
{
    first_ctx->poll();
}
//=======================================================================================
void vapplication::stop()
{
    first_ctx->stop();
}
//=======================================================================================
pid_t vapplication::pid() noexcept
{
    return wrap_unistd::get_pid();
}
//=======================================================================================
