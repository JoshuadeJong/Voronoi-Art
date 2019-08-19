# What are Voronoi Diagrams?
A voronoi diagram is a partitioning of a plane with n generating points into convex polygons such that each polygon contains exactly one generating point and every point in a given polygon is closer to its generating point than any other point. They are also known as Voronoi tessellation, Voronoi decomposition, Voronoi Partition, or Dirichlet tessellation.

# Creating Art
Using a Voronoi Diagram we can create mosaic or plainting like repersentations of an original image. To do this we use the following algorithm:
  1) Given an image **I**, generate a random set of **n** points **P** which lies within the perimeter of **I**.
  2) Generate a Voronoi Diagram **V** from the set of points **P**. Let **v_i** denote a polygon in **V**.
  3) Color each polygon **v_i** using the pixel valaue from **I** located at the center of **v_i**.
  4) If a polygon **v_i** center is not located on **I**, color **v_i** using the pixel value from the closest point on **I** to the center of **v_i**.
  
While using the algorithm the final image can vastly differ depending on your set of points **P**. For instance, if you generate your set **P** using a Gaussian distribution, increasing the amount of points **n** improves the clarity of the final image. While using a skewed distribution to create **P** can make a sense of depth or focus to the final image.

# Raw Image
![An Unedited Landscape](https://github.com/ManVanMaan/Voronoi-Art/blob/master/Wallpapers%20Raw/Land_1.jpg)

# Voronoi Representation
![An Edited Landscape](https://github.com/ManVanMaan/Voronoi-Art/blob/master/Wallpapers%20Final/Land_1_Final.png)

# Miscellaneous Art
![Forest_1](https://github.com/ManVanMaan/Voronoi-Art/blob/master/Wallpapers%20Final/Forest_1_Final.png)
![Forest_3](https://github.com/ManVanMaan/Voronoi-Art/blob/master/Wallpapers%20Final/Forest_3_Final.png)
![Forest_4](https://github.com/ManVanMaan/Voronoi-Art/blob/master/Wallpapers%20Final/Forest_4_Final.png)
![Forest_6](https://github.com/ManVanMaan/Voronoi-Art/blob/master/Wallpapers%20Final/Forest_6_Final.png)
![Land_3](https://github.com/ManVanMaan/Voronoi-Art/blob/master/Wallpapers%20Final/Land_3_Final.png)
