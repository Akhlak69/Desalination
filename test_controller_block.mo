model test_controller_block
  controller_block test_controller_block annotation(
    Placement(visible = true, transformation(origin = {47, 33}, extent = {{-51, -51}, {51, 51}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_temp(k = 110)  annotation(
    Placement(visible = true, transformation(origin = {-74, 86}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_flow_rate(k = 8)  annotation(
    Placement(visible = true, transformation(origin = {-48, 62}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_conc(k = 15)  annotation(
    Placement(visible = true, transformation(origin = {-46, 32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_temp(k = 20)  annotation(
    Placement(visible = true, transformation(origin = {-46, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant total_distillate(k = 27.3)  annotation(
    Placement(visible = true, transformation(origin = {-44, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine seawater_flowrate(amplitude = 50, offset = 200) annotation(
    Placement(visible = true, transformation(origin = {-84, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(steam_temp.y, test_controller_block.Tin_steam) annotation(
    Line(points = {{-65, 86}, {-15, 86}, {-15, 66}, {17, 66}}, color = {0, 0, 127}));
  connect(steam_flow_rate.y, test_controller_block.heat_steam_in) annotation(
    Line(points = {{-39, 62}, {-8, 62}, {-8, 56}, {17, 56}}, color = {0, 0, 127}));
  connect(seawater_flowrate.y, test_controller_block.seawater_mass_in) annotation(
    Line(points = {{-73, 46}, {17, 46}, {17, 47}}, color = {0, 0, 127}));
  connect(seawater_conc.y, test_controller_block.seawater_conc) annotation(
    Line(points = {{-38, 32}, {-30, 32}, {-30, 37}, {17, 37}}, color = {0, 0, 127}));
  connect(seawater_temp.y, test_controller_block.seawater_T_in) annotation(
    Line(points = {{-38, 2}, {-30, 2}, {-30, 28}, {17, 28}}, color = {0, 0, 127}));
  connect(total_distillate.y, test_controller_block.total_distillate) annotation(
    Line(points = {{-36, -32}, {-16, -32}, {-16, 19}, {17, 19}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end test_controller_block;
