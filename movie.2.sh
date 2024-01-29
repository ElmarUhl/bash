#! /bin/bash

  avconv -framerate 25 -f image2 -i geometrias.%d.png -b 65536k teste.avi

exit 0