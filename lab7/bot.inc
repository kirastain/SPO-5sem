define bot position
(
       # actual size
      size [1 1 1]

      block
      (
            points 6
            point[5] [0 0]
            point[4] [0 1]
            point[3] [0.75 1]
            point[2] [1 0.75]
            point[1] [1 0.25]
            point[0] [0.75 0]
            z [0 1]
      )

      drive "diff"
      
      bigbobs_sonars()
      bigbobs_sonars1()


)

define bigbobs_sonar sensor
(
        # define the size of each transducer [xsize ysize zsize] in meters
        size [0.01 0.05 0.01 ]
        # define the range bounds [min max]
        range [0.3 10.0]
        # define the angular field of view in degrees
        fov 10
        # define the color that ranges are drawn in the gui
        color_rgba [ 200 200 200 1 ]
)

define bigbobs_sonars ranger
( 
  # one line for each sonar [xpos ypos zpos heading]
  bigbobs_sonar( pose [ 0 0.5 0 90]) # left corner
)

define bigbobs_sonars1 ranger
(
	bigbobs_sonar( pose [ 0.5 0 0 0])
)

