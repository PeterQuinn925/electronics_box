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
//top of the box
difference() {
cube([w_box+t_box,l_box,t_box], center = true);
for (i = [0:3]){
translate ([(posts[i][0]*w_box/2)-posts[i][0]*fz,(posts[i][1]*l_box/2)-posts[i][1]*fz,t_box])
    cylinder(h = t_box+fz*2.1,r = 0.0625,center=true);
    }
}
//inset box
translate([0,0,-2*t_box])
difference(){
cube([w_box-.5,l_box-.5,t_box+fz], center = true);
//cylinder posts
for (i = [0:3]){
translate ([(posts[i][0]*w_box/2)-posts[i][0]*fz,(posts[i][1]*l_box/2)-posts[i][1]*fz,t_box])
    cylinder(h = t_box+fz*2.1,r = c_size,center=true,$fn=50);
    }}
