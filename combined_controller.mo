model combined_controller
  Modelica.Blocks.Interfaces.RealInput total_distillate annotation(
    Placement(visible = true, transformation(origin = {-68, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-64, 54}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_mass_in annotation(
    Placement(visible = true, transformation(origin = {62, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {38, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heat_steam_in annotation(
    Placement(visible = true, transformation(origin = {60, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {38, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
constant Real m1 = 9.04324896980604;
constant Real m2 = 0.0258869229457007;
constant Real c1 = 0;
constant Real c2 = 7.105427357601E-16;
equation
seawater_mass_in = m1* total_distillate + c1;
heat_steam_in = m2 * seawater_mass_in + c2;

annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Rectangle(origin = {-10, 13}, fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-40, 63}, {40, -63}}), Text(origin = {-8, 21}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-36, 25}, {36, -25}}, textString = "controller")}));
end combined_controller;
