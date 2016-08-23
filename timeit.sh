#!/bin/bash
# calculate the mean average of wall clock time from multiple /usr/bin/time results.

COUNT=3
CMD=
_e=1
_e_total=0
_S=
_S_total=0
_U=
_U_total=0
_P=
_P_total=0
_M=
_M_total=0
_t=
_t_total=0
_K=
_K_total=0
_D=
_D_total=0
_p=
_p_total=0
_X=
_X_total=0
_Z=
_Z_total=0
_F=
_F_total=0
_R=
_R_total=0
_W=
_W_total=0
_c=
_c_total=0
_w=
_w_total=0
_I=
_I_total=0
_O=
_O_total=0
_r=
_r_total=0
_s=
_s_total=0
_k=
_k_total=0
_e_msg="Elapsed real (wall clock) time used by the process, in seconds."
_S_msg="Total number of CPU-seconds used by the system on behalf of the process (in kernel mode), in seconds."
_U_msg="Total number of CPU-seconds that the process used directly (in user mode), in seconds."
_P_msg="Percentage of the CPU that this job got. This is just user + system times divied by the total running time."
_M_msg="Maximum resident set size of the process during its lifetime, in Kilobytes."
_t_msg="Mean resident set size of the process, in Kilobytes."
_K_msg="Mean total (data+stack+text) memory use of the process, in Kilobytes."
_D_msg="Mean size of the process's unshared data area, in Kilobytes."
_p_msg="Mean size of the process's unshared stack, in Kilobytes."
_X_msg="Mean size of the process's shared text, in Kilobytes."
_Z_msg="System's page size, in bytes. This is a per-system constant, but varies between systems."
_F_msg="Number of major, or I/O-requiring, page faults that occurred while the process was running. These are faults where the page has actually migrated out of primary memory."
_R_msg="Number of minor, or recoverable, page faults. These are pages that are not valid (so they fault) but which have not yet been claimed by other virtual pages. Thus the data in the page is still valid but the system tables must be updated."
_W_msg="Number of times the process was swapped out of main memory."
_c_msg="Number of times the process was context-switched involuntarily (because the time slice expired)."
_w_msg="Number of times that the program was context-switched voluntarily, for instance while waiting for an I/O operation to complete."
_I_msg="Number of file system inputs by the process."
_O_msg="Number of file system outputs by the process."
_r_msg="Number of socket messages received by the process."
_s_msg="Number of socket messages sent by the process."
_k_msg="Number of signals delivered to the process."

