---
layout: post
title: ERM - How did WOPR decide the only winning move is not to play?
date: 2012-10-02
categories: ["WOPR", "evolutionary algorithms", "hardware simulation", "intrinsic evolution", "extrinsic evolution", "risk modeling", "reconfigurable hardware", "fitness evaluation", "algorithmic variations", "systemic risk analysis"]
excerpt: WOPR evolved and learned while playing against himself
---
"A strange game.  The only winning move is not to play."

WOPR evolved and learned while playing against himself.  Nifty!  As WOPR drew
additional power, assumedly, WOPR was able to evolve due to extrinsic /
intrinsic features.  Extrinsic evolution uses software simulation of the
hardware to evaluate the effectiveness of each new model. This is great where
the threat may not be too specific or rather abstract. It is best to apply
this to the underlying hardware due to the fact abstraction from the
underlying hardware will lead to a less optimal model. Intrinsic evolution is
implemented in the hardware. Each model is evaluated and implemented based
upon the threat, vulnerability, and other quantitative data. This is extremely
useful for deducing the risk's properties which can not be known by
traditional risk methodologies. Imagine this as if each variant in the model
is downloaded to the chip as a data design configuration. Where the fitness is
evaluated by applying test vectors and calculating the fitness value from its'
response.

Assuming threat characteristics, for evolvable modelling design issues, an
evolutionary algorithm determines some of the structure or parameters of a
reconfigurable item. This item may exist in software, although it could be a
simulation of the hardware of a final implementation. The reconfigurable item
might alternatively be physically changeable hardware. Typically, the item is
embedded in some sort of environment, where it responds, influences, and
behaves. The evolutionary model creator devises a fitness evaluation procedure
that monitors and possibly manipulates the environment and items, returning
objective function metrics.  An algorithm generates structural / parametric
variations of the risk, by applying variation operators (mutate, cross over,
etc..) to some representation of the object's configuration. All the system
gets back are the measured objective values. Another way of thinking about the
evaluation / environment / object process as a black-box system.  Where WOPR
played each scenario and came to the same conclusion for all "The only winning
move is not to play."


