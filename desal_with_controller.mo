model desal_with_controller
  controller_2 controller annotation(
    Placement(visible = true, transformation(origin = {25, 81}, extent = {{-95, -95}, {95, 95}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_temp annotation(
    Placement(visible = true, transformation(origin = {-144, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -22}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_flowrate annotation(
    Placement(visible = true, transformation(origin = {-144, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -54}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_conc annotation(
    Placement(visible = true, transformation(origin = {-146, 150}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-81, 73}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput distillate_demand annotation(
    Placement(visible = true, transformation(origin = {-130, 106}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 10}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_temp annotation(
    Placement(visible = true, transformation(origin = {-144, 194}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 42}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput distillate_output annotation(
    Placement(visible = true, transformation(origin = {635, -71}, extent = {{-29, -29}, {29, 29}}, rotation = 0), iconTransformation(origin = {48, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput final_brine_conc annotation(
    Placement(visible = true, transformation(origin = {622, 196}, extent = {{-26, -26}, {26, 26}}, rotation = 0), iconTransformation(origin = {48, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput condensed_steam annotation(
    Placement(visible = true, transformation(origin = {626, 82}, extent = {{-26, -26}, {26, 26}}, rotation = 0), iconTransformation(origin = {48, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  desal_effects_block desal_plant annotation(
    Placement(visible = true, transformation(origin = {455.291, -218.497}, extent = {{-274.586, 137.293}, {54.9173, 384.421}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput reject_steam annotation(
    Placement(visible = true, transformation(origin = {631, -149}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {48, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(steam_temp, controller.steam_temp) annotation(
    Line(points = {{-144, 2}, {-88.5, 2}, {-88.5, 18}, {-17, 18}}, color = {0, 0, 127}));
  connect(steam_flowrate, controller.steam_flowrate) annotation(
    Line(points = {{-144, 32}, {-97, 32}, {-97, 49}, {-17, 49}}, color = {0, 0, 127}));
  connect(distillate_demand, controller.distillate_demand) annotation(
    Line(points = {{-130, 106}, {-90, 106}, {-90, 123}, {-17, 123}}, color = {0, 0, 127}));
//connect(condensed_steam, desal_plant.condensed_steam_out) annotation(
//    Line(points = {{431, -81}, {136, -81}, {136, 64}, {168, 64}}, color = {0, 0, 127}));
//connect(condensed_steam, desal_plant.steam_not_condensed) annotation(
//    Line(points = {{438, -98}, {118, -98}, {118, 80}, {170, 80}}, color = {0, 0, 127}));
  connect(seawater_conc, controller.seawater_conc) annotation(
    Line(points = {{-146, 150}, {-98, 150}, {-98, 166.5}, {-17, 166.5}}, color = {0, 0, 127}));
  connect(controller.steam_allowed, desal_plant.steam_w) annotation(
    Line(points = {{93, 68}, {100.4, 68}, {100.4, 23}, {148, 23}}, color = {0, 0, 127}));
  connect(desal_plant.final_brine_conc, final_brine_conc) annotation(
    Line(points = {{286, 168}, {448, 168}, {448, 196}, {622, 196}}, color = {0, 0, 127}));
  connect(controller.seawater_allowed, desal_plant.seawater_w) annotation(
    Line(points = {{93, 92}, {106.5, 92}, {106.5, 84}, {148, 84}}, color = {0, 0, 127}));
  connect(seawater_temp, desal_plant.seawater_T) annotation(
    Line(points = {{-144, 194}, {148, 194}, {148, 139}}, color = {0, 0, 127}));
  connect(steam_temp, desal_plant.T_in_steam) annotation(
    Line(points = {{-144, 2}, {-82, 2}, {-82, -91}, {144, -91}}, color = {0, 0, 127}));
  connect(seawater_conc, desal_plant.seawater_conc) annotation(
    Line(points = {{-146, 150}, {-74, 150}, {-74, 188}, {144, 188}}, color = {0, 0, 127}));
  connect(controller.steam_reject, reject_steam) annotation(
    Line(points = {{93, 11}, {88, 11}, {88, -148}, {632, -148}}, color = {0, 0, 127}));
  connect(desal_plant.distillate, distillate_output) annotation(
    Line(points = {{293, -14}, {498, -14}, {498, -70}, {636, -70}}, color = {0, 0, 127}));
  connect(desal_plant.condensed_steam, condensed_steam) annotation(
    Line(points = {{293, 55}, {483, 55}, {483, 82}, {626, 82}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-240, 500}, {780, -200}})),
    version = "",
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Rectangle(origin = {-14, 10}, fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-52, 72}, {52, -72}}), Text(origin = {-16, 46}, lineColor = {255, 255, 255}, lineThickness = 1, extent = {{-34, 22}, {34, -22}}, textString = "Desalination Plant", textStyle = {TextStyle.Bold})}));
end desal_with_controller;
