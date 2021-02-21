# Lights out problem solver

A simple optimizing solver for the [lights-out puzzle](https://www.logicgamesonline.com/lightsout/) using Answer Set Programming.
Assumes the use of [clingo](https://potassco.org/) ASP implementation.

This is meant for education purposes mostly. To understand this solver think about the following properties of the puzzle:

* The order of cell activations does not matter.
* To invert a cell, the ajacent cells (including itself) must be activated odd number times.
* To keep a cell value, the ajacent cells (including itself) must be activated even number times.
* It follows that each cell needs to be activated at most once in an optimal solution.
