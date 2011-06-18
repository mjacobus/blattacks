#!/bin/bash
#blattacks.sh

case "$1" in
'version')
	/opt/blattacks/src/./blattacks_version.sh
  ;;
'start')
	/opt/blattacks/src/./blattacks_start.sh
  ;;
'stop')
	/opt/blattacks/src/./blattacks_stop.sh
  ;;
'restart')
	/opt/blattacks/src/./blattacks_restart.sh
  ;;
'status')
	/opt/blattacks/src/./blattacks_status.sh
  ;;
*)
  echo "usage $0 status|start|stop|restart|version"
esac

exit $?
