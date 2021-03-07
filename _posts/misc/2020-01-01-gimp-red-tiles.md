---
title: Gimp red tiles
tags: [Gimp]
desc: Make a red tiles texture
date: 2017-07-30
---

# Gimp red tiles

![Red tiles](/resources/gimp-red-tiles/red-tiles.png)

- Create image 1000x1000, on the "Background" layer do: 

- Filter->Render->Clouds->Solid Noise

![Solid Noise filter](/resources/gimp-red-tiles/01.png)

- Filters->Noise->RGB Noise

![RGB Noise filter](/resources/gimp-red-tiles/02.png)

- Filters->Blur->Motion Blur

![Motion Blur filter](/resources/gimp-red-tiles/03.png)

- On the "Inter" layer do: Colors->Colorize...->Hue=1

![Colorize Hue](/resources/gimp-red-tiles/04.png)

- Create new layer "Tiles", on the "Tiles" layer do: 

- Fill it with "#AA2222" color
- Filter->Distort->Mosaic

![Mosaic filter](/resources/gimp-red-tiles/11.png)

- Change opacity to 75

![Summary](/resources/gimp-red-tiles/12.png)

Source [.xcf file](/resources/gimp-red-tiles/red-tiles.xcf)