avg() {
   if [ "${VERBOSE}" ]; then echo "Running '${CMD}' ${COUNT} times..."; fi

   for (( i = 0; i < $COUNT; ++i )); do
       RESULT=`/usr/bin/time -f "%e\n%S\n%U\n%P\n%M\n%t\n%K\n%D\n%p\n%X\n%Z\n%f\n%R\n%W\n%c\n%w\n%I\n%O\n%r\n%s\n%k" ${CMD} 2>&1`
       TIMES=( ${RESULT} )

       if [[ "${#TIMES[*]}" -ne 21 ]]; then
           echo
           echo "Error running command: '${CMD}'!"
           echo "${RESULT}" | head -n-21
           exit
       fi

       if [ "${VERBOSE}" ]; then
           echo "Run #${i}"
       fi
       if [ "${_e}" ]; then
           _e_total=`echo $_e_total+${TIMES[0]} | bc -l`
           if [ "${VERBOSE}" ]; then echo "${_e_msg}: ${TIMES[0]}"; fi
       fi
       if [ "${_S}" ]; then
           _S_total=`echo $_S_total+${TIMES[1]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_S_msg}: ${TIMES[1]}"; fi
       fi
       if [ "${_U}" ]; then
           _U_total=`echo $_U_total+${TIMES[2]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_U_msg}: ${TIMES[2]}"; fi
       fi
       if [ "${_P}" ]; then
           _P_total=`echo $_P_total+${TIMES[3]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_P_msg}: ${TIMES[3]}"; fi
       fi
       if [ "${_M}" ]; then
           _M_total=`echo $_M_total+${TIMES[4]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_M_msg}: ${TIMES[4]}"; fi
       fi
       if [ "${_t}" ]; then
           _t_total=`echo $_t_total+${TIMES[5]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_t_msg}: ${TIMES[5]}"; fi
       fi
       if [ "${_K}" ]; then
           _K_total=`echo $_K_total+${TIMES[6]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_K_msg}: ${TIMES[6]}"; fi
       fi
       if [ "${_D}" ]; then
           _D_total=`echo $_D_total+${TIMES[7]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_D_msg}: ${TIMES[7]}"; fi
       fi
       if [ "${_p}" ]; then
           _p_total=`echo $_p_total+${TIMES[8]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_p_msg}: ${TIMES[8]}"; fi
       fi
       if [ "${_X}" ]; then
           _X_total=`echo $_X_total+${TIMES[9]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_X_msg}: ${TIMES[9]}"; fi
       fi
       if [ "${_Z}" ]; then
           _Z_total=`echo $_Z_total+${TIMES[10]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_Z_msg}: ${TIMES[10]}"; fi
       fi
       if [ "${_F}" ]; then
           if [ ${TIMES[11]} != "?f" ]; then
               _F_total=`echo $_F_total+${TIMES[11]} | bc -l `
           fi
           if [ "${VERBOSE}" ]; then echo "${_F_msg}: ${TIMES[11]}"; fi
       fi
       if [ "${_R}" ]; then
           _R_total=`echo $_R_total+${TIMES[12]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_R_msg}: ${TIMES[12]}"; fi
       fi
       if [ "${_W}" ]; then
           _W_total=`echo $_W_total+${TIMES[13]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_W_msg}: ${TIMES[13]}"; fi
       fi
       if [ "${_c}" ]; then
           _c_total=`echo $_c_total+${TIMES[14]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_c_msg}: ${TIMES[14]}"; fi
       fi
       if [ "${_w}" ]; then
           _w_total=`echo $_w_total+${TIMES[15]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_w_msg}: ${TIMES[15]}"; fi
       fi
       if [ "${_I}" ]; then
           _I_total=`echo $_I_total+${TIMES[16]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_I_msg}: ${TIMES[16]}"; fi
       fi
       if [ "${_O}" ]; then
           _O_total=`echo $_O_total+${TIMES[17]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_O_msg}: ${TIMES[17]}"; fi
       fi
       if [ "${_r}" ]; then
           _r_total=`echo $_r_total+${TIMES[18]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_r_msg}: ${TIMES[18]}"; fi
       fi
       if [ "${_s}" ]; then
           _s_total=`echo $_s_total+${TIMES[19]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_s_msg}: ${TIMES[19]}"; fi
       fi
       if [ "${_k}" ]; then
           _k_total=`echo $_k_total+${TIMES[20]} | bc -l `
           if [ "${VERBOSE}" ]; then echo "${_k_msg}: ${TIMES[20]}"; fi
       fi
       if [ "${VERBOSE}" ]; then echo; fi
   done

   if [ "${VERBOSE}" ]; then echo "Averages"; fi
   if [ "${_e}" ]; then printf "%-20s${_e_msg}\n" `echo "scale=4; $_e_total/$COUNT" | bc -l`; fi
   if [ "${_S}" ]; then printf "%-20s${_S_msg}\n" `echo "scale=4; $_S_total/$COUNT" | bc -l`; fi
   if [ "${_U}" ]; then printf "%-20s${_U_msg}\n" `echo "scale=4; $_U_total/$COUNT" | bc -l`; fi
   if [ "${_P}" ]; then printf "%-20s${_P_msg}\n" `echo "scale=4; $_P_total/$COUNT" | bc -l`; fi
   if [ "${_M}" ]; then printf "%-20s${_M_msg}\n" `echo "scale=4; $_M_total/$COUNT" | bc -l`; fi
   if [ "${_t}" ]; then printf "%-20s${_t_msg}\n" `echo "scale=4; $_t_total/$COUNT" | bc -l`; fi
   if [ "${_K}" ]; then printf "%-20s${_K_msg}\n" `echo "scale=4; $_K_total/$COUNT" | bc -l`; fi
   if [ "${_D}" ]; then printf "%-20s${_D_msg}\n" `echo "scale=4; $_D_total/$COUNT" | bc -l`; fi
   if [ "${_p}" ]; then printf "%-20s${_p_msg}\n" `echo "scale=4; $_p_total/$COUNT" | bc -l`; fi
   if [ "${_X}" ]; then printf "%-20s${_X_msg}\n" `echo "scale=4; $_X_total/$COUNT" | bc -l`; fi
   if [ "${_Z}" ]; then printf "%-20s${_Z_msg}\n" `echo "scale=4; $_Z_total/$COUNT" | bc -l`; fi
   if [ "${_F}" ]; then printf "%-20s${_F_msg}\n" `echo "scale=4; $_F_total/$COUNT" | bc -l`; fi
   if [ "${_R}" ]; then printf "%-20s${_R_msg}\n" `echo "scale=4; $_R_total/$COUNT" | bc -l`; fi
   if [ "${_W}" ]; then printf "%-20s${_W_msg}\n" `echo "scale=4; $_W_total/$COUNT" | bc -l`; fi
   if [ "${_c}" ]; then printf "%-20s${_c_msg}\n" `echo "scale=4; $_c_total/$COUNT" | bc -l`; fi
   if [ "${_w}" ]; then printf "%-20s${_w_msg}\n" `echo "scale=4; $_w_total/$COUNT" | bc -l`; fi
   if [ "${_I}" ]; then printf "%-20s${_I_msg}\n" `echo "scale=4; $_I_total/$COUNT" | bc -l`; fi
   if [ "${_O}" ]; then printf "%-20s${_O_msg}\n" `echo "scale=4; $_O_total/$COUNT" | bc -l`; fi
   if [ "${_s}" ]; then printf "%-20s${_s_msg}\n" `echo "scale=4; $_s_total/$COUNT" | bc -l`; fi
   if [ "${_k}" ]; then printf "%-20s${_k_msg}\n" `echo "scale=4; $_k_total/$COUNT" | bc -l`; fi
}

