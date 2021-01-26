#!/bin/bash

echo ====================================================================================
PROJECT=vcat
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vgit
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vcompiler_traits
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vsignal
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vchrono
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vlog
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vbyte_buffer
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vposix
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vtimer
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vnetwork
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vserial_port
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vsettings
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vcan_socket
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vprofile
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================
PROJECT=vcmdline_parser
vsimples/$PROJECT/test_$PROJECT/test_$PROJECT      || exit 1

echo ====================================================================================



exit 0
