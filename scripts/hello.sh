#!/bin/sh

while [[ $# -gt 0 ]]
do
key="$1"

case $key in

    -h|--help)
    help="true"
    shift # past argument
    ;;

    -n|--name)
    export NAME="$2"
    shift # past argument
    ;;

    --default)
    ;;
    *)
          # unknown option
    ;;
esac
shift # past argument or value
done

echo "Hello $NAME"