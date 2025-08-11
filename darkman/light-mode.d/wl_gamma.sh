#!/bin/sh

busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6000
busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d 1.0
