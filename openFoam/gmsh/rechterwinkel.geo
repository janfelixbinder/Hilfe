// Inputs
L = 1; //Länge m
d = 0.20; //Durchmesser
meshThickness = L / 10; 
gridsize = L / 100;
 
// Geometry
Point(1) = {-L, -d/2, 0, gridsize};
Point(2) = {d/2, -d/2, 0, gridsize};
Point(3) = {d/2, L, 0, gridsize};
Point(4) = {-d/2, L, 0, gridsize};
Point(5) = {-d/2, d/2, 0, gridsize};
Point(6) = {-L, d/2, 0, gridsize};
Line(1) = {1, 2};				// bottom line
Line(2) = {2, 3};				// right line
Line(3) = {3, 4};				// ausströmung top line
Line(4) = {4, 5};				// left line
Line(5) = {5, 6};				// left line
Line(6) = {6, 1};				// einströmung left line
Line Loop(7) = {1, 2, 3, 4, 5, 6}; 	
Plane Surface(8) = {7};
 
//Transfinite surface:
Transfinite Surface {8}; //nummer von plane surface
Recombine Surface {8};
 
surfaceVector[] = Extrude {0, 0, meshThickness} {
 Surface{8};
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
Physical Surface("back") = {8};

Physical Surface("Wand1") = surfaceVector[2];
Physical Surface("Wand2") = surfaceVector[3];
Physical Surface("Ausfluss") = surfaceVector[4];
Physical Surface("Wand3") = surfaceVector[5];
Physical Surface("Wand4") = surfaceVector[6];
Physical Surface("Einfluss") = surfaceVector[7];
Coherence;
Coherence;
