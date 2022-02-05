

od=32;
odscrews=od+20;
id=25;
balld=4.2;
ballloc = (od+id)/2;
margin=5;
cylh=4;
rot=20;
bard=3;

tolerance = 0.6;



ballbottomguard();
//projection(cut=true) translate([0,0,-1.5]) 

translate([0,0,30]) pcbholder();
translate([0,0,40]) ballbottompcb();
translate([0,0,40]) balls();
translate([0,0,40]) rotate([0,0,rot])balls();
difference() {
    translate([0,0,45]) bars();
    cylinder(h=100,d=20);
}
translate([0,0,60]) mirror([0,0,1]) bartop_v5();
translate([0,0,95]) mirror([0,0,1]) topguard_v2();


module pcbholder() {
    difference() {
        union() {
            cylinder(h=2,d=od+margin,$fn=360);
            cylinder(h=2+1.5,d=20.7, $fn=360);
        }
        cylinder(h=cylh,d=id-margin*2,$fn=360);
    }
}


module ballbottom() {
    difference() {
        cylinder(h=cylh,d=od+margin,$fn=360);
        cylinder(h=cylh,d=id-margin,$fn=360);
    }
}

module ballbottompcb() {
    difference() {
        linear_extrude(1.5) circle(d=od+margin, $fn=360);
        linear_extrude(1.5) circle(d=id-margin, $fn=360);
        translate([0,0,-0.47]) {
            ballcutoutsphere();
            rotate([0,0,rot]) ballcutoutsphere();
        }
        translate([0,0,-2.7]) barscuts();
    }
}

module ballbottomguard() {
    difference() {
        cylinder(h=cylh+18,d=odscrews+margin,$fn=360);
        translate([0,0,5])cylinder(h=cylh+20,d=od+margin+tolerance,$fn=360);
        cylinder(h=cylh+18,d=id-margin,$fn=360);
        translate([0,0,5]) wireexit();
        screwconnectholes();
    }
}

module wireexit() {
    rotate([0,0,(rot+360/3)/2]) translate([-1.5+od/2,-1.5,cylh-balld/2]) cube([30,6,6]);
}

module topguard() {
    difference() {
        cylinder(h=cylh+18,d=odscrews+margin,$fn=360);
        translate([0,0,5])cylinder(h=cylh+20,d=od+margin+tolerance,$fn=360);
        cylinder(h=cylh+18,d=8.2,$fn=360);
        screwconnectholes();
    }
}


module topguard_v2() {
    difference() {
        union() {
            cylinder(h=cylh+18,d2=odscrews+margin,d1=15,$fn=360);
            translate([0,0,-20])cylinder(h=cylh+18+20,d=6.95,$fn=360);
            translate([0,0,cylh+18-10]) cylinder(h=5+10,d=odscrews+margin,$fn=360);
        }
        translate([0,0,5])cylinder(h=cylh+20,d2=od+margin+tolerance,d1=15,$fn=360);
        //translate([0,0,-4])cylinder(h=4,d=od+margin+tolerance,$fn=360);
        //translate([0,0,-30])cylinder(h=cylh+18+30,d=3.95,$fn=360);
        screwconnectholes();
    }
}

module wirecutout() {
    difference() {
        translate([0,0,cylh-balld/2]) cylinder(h=cylh,d=ballloc+1.5,$fn=360);
        translate([0,0,cylh-balld/2]) cylinder(h=cylh,d=ballloc-1.5,$fn=360);
    }
}

module ballcutoutsphere() {
    for(r=[0:360/3:360]) {
            rotate([0,0,r])
                translate([ballloc/2,0,cylh])
                //translate([-balld/2,-balld/2,0])
                sphere(d=balld,$fn=60);
    }
}


module balls() {
    for(r=[0:360/3:360]) {
            rotate([0,0,r])
                translate([ballloc/2,0,cylh])
                //rotate([0,0,45])
                //translate([-balld/2,-balld/2,0])
                sphere(d=balld,$fn=360);
    }
}



module bars() {
    for(r=[rot/2:360/3:360]) {
        rotate([0,0,r])
        translate([0,0,cylh]) rotate([0,90,0]) cylinder(h=20,d=bard, $fn=360);
    }
}

module barscuts() {
    for(r=[rot/2:360/3:360]) {
        rotate([0,0,r])
        translate([0,0,cylh]) rotate([0,90,0]) translate([-0.5,-0.5,0])cube([1,1,20]);
    }
        rotate([0,0,rot/2+120/2])
        translate([0,0,cylh]) rotate([0,90,0]) translate([-0.5,-0.5,0])cube([1,1,20]);
}


module barscutout() {
    for(r=[rot/2:360/3:360]) {
        rotate([0,0,r])
        translate([0,0,cylh-0.5])
        rotate([0,90,0])
        translate([-bard/2,-bard/2,0]) cube([bard,bard,20]);
    }
}
module barscutout_cyl() {
    for(r=[rot/2:360/3:360]) {
        rotate([0,0,r])
        translate([0,0,cylh-0.5])
        rotate([0,90,0])
        translate([0,0,0]) cylinder(h=20,d=bard,$fn=360);
    }
}

module screwconnectholes() {
    dist = (odscrews+od)/4;
    di=3.95;
    for(r=[10:360/3:360]) {
        rotate([0,0,r])
        translate([di/2,dist+di/2,0]) cylinder(h=60,d=di, $fn=360);
    }
}


module bartop() {
    difference() {
        union() {
            difference() {
                cylinder(h=cylh,d=od+margin,$fn=360);
                barscutout();
            }
            cylinder(h=cylh,d=14,$fn=360);
        }
        cylinder(h=cylh,d=8.2,$fn=360);
    }
}

module bartop_v2() {
    difference(){
        bartop();
        ballspacecutout();
    }
}

module bartop_v5() {
    
    difference() {
        union() {
            difference() {
                cylinder(h=cylh,d=od+margin-1,$fn=360);
                barscutout();
                
            }
            cylinder(h=cylh*2,d=12,$fn=360);
            cylinder(h=cylh*9,d1=10,d2=2,$fn=360);
        }
        cylinder(h=cylh*2,d=3.95,$fn=360);
        ballspacecutout();
        barscutout_cyl();
    }
    translate([0,0,cylh*9]) sphere(d=5, $fn=360);
    
}

module ballspacecutout() {
    difference() {
        translate([0,0,cylh-bard/2]) cylinder(h=cylh-2,d=ballloc+(balld)+tolerance,$fn=360);
        translate([0,0,cylh-bard/2]) cylinder(h=cylh-2,d=ballloc-(balld)-tolerance,$fn=360);
    }
}







