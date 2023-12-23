//$fn=10;
 $fn=100;

PictureSize = [50,50,5];  
Padding = 5;


MagnetsCount = 5;
MagnetsOffcenterShift = 15;

MagnetDiameter = 4;
MagnetHeight = 2;




// Simple flat frame for magnetic picture for a fridge



module base() {
     cube(PictureSize, center=true);


    difference() {
        cube([
            PictureSize.x+ Padding*2,
            PictureSize.y+ Padding*2,
            PictureSize.z
        ], center=true);
    


    
        translate([0,0,PictureSize.z-3]) {
            cube([
                PictureSize.x+2,
                PictureSize.y+2,
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
    translate([0,0,PictureSize.z-MagnetHeight]) {
        cylinder(h=MagnetHeight,r=MagnetDiameter/2);  
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