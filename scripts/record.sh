#!/usr/bin/env bash
ARG=${1?Error: no input given}

case "$ARG" in 
  "s1") echo "Recording with screen 1" ;;
  "s2") echo "Recording with screen 2" ;;
  "s1m") echo "Recording with screen 1 and microphone" ;;
  "s2m") echo "Recording with screen 2 and microphone" ;;
  "s1d") echo "Recording with screen 1 and desktop audio" ;;
  "s2d") echo "Recording with screen 2 and desktop audio" ;;
  "s1dm") echo "Recording with screen 1 and both microphone and desktop audio" ;;
  "s2dm") echo "Recording with screen 2 and both microphone and desktop audio" ;;
esac

