//project box with louvers
//cylinder posts on the sides
$fa =1;
$fs =0.1;
fz = 0.25;
w_box =4;
l_box =6;
h_box =4;
t_box = .125;//thickness
c_size = .25;//post radius
l_angle = 25;//angle of louver from vertical
l_width = .25;//width of each louver
l_num = 8;//number of louvers
posts = [[1,1],[-1,1],[1,-1],[-1,-1]];
//bottom of the box
cube([w_box,l_box,t_box], center = true);
//first side
//include hole for power cord
translate([(w_box/2),0,(h_box/2)-t_box/2])
    difference(){
    cube([t_box,l_box,h_box],center=true);
    rotate([0,90,0])
    translate([h_box*.3,l_box*.3,0])
    cylinder(t_box+fz,r=.25,center=true);//1/2" hole for power cable gland
    }
//opposite side
translate([(-w_box/2),0,(h_box/2)-t_box/2])
    cube([t_box,l_box,h_box],center=true);
//short side
translate([0,-l_box/2+t_box/2,(h_box/2)-t_box/2])
    cube([w_box,t_box,h_box],center=true);
//opposide short side
translate([0,l_box/2-t_box/2,(h_box/2)-t_box/2])
    difference(){
    cube([w_box,t_box,h_box],center=true);
    //louver frame
    cube ([w_box*0.5,t_box+fz,0.75*l_num*l_width+fz],center=true);
    }
    //loover
    translate([0,l_box/2-t_box/4,h_box/2-(0.5*l_num*l_width)+t_box/1.95])
for (i = [0:l_num-1]){
    translate([0,0,i*(l_width*1.)])//todo:do the trig function instead of hardcode width
    rotate([l_angle,0,0])
    //color([0,0,1])//to make it easy to debug
    cube([w_box*0.5,t_box*.5,l_width],center = true);
}
//cylinder posts
for (i = [0:3]){
translate ([(posts[i][0]*w_box/2)-posts[i][0]*fz,(posts[i][1]*l_box/2)-posts[i][1]*fz,t_box])
    difference(){
    cylinder(h = h_box-2.5*t_box,r = c_size);
    translate([0,0,h_box/2])
    cylinder(h=2,r=0.0625);//screw hole
    }
}
//top lip
translate([0,0,h_box-2*t_box])
   difference()   {
   cube([w_box,l_box,t_box], center = true);
   cube([w_box-.5,l_box-.5,t_box+fz], center = true);}


   
   