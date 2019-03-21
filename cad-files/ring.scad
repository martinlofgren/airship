use <joint.scad>;
include <dimensions.scad>;

module ring (left_angle = 0,
	     right_angle = 0,
	     ring_segments = 12,
	     radius = 200,
	     midsection = false,
	     draw_pipes = false) {
     for (i = [ 0 : 360 / ring_segments : 360 - 0.01 ])
	  rotate ([i, 0, 0])
	       translate ([0, 0, radius])
	       joint (left_angle = left_angle,
		      right_angle = right_angle,
		      ring_segments = ring_segments,
		      outer_width = pipe_outer_width,
		      inner_width = pipe_inner_width,
		      midsection = midsection);
     
     if (midsection)
	  midjoint (ring_segments = ring_segments);

     if (draw_pipes) {
	  if (midsection) {
	       for (i = [ 0 : 360 / ring_segments : 360 - 0.01 ])
		    rotate ([i, 0, 0])
			 difference () {
			 translate ([ 0, 0, pipe_outer_width * 2.25 ])
			      color ("DodgerBlue", 0.65)
			      cylinder (h = radius - pipe_outer_width * 3, d = pipe_outer_width, $fn = 50);
			 translate ([ 0, 0, -1 ])
			      cylinder (h = radius + 2, d = pipe_inner_width);
		    }
	  }
     }
}

ring (midsection = true, draw_pipes = true);