usage() {
   echo "usage: $0 [-n runs] [OPTIONS..] [AVERAGES..] command [args..]"
   echo
   echo " PARAMETERS"
   echo
   echo "  -n [#]      Number of times to run 'command' (default: 3)"
   echo
   echo " OPTIONS"
   echo
   echo "  -h / -H     Print this help text"
   echo "  -v          Verbose Output (print stats with each run of 'command'"
   echo
   echo " AVERAGES"
   echo
   echo "  -e          (Default: ON. Use '-e' to turn OFF) Elapsed real (wall clock) time used "
   echo "              by the process, in seconds."
   echo "  -S          Total number of CPU-seconds used by the system on behalf of the process "
   echo "              (in kernel mode), in seconds."
   echo "  -U          Total number of CPU-seconds that the process used directly (in user mode), "
   echo "              in seconds."
   echo "  -P          Percentage of the CPU that this job got.  This is just user + system times "
   echo "              divied by the total running time."
   echo "  -M          Maximum resident set size of the process during its lifetime, in Kilobytes."
   echo "  -t          Average resident set size of the process, in Kilobytes."
   echo "  -K          Average total (data+stack+text) memory use of the process, in Kilobytes."
   echo "  -D          Average size of the process's unshared data area, in Kilobytes."
   echo "  -p          Average size of the process's unshared stack, in Kilobytes."
   echo "  -X          Average size of the process's shared text, in Kilobytes."
   echo "  -Z          System's page size, in bytes.  This is a per-system constant, but varies "
   echo "              between systems."
   echo "  -F          Number of major, or I/O-requiring, page faults that occurred while the "
   echo "              process was running. Â "
   echo "              These are faults where the page has actually migrated out of primary memory."
   echo "  -R          Number of minor, or recoverable, page faults.  These are pages that are not "
   echo "              valid (so they fault) but which have not yet been claimed "
   echo "              by other virtual pages. Â Thus the data in the page is"
   echo "              still valid but the system tables must be updated."
   echo "  -W          Number of times the process was swapped out of main memory."
   echo "  -c          Number of times the process was context-switched involuntarily (because the "
   echo "              time slice expired)."
   echo "  -w          Number of times that the program was context-switched voluntarily,"
   echo "              for instance while waiting for an I/O operation to complete."
   echo "  -I          Number of file system inputs by the process."
   echo "  -O          Number of file system outputs by the process."
   echo "  -r          Number of socket messages received by the process."
   echo "  -s          Number of socket messages sent by the process."
   echo "  -k          Number of signals delivered to the process."
   echo "  -a          ALL averages calculated and printed."
   echo
   echo " EXAMPLES"
   echo
   echo "$0 -n 10 sleep 2.5"
   echo
   exit
}

while getopts "hHn:veSUPMtKDpXZFRWcwIOrska" optname; do
   case "$optname" in
       h|H) usage ${0};;
         v) VERBOSE=1;;
         n) COUNT="${OPTARG}";;
         a) _S=1; _U=1; _p=1; _M=1; _t=1; _K=1; _D=1; _p=1; _X=1; _Z=1; _F=1; _R=1; _W=1; _c=1; _w=1; _I=1; _O=1; _r=1; _s=1; _k=1;;
         e) _e=;;
         S) _S=1;;
         U) _U=1;;
         P) _P=1;;
         M) _M=1;;
         t) _t=1;;
         K) _K=1;;
         D) _D=1;;
         p) _p=1;;
         X) _X=1;;
         Z) _Z=1;;
         F) _F=1;;
         R) _R=1;;
         W) _W=1;;
         c) _c=1;;
         w) _w=1;;
         I) _I=1;;
         O) _O=1;;
         r) _r=1;;
         s) _s=1;;
         k) _k=1;;
       [?]) usage ${0};;
   esac
done
CMD="${@:${OPTIND}}"

avg
