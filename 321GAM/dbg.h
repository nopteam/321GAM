//
//  dbg.h
//  321GAM
//
//  Created by Leonardo Cascianelli on 06/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#ifndef _21GAM_dbg_h
#define _21GAM_dbg_h

#ifdef _DBG_INHIBIT_
#define _warn(M,...)
#define _err(M,...)
#define _info(M,...)
#else 
#define _warn(M,...) fprintf(stderr, "[!?] " M "\n", ##__VA_ARGS__)
#define _err(M,...) {fprintf(stderr, "[!!] " M "\n", ##__VA_ARGS__); errno=0; goto error;}
#define _info(M,...) fprintf(stderr, "[@] " M "\n", ##__VA_ARGS__)
#endif


#endif
