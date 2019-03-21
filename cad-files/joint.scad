module joint(left_angle = 0, right_angle = 0, ring_segments = 10,
	     outer_width = 8, inner_width = 6) {
     ring_angle = 360 / (ring_segments * 2);
     union() {
	  sphere(d=8,$fn=50);
	  rotate([0,-(90+left_angle),0]) _peg(outer_width, inner_width);
	  rotate([0,90+right_angle,0]) _peg(outer_width, inner_width);
	  rotate([-(90+ring_angle),0,0]) _peg(outer_width, inner_width);
	  rotate([90+ring_angle,0,0]) _peg(outer_width, inner_width);
     }
}

module _peg(outer_width, inner_width) {
     union() {
	  cylinder(h=outer_width*0.75, d=outer_width, $fn=50);
	  cylinder(h=outer_width*0.75+10, d=inner_width, $fn=50);
     }
}

joint(left_angle = 40, right_angle = -10);

