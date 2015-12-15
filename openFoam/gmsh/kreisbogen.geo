// Inputs
L = 1; //Länge m
d = 0.20; //Durchmesser
R = 0.15; //Radius des Kreisbogens d/2 < R < infty

meshThickness = L / 10; 
gridsize = L / 100;
 
// Geometry
// der Punkt (0,0) ist der Mittelpunkt des Kreises
Point(1) = {0,0, gridsize};//mittelpunkt des kreises
Point(2) = {-L, -R - d/2, gridsize};
Point(3) = {0, -R - d/2, gridsize};
Point(4) = {R+d/2,0,gridsize};
Point(5) = {R+d/2,L, gridsize};
Point(6) = {R-d/2,L,gridsize};
Point(7) = {R-d/2,0,gridsize};
Point(8) = {0, -R + d/2,gridsize};
Point(9) = {-L,-R + d/2,gridsize};



Line(1) = {2, 3};
Circle(2) ={3,1,4};
Line(3) = {4, 5};
Line(4) = {5, 6};
Line(5) = {6, 7};
Circle(6) ={7,1,8};
Line(7) = {8, 9};
Line(8) = {9, 2};

Line Loop(9) = {1, 2, 3, 4, 5, 6, 7, 8}; 	
Plane Surface(10) = {9};
 
//Transfinite surface:
Transfinite Surface {10}; //nummer von plane surface
Recombine Surface {10};
 
surfaceVector[] = Extrude {0, 0, meshThickness} {
 Surface{10};
 Layers{1};
 Recombine;
};


// surfaceVector contains in the following order:
//[0]	- front surface (opposed to source surface)
//[1] - extruded volume
//[2] - bottom surface (belonging to 1st line in "Line Loop (6)")
//[3] - right surface (belonging to 2nd line in "Line Loop (6)")
//[4] - top surface (belonging to 3rd line in "Line Loop (6)")
//[5] - left surface (belonging to 4th line in "Line Loop (6)") 


Physical Surface("front") = surfaceVector[0];
Physical Volume("internal") = surfaceVector[1];
Physical Surface("back") = {10};

Physical Surface("Wand1") = surfaceVector[2];
Physical Surface("Wand2") = surfaceVector[3];//aussen kurve
Physical Surface("Wand3") = surfaceVector[4];
Physical Surface("Ausfluss") = surfaceVector[5];
Physical Surface("Wand4") = surfaceVector[6];
Physical Surface("Wand5") = surfaceVector[7];//innen kurve
Physical Surface("Wand6") = surfaceVector[8];
Physical Surface("Einfluss") = surfaceVector[9];
Coherence;
Coherence;
