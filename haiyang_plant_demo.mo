model haiyang_plant_demo
  Modelica.Blocks.Sources.Constant steam_temperature(k = 110) annotation(
    Placement(visible = true, transformation(origin = {-144, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_concentration(k = 15) annotation(
    Placement(visible = true, transformation(origin = {-86, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_available(k = 1282) annotation(
    Placement(visible = true, transformation(origin = {-88, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant heating_demand(k = 185600000)  annotation(
    Placement(visible = true, transformation(origin = {-86, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant distillate_required(k = 88.2) annotation(
    Placement(visible = true, transformation(origin = {-86, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  haiyang_plant haiyang_plant_trial annotation(
    Placement(visible = true, transformation(origin = {38, -4}, extent = {{-88, -88}, {88, 88}}, rotation = 0)));
equation
  connect(distillate_required.y, haiyang_plant_trial.distillate_demand) annotation(
    Line(points = {{-74, 72}, {-1, 72}}, color = {0, 0, 127}));
  connect(seawater_concentration.y, haiyang_plant_trial.seawater_conc) annotation(
    Line(points = {{-74, 36}, {-48, 36}, {-48, 47}, {-1, 47}}, color = {0, 0, 127}));
  connect(steam_temperature.y, haiyang_plant_trial.steam_temp) annotation(
    Line(points = {{-133, 4}, {-46, 4}, {-46, 3}, {-4, 3}}, color = {0, 0, 127}));
  connect(steam_available.y, haiyang_plant_trial.steam_flowrate) annotation(
    Line(points = {{-76, -34}, {-1, -34}}, color = {0, 0, 127}));
  connect(heating_demand.y, haiyang_plant_trial.district_heating) annotation(
    Line(points = {{-74, -68}, {-42.5, -68}, {-42.5, -62}, {-1, -62}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "3.2.3")));
end haiyang_plant_demo;
