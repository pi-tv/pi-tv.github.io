---
title: Gimp
tags: [Gimp]
date: 2017-07-30
---

# Gimp

## Red tiles texture

![Red tiles](/resources/gimp-red-tiles/red-tiles.png)

1. Create image 1000x1000
2. In the "Background" layer do:
    1. `Filter -> Render -> Clouds -> Solid Noise`
       ![Solid Noise filter](/resources/gimp-red-tiles/01.png)
    2. Create noise: `Filters -> Noise -> RGB Noise`
       ![RGB Noise filter](/resources/gimp-red-tiles/02.png)
    3. Blur it: `Filters -> Blur -> Motion Blur`
       ![Motion Blur filter](/resources/gimp-red-tiles/03.png)
    4. Then do: `Colors -> Colorize... -> Hue = 1`
       ![Colorize Hue](/resources/gimp-red-tiles/04.png)
3. Create new layer "Tiles"
    1. Fill "Tiles" layer with "#AA2222" color
    2. Then `Filter -> Distort -> Mosaic`
       ![Mosaic filter](/resources/gimp-red-tiles/11.png)
    3. Change opacity to 75 ![Summary](/resources/gimp-red-tiles/12.png)
4. Done! Source [.xcf file](/resources/gimp-red-tiles/red-tiles.xcf)
