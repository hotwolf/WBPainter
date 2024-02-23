<a name="TOP"></a>
# WBPainter
![WBPainter](img/wbp.gif?raw=true)

WindoWBPainter is a project to recycle old 3D printers.
It's a vertical plotter, to be mounted on a whiteboard.

This project is still work in progress. Here is my todo list:

| Status | Task  |
|:---|:---|
| &#9989; | Setup the project |
| &#9989; | Start the design |
| &#9989; | Run the NopSCADlib flow |
| &#10060; | Complete an initial version of the design |
| &#10060; | Add assembly descriptions |
| &#10060; | Simplify the BOM |
| &#10060; | Finalize the build instructions |
| &#10060; | Build a prototype |
| &#10060; | Refine the design |
| &#10060; | Setup a project web site |
| &#9989; | Render an animated title picture |
| &#10060; | Configure/customize the Marlin firmware |
| &#10060; | Plot the first image |

<span></span>

---
## Table of Contents
1. [Parts list](#Parts_list)
1. [WBPController Assembly](#WBPController_assembly)
1. [WBPWeight Assembly](#WBPWeight_assembly)
1. [WBPGondolaLifter Assembly](#WBPGondolaLifter_assembly)
1. [WBPGondolaPenClampD18 Assembly](#WBPGondolaPenClampD18_assembly)
1. [WBPGondolaPenBearings Assembly](#WBPGondolaPenBearings_assembly)
1. [WBPGondola Assembly](#WBPGondola_assembly)
1. [WBPStepperEndstopLeft Assembly](#WBPStepperEndstopLeft_assembly)
1. [WBPStepperMountWithInlays Assembly](#WBPStepperMountWithInlays_assembly)
1. [WBPStepperMounRight Assembly](#WBPStepperMounRight_assembly)
1. [WBPAlignerRight Assembly](#WBPAlignerRight_assembly)
1. [WBPPulley Assembly](#WBPPulley_assembly)
1. [WBPStepperShaftRight Assembly](#WBPStepperShaftRight_assembly)
1. [WBPStepperClampRight Assembly](#WBPStepperClampRight_assembly)
1. [WBPStepperMountLeft Assembly](#WBPStepperMountLeft_assembly)
1. [WBPAlignerLeft Assembly](#WBPAlignerLeft_assembly)
1. [WBPStepperShaftLeft Assembly](#WBPStepperShaftLeft_assembly)
1. [WBPStepperClampLeft Assembly](#WBPStepperClampLeft_assembly)
1. [Main Assembly](#main_assembly)

<span></span>
[Top](#TOP)

---
<a name="Parts_list"></a>
## Parts list
| <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPController</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">2 x WBPWeight</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPGondolaLifter</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">2 x WBPGondolaPenClampD18</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPGondolaPenBearings</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPGondola</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">2 x WBPStepperEndstopLeft</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPStepperMounRight</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPAlignerRight</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">2 x WBPPulley</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPStepperShaftRight</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPStepperClampRight</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPStepperMountLeft</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPAlignerLeft</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPStepperShaftLeft</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">WBPStepperClampLeft</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Main</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">TOTALS</span> |  |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|:---|
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | **Vitamins** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Beaded chain (diameter=3mm, spacing=4mm) |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Beaded chain (diameter=3mm, spacing=4mm) |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Microswitch SS-01 or SS-5GL |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;16&nbsp; | &nbsp;&nbsp; Nut M3 x 2.4mm  |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Nut M3nS 5.5 x 1.8mm  |
| &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; RapRapDiscount Smart Controller |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; SG90 servo motor |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Screw M3 dome x  8mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Screw M3 dome x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Screw M3 dome x 12mm |
| &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Screw M3 dome x 20mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp; Screw M3 pan x  8mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Stepper motor NEMA17 x 40mm |
| &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;5&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;5&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;26&nbsp; | &nbsp;&nbsp; Washer  M3 x 7mm x 0.5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Washer star M3 x 0.5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Window pen |
| &nbsp;&nbsp;9&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;14&nbsp; | &nbsp;&nbsp;13&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;13&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;87&nbsp; | &nbsp;&nbsp;Total vitamins count |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | **3D printed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;WBPAlignerIdler.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;WBPAlignerLeft.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;WBPAlignerRight.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPGondolaBearing.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPGondolaPenClampD18Part1.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPGondolaPenClampD18Part2.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPGondolaPenClampD18Part3.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPGondolaPenClampD18Part4.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPPulley.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;WBPServoGear.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;WBPServoLifter.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;WBPStepperEndstopLeft.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;WBPStepperEndstopRight.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPStepperMountWithInlays.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;WBPWeightBottom.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPWeightIdler.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;WBPWeightTop.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;31&nbsp; | &nbsp;&nbsp;Total 3D printed parts count |

<span></span>
[Top](#TOP)

---
<a name="WBPController_assembly"></a>
## WBPController Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| RapRapDiscount Smart Controller|
|4| Screw M3 dome x 20mm|
|4| Washer  M3 x 7mm x 0.5mm|


### Assembly instructions
![WBPController_assembly](assemblies/WBPController_assembly_tn.png)

TBD

![WBPController_assembled](assemblies/WBPController_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPWeight_assembly"></a>
## 2 x WBPWeight Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Nut M3 x 2.4mm |
|2| Screw M3 dome x 20mm|
|2| Washer  M3 x 7mm x 0.5mm|


### 3D Printed parts

| 2 x WBPWeightBottom.stl | 2 x WBPWeightIdler.stl | 2 x WBPWeightTop.stl |
|---|---|---|
| ![WBPWeightBottom.stl](stls/WBPWeightBottom.png) | ![WBPWeightIdler.stl](stls/WBPWeightIdler.png) | ![WBPWeightTop.stl](stls/WBPWeightTop.png) 



### Assembly instructions
![WBPWeight_assembly](assemblies/WBPWeight_assembly_tn.png)

TBD

![WBPWeight_assembled](assemblies/WBPWeight_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPGondolaLifter_assembly"></a>
## WBPGondolaLifter Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| SG90 servo motor|


### 3D Printed parts

| 1 x WBPServoGear.stl | 1 x WBPServoLifter.stl | 1 x WBPWeightBottom.stl |
|---|---|---|
| ![WBPServoGear.stl](stls/WBPServoGear.png) | ![WBPServoLifter.stl](stls/WBPServoLifter.png) | ![WBPWeightBottom.stl](stls/WBPWeightBottom.png) 



### Assembly instructions
![WBPGondolaLifter_assembly](assemblies/WBPGondolaLifter_assembly_tn.png)

TBD

![WBPGondolaLifter_assembled](assemblies/WBPGondolaLifter_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPGondolaPenClampD18_assembly"></a>
## 2 x WBPGondolaPenClampD18 Assembly
### 3D Printed parts

| 2 x WBPGondolaPenClampD18Part1.stl | 2 x WBPGondolaPenClampD18Part2.stl | 2 x WBPGondolaPenClampD18Part3.stl |
|---|---|---|
| ![WBPGondolaPenClampD18Part1.stl](stls/WBPGondolaPenClampD18Part1.png) | ![WBPGondolaPenClampD18Part2.stl](stls/WBPGondolaPenClampD18Part2.png) | ![WBPGondolaPenClampD18Part3.stl](stls/WBPGondolaPenClampD18Part3.png) 


| 2 x WBPGondolaPenClampD18Part4.stl |
|---|
| ![WBPGondolaPenClampD18Part4.stl](stls/WBPGondolaPenClampD18Part4.png) 



### Assembly instructions
![WBPGondolaPenClampD18_assembly](assemblies/WBPGondolaPenClampD18_assembly_tn.png)

TBD

![WBPGondolaPenClampD18_assembled](assemblies/WBPGondolaPenClampD18_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPGondolaPenBearings_assembly"></a>
## WBPGondolaPenBearings Assembly
### 3D Printed parts

| 2 x WBPGondolaBearing.stl |
|---|
| ![WBPGondolaBearing.stl](stls/WBPGondolaBearing.png) 



### Sub-assemblies

| 2 x WBPGondolaPenClampD18_assembly |
|---|
| ![WBPGondolaPenClampD18_assembled](assemblies/WBPGondolaPenClampD18_assembled_tn.png) 



### Assembly instructions
![WBPGondolaPenBearings_assembly](assemblies/WBPGondolaPenBearings_assembly.png)

![WBPGondolaPenBearings_assembled](assemblies/WBPGondolaPenBearings_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="WBPGondola_assembly"></a>
## WBPGondola Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Window pen|


### Sub-assemblies

| 1 x WBPGondolaLifter_assembly | 1 x WBPGondolaPenBearings_assembly |
|---|---|
| ![WBPGondolaLifter_assembled](assemblies/WBPGondolaLifter_assembled_tn.png) | ![WBPGondolaPenBearings_assembled](assemblies/WBPGondolaPenBearings_assembled_tn.png) 



### Assembly instructions
![WBPGondola_assembly](assemblies/WBPGondola_assembly.png)

TBD

![WBPGondola_assembled](assemblies/WBPGondola_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperEndstopLeft_assembly"></a>
## 2 x WBPStepperEndstopLeft Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Microswitch SS-01 or SS-5GL|
|4| Nut M3 x 2.4mm |
|4| Screw M3 dome x 12mm|
|4| Washer  M3 x 7mm x 0.5mm|


### 3D Printed parts

| 1 x WBPStepperEndstopLeft.stl | 1 x WBPStepperEndstopRight.stl |
|---|---|
| ![WBPStepperEndstopLeft.stl](stls/WBPStepperEndstopLeft.png) | ![WBPStepperEndstopRight.stl](stls/WBPStepperEndstopRight.png) 



### Assembly instructions
![WBPStepperEndstopLeft_assembly](assemblies/WBPStepperEndstopLeft_assembly_tn.png)

TBD

![WBPStepperEndstopLeft_assembled](assemblies/WBPStepperEndstopLeft_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperMountWithInlays_assembly"></a>
## 2 x WBPStepperMountWithInlays Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|6| Nut M3 x 2.4mm |


### 3D Printed parts

| 2 x WBPStepperMountWithInlays.stl |
|---|
| ![WBPStepperMountWithInlays.stl](stls/WBPStepperMountWithInlays.png) 



### Assembly instructions
![WBPStepperMountWithInlays_assembly](assemblies/WBPStepperMountWithInlays_assembly_tn.png)

TBD

![WBPStepperMountWithInlays_assembled](assemblies/WBPStepperMountWithInlays_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperMounRight_assembly"></a>
## WBPStepperMounRight Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| Screw M3 pan x  8mm|
|1| Stepper motor NEMA17 x 40mm|
|3| Washer  M3 x 7mm x 0.5mm|
|3| Washer star M3 x 0.5mm|


### Sub-assemblies

| 1 x WBPStepperMountWithInlays_assembly |
|---|
| ![WBPStepperMountWithInlays_assembled](assemblies/WBPStepperMountWithInlays_assembled_tn.png) 



### Assembly instructions
![WBPStepperMounRight_assembly](assemblies/WBPStepperMounRight_assembly_tn.png)

![WBPStepperMounRight_assembled](assemblies/WBPStepperMounRight_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPAlignerRight_assembly"></a>
## WBPAlignerRight Assembly
### 3D Printed parts

| 2 x WBPAlignerIdler.stl | 1 x WBPAlignerRight.stl |
|---|---|
| ![WBPAlignerIdler.stl](stls/WBPAlignerIdler.png) | ![WBPAlignerRight.stl](stls/WBPAlignerRight.png) 



### Assembly instructions
![WBPAlignerRight_assembly](assemblies/WBPAlignerRight_assembly_tn.png)

TBD

![WBPAlignerRight_assembled](assemblies/WBPAlignerRight_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPPulley_assembly"></a>
## 2 x WBPPulley Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Nut M3nS 5.5 x 1.8mm |
|2| Screw M3 pan x  8mm|


### 3D Printed parts

| 2 x WBPPulley.stl |
|---|
| ![WBPPulley.stl](stls/WBPPulley.png) 



### Assembly instructions
![WBPPulley_assembly](assemblies/WBPPulley_assembly_tn.png)

TBD

![WBPPulley_assembled](assemblies/WBPPulley_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperShaftRight_assembly"></a>
## WBPStepperShaftRight Assembly
### Sub-assemblies

| 1 x WBPAlignerRight_assembly | 1 x WBPPulley_assembly | 1 x WBPStepperMounRight_assembly |
|---|---|---|
| ![WBPAlignerRight_assembled](assemblies/WBPAlignerRight_assembled_tn.png) | ![WBPPulley_assembled](assemblies/WBPPulley_assembled_tn.png) | ![WBPStepperMounRight_assembled](assemblies/WBPStepperMounRight_assembled_tn.png) 



### Assembly instructions
![WBPStepperShaftRight_assembly](assemblies/WBPStepperShaftRight_assembly_tn.png)

TBD

![WBPStepperShaftRight_assembled](assemblies/WBPStepperShaftRight_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperClampRight_assembly"></a>
## WBPStepperClampRight Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Nut M3 x 2.4mm |
|2| Screw M3 dome x  8mm|
|3| Screw M3 dome x 10mm|
|5| Washer  M3 x 7mm x 0.5mm|


### Sub-assemblies

| 1 x WBPStepperEndstopLeft_assembly | 1 x WBPStepperShaftRight_assembly |
|---|---|
| ![WBPStepperEndstopLeft_assembled](assemblies/WBPStepperEndstopLeft_assembled_tn.png) | ![WBPStepperShaftRight_assembled](assemblies/WBPStepperShaftRight_assembled_tn.png) 



### Assembly instructions
![WBPStepperClampRight_assembly](assemblies/WBPStepperClampRight_assembly_tn.png)

![WBPStepperClampRight_assembled](assemblies/WBPStepperClampRight_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperMountLeft_assembly"></a>
## WBPStepperMountLeft Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| Screw M3 pan x  8mm|
|1| Stepper motor NEMA17 x 40mm|
|3| Washer  M3 x 7mm x 0.5mm|
|3| Washer star M3 x 0.5mm|


### Sub-assemblies

| 1 x WBPStepperMountWithInlays_assembly |
|---|
| ![WBPStepperMountWithInlays_assembled](assemblies/WBPStepperMountWithInlays_assembled_tn.png) 



### Assembly instructions
![WBPStepperMountLeft_assembly](assemblies/WBPStepperMountLeft_assembly_tn.png)

TBD

![WBPStepperMountLeft_assembled](assemblies/WBPStepperMountLeft_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPAlignerLeft_assembly"></a>
## WBPAlignerLeft Assembly
### 3D Printed parts

| 2 x WBPAlignerIdler.stl | 1 x WBPAlignerLeft.stl |
|---|---|
| ![WBPAlignerIdler.stl](stls/WBPAlignerIdler.png) | ![WBPAlignerLeft.stl](stls/WBPAlignerLeft.png) 



### Assembly instructions
![WBPAlignerLeft_assembly](assemblies/WBPAlignerLeft_assembly_tn.png)

TBD

![WBPAlignerLeft_assembled](assemblies/WBPAlignerLeft_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperShaftLeft_assembly"></a>
## WBPStepperShaftLeft Assembly
### Sub-assemblies

| 1 x WBPAlignerLeft_assembly | 1 x WBPPulley_assembly | 1 x WBPStepperMountLeft_assembly |
|---|---|---|
| ![WBPAlignerLeft_assembled](assemblies/WBPAlignerLeft_assembled_tn.png) | ![WBPPulley_assembled](assemblies/WBPPulley_assembled_tn.png) | ![WBPStepperMountLeft_assembled](assemblies/WBPStepperMountLeft_assembled_tn.png) 



### Assembly instructions
![WBPStepperShaftLeft_assembly](assemblies/WBPStepperShaftLeft_assembly_tn.png)

TBD

![WBPStepperShaftLeft_assembled](assemblies/WBPStepperShaftLeft_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="WBPStepperClampLeft_assembly"></a>
## WBPStepperClampLeft Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Nut M3 x 2.4mm |
|2| Screw M3 dome x  8mm|
|3| Screw M3 dome x 10mm|
|5| Washer  M3 x 7mm x 0.5mm|


### Sub-assemblies

| 1 x WBPStepperEndstopLeft_assembly | 1 x WBPStepperShaftLeft_assembly |
|---|---|
| ![WBPStepperEndstopLeft_assembled](assemblies/WBPStepperEndstopLeft_assembled_tn.png) | ![WBPStepperShaftLeft_assembled](assemblies/WBPStepperShaftLeft_assembled_tn.png) 



### Assembly instructions
![WBPStepperClampLeft_assembly](assemblies/WBPStepperClampLeft_assembly_tn.png)

![WBPStepperClampLeft_assembled](assemblies/WBPStepperClampLeft_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="main_assembly"></a>
## Main Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Beaded chain (diameter=3mm, spacing=4mm)|
|1| Beaded chain (diameter=3mm, spacing=4mm)|


### Sub-assemblies

| 1 x WBPController_assembly | 1 x WBPGondola_assembly | 1 x WBPStepperClampLeft_assembly |
|---|---|---|
| ![WBPController_assembled](assemblies/WBPController_assembled_tn.png) | ![WBPGondola_assembled](assemblies/WBPGondola_assembled_tn.png) | ![WBPStepperClampLeft_assembled](assemblies/WBPStepperClampLeft_assembled_tn.png) 


| 1 x WBPStepperClampRight_assembly | 2 x WBPWeight_assembly |
|---|---|
| ![WBPStepperClampRight_assembled](assemblies/WBPStepperClampRight_assembled_tn.png) | ![WBPWeight_assembled](assemblies/WBPWeight_assembled_tn.png) 



### Assembly instructions
![main_assembly](assemblies/main_assembly.png)

A vertical plotter  . 
Finished!

![main_assembled](assemblies/main_assembled.png)

<span></span>
[Top](#TOP)
