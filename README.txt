This repository complements Chapter 3 of the paper 
'On trajectories of complex-valued interior transmission eigenvalues' 
by 
Lukas Pieronek and Andreas Kleefeld.

Date: June, 14th 2022
Used: Matlab R2021a

Creating the ten figures
========================
All the figures in the 'Numerical Results' section are created with

plotallfigures.m using the call plotallfigures()

which calls the routines
plotfig01.m
plotfig02.m
plotfig03.m
plotfig04.m
plotfig05.m
plotfig06.m
plotfig07.m
plotfig08.m
plotfig09.m
plotfig10.m
plotfig11.m

and creates
fig01.eps
fig02.eps
fig03.eps
fig04.eps
fig05.eps
fig06.eps
fig07.eps
fig08.eps
fig09.eps
fig10.eps
fig11.eps

Data for the figures
====================
Some of the figures need data to be plotted which are
disk1.mat
disk2.mat
disk3.mat
disk4.mat
sphere1.mat
sphere2.mat
sphere3.mat
ellipse1.mat
ellipse2.mat
square1.mat
square2.mat
triangle1.mat
triangle2.mat
kite1.mat
kite2.mat
clover1.mat
clover2.mat
ellipsoid1.mat
ellipsoid2.mat
ellipsoid3.mat

Generation of the data
======================
The data are produced through

createdata.m (this needs about 40 hours) using the call createdata()

which calls
disk1.m (runalldisk.m)
disk2.m (runalldisk.m)
disk3.m (runalldisk.m)
disk4.m (runalldisk.m)
sphere1.m (runallsphere.m)
sphere2.m (runallsphere.m)
sphere3.m (runallsphere.m)
ellipse1.m
ellipse2.m
square1.m
square2.m
triangle1.m
triangle2.m
kite1.m
kite2.m
clover1.m
clover2.m
ellipsoid1.m
ellipsoid2.m
ellipsoid3.m

which in turn need the beyn algorithm and the modified method of fundamental solution methods
ITEbeyn2D.m
ITEbeyn3D.m
MFS_ITE_ellipse.m
MFS_ITE_polygon.m
MFS_ITE_kite.m
MFS_ITE_clover.m
MFS_ITE_ellipsoid.m



