#!/bin/sh

busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 3500
busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d 0.8
