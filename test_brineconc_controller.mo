model test_brineconc_controller
  custom_controller brine_conc_controller annotation(
    Placement(visible = true, transformation(origin = {-17, 29}, extent = {{-69, -69}, {69, 69}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_temp(k = 110) annotation(
    Placement(visible = true, transformation(origin = {-184, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_flowrate(k = 6.2) annotation(
    Placement(visible = true, transformation(origin = {-186, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine seawater_flowrate(amplitude = 10, freqHz = 10, offset = 250) annotation(
    Placement(visible = true, transformation(origin = {-186, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_conc(k = 15) annotation(
    Placement(visible = true, transformation(origin = {-186, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_temp(k = 20) annotation(
    Placement(visible = true, transformation(origin = {-186, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant desired_brine_conc(k = 55) annotation(
    Placement(visible = true, transformation(origin = {-216, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(steam_temp.y, brine_conc_controller.Tin_steam) annotation(
    Line(points = {{-172, 82}, {-68, 82}, {-68, 66}, {-42, 66}}, color = {0, 0, 127}));
  connect(steam_flowrate.y, brine_conc_controller.heat_steam_in) annotation(
    Line(points = {{-174, 52}, {-68, 52}, {-68, 50}, {-52, 50}}, color = {0, 0, 127}));
  connect(seawater_flowrate.y, brine_conc_controller.seawater_in) annotation(
    Line(points = {{-174, -6}, {-86, -6}, {-86, 14}, {-54, 14}}, color = {0, 0, 127}));
  connect(seawater_conc.y, brine_conc_controller.seawater_conc) annotation(
    Line(points = {{-174, -42}, {-76, -42}, {-76, -2}, {-48, -2}}, color = {0, 0, 127}));
  connect(seawater_temp.y, brine_conc_controller.seawater_Tin) annotation(
    Line(points = {{-174, -74}, {-64, -74}, {-64, -16}, {-34, -16}}, color = {0, 0, 127}));
  connect(desired_brine_conc.y, brine_conc_controller.desired_conc) annotation(
    Line(points = {{-204, 30}, {-131, 30}, {-131, 28}, {-58, 28}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-240, 100}, {80, -100}})),
    version = "");
end test_brineconc_controller;
