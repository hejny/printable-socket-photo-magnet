
 include <shapes/roundedcube.scad>

//$fn=6;
$fn=100;

PictureSize = [50,50,7];  
Padding = 6;

PaddingBorderWidth = 3;
PaddingBorderDepth = 3;


MagnetsCount = 1;
MagnetsOffcenterShift = 0;

MagnetDiameter = 20+1;
MagnetDepth = 5+1;




// Simple flat frame for magnetic picture for a fridge



module base() {
    cube(PictureSize, center=true);

    difference() {

        cube([
            PictureSize.x+ Padding*2,
            PictureSize.y+ Padding*2,
            PictureSize.z
        ], center=true);

        /*/
        difference() {
            cube([
                PictureSize.x+ Padding*2,
                PictureSize.y+ Padding*2,
                PictureSize.z
            ], center=true);

            translate([PictureSize.x/2+Padding,PictureSize.y/2+Padding,0]) {
                cylinder(h=10,r=10);
            }
        }
        /**/

        /*/
        roundedcube(
            size = [
                PictureSize.x+ Padding*2,
                PictureSize.y+ Padding*2,
                PictureSize.z
            ],
            center = true,
            radius = 5,
            apply_to = "z"
        )
        /**/
        
    


    
        translate([0,0,PictureSize.z-PaddingBorderDepth]) {
            cube([
                PictureSize.x+PaddingBorderWidth*2,
                PictureSize.y+PaddingBorderWidth*2,
                PictureSize.z


            ], center=true);
        }

    }
}

module basePlaced() {
    translate([0,0,PictureSize.z/2]) {
        rotate([180,0,0]) {
            base();
        }
    }
}

module magnetCenteredPlaced() {
    translate([0,0,PictureSize.z-MagnetDepth]) {
        cylinder(h=MagnetDepth,r=MagnetDiameter/2);  
    }
}


module main() {
    difference() {
        basePlaced();

        for (i = [0:1:MagnetsCount]) { 
            rotate([0,0,(i/MagnetsCount)*360]) {
                translate([MagnetsOffcenterShift,0,0]) {
                    magnetCenteredPlaced();
                }
            }
        }


       
       
    }
}




main();