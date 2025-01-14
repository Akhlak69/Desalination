model distillate_block
  Modelica.Blocks.Interfaces.RealInput distillate_1 annotation(
    Placement(visible = true, transformation(origin = {-58, 80}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-46, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_2 annotation(
    Placement(visible = true, transformation(origin = {-57, 65}, extent = {{-11, -11}, {11, 11}}, rotation = 0), iconTransformation(origin = {-46, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_3 annotation(
    Placement(visible = true, transformation(origin = {-58, 48}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-46, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_4 annotation(
    Placement(visible = true, transformation(origin = {-58, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-46, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_5 annotation(
    Placement(visible = true, transformation(origin = {-59, 19}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-46, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput total_distillate annotation(
    Placement(visible = true, transformation(origin = {96, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_6 annotation(
    Placement(visible = true, transformation(origin = {-57, 3}, extent = {{-11, -11}, {11, 11}}, rotation = 0), iconTransformation(origin = {-46, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_7 annotation(
    Placement(visible = true, transformation(origin = {-60, -12}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-46, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_8 annotation(
    Placement(visible = true, transformation(origin = {-58, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-46, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_9 annotation(
    Placement(visible = true, transformation(origin = {-58, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-46, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_10 annotation(
    Placement(visible = true, transformation(origin = {-58, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-46, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
total_distillate = distillate_1+distillate_2+distillate_3+distillate_4+distillate_5+distillate_6+distillate_7+distillate_8+distillate_9+distillate_10;
annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(graphics = {Rectangle(origin = {19, 9}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-65, 77}, {65, -77}})}),
  Icon(graphics = {Rectangle(origin = {7, -12}, lineThickness = 2, extent = {{-43, 96}, {43, -96}}), Text(origin = {11, 13}, extent = {{-25, 17}, {25, -17}}, textString = "total distillate", fontSize = 14)}, coordinateSystem(extent = {{-60, 100}, {60, -120}})),
  version = "");
end distillate_block;
