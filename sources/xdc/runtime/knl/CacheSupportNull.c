/*
 *  ======== CacheSupportNull.c =======r
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>

#include "package/internal/CacheSupportNull.xdc.h"

/*
 *  ======== CacheSupportNull_inv ========
 */
Bool CacheSupportNull_inv(Ptr blockPtr, SizeT byteCnt, Bool wait, 
    Error_Block *eb)
{
    return (TRUE);
}

/*
 *  ======== CacheSupportNull_wb ========
 */
Bool CacheSupportNull_wb(Ptr blockPtr, SizeT byteCnt, Bool wait, 
Error_Block *eb)
{
    return (TRUE);
}

/*
 *  ======== CacheSupportNull_wbInv ========
 */
Bool CacheSupportNull_wbInv(Ptr blockPtr, SizeT byteCnt, Bool wait, 
    Error_Block *eb)
{
    return (TRUE);
}

/*
 *  ======== CacheSupportNull_wait ========
 */
Bool CacheSupportNull_wait(Error_Block *eb)
{
    return (TRUE);
}

/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,181; 2-10-2012 10:18:54; /db/ztree/library/trees/xdc/xdc-y21x/src/packages/
 */

