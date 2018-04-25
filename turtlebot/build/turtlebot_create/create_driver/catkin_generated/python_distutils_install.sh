#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/wojciech/turtlebot/src/turtlebot_create/create_driver"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/wojciech/turtlebot/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/wojciech/turtlebot/install/lib/python2.7/dist-packages:/home/wojciech/turtlebot/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/wojciech/turtlebot/build" \
    "/usr/bin/python" \
    "/home/wojciech/turtlebot/src/turtlebot_create/create_driver/setup.py" \
    build --build-base "/home/wojciech/turtlebot/build/turtlebot_create/create_driver" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/wojciech/turtlebot/install" --install-scripts="/home/wojciech/turtlebot/install/bin"
