model desal_effects
  Modelica.Blocks.Sources.Constant T_steam(k = 99.977)  annotation(
    Placement(visible = true, transformation(origin = {-204, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant heat_steam_flowrate(k = 5)  annotation(
    Placement(visible = true, transformation(origin = {-204, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_conc(k = 15) annotation(
    Placement(visible = true, transformation(origin = {-206, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  distillate_block total_distillate annotation(
    Placement(visible = true, transformation(origin = {142, -52}, extent = {{-38, -38}, {38, 38}}, rotation = 0)));
  first_effect Effect_1 annotation(
    Placement(visible = true, transformation(origin = {-124, 44}, extent = {{-48, -48}, {48, 48}}, rotation = 0)));
equation
  connect(Effect_2.seawater_mass_flow_out2, first_effect.seawater_mass_flow1) annotation(
    Line(points = {{-64, 42}, {-90, 42}, {-90, 28}, {-108, 28}}, color = {0, 0, 127}));
  connect(first_effect.distillate_first_effect, total_distillate.distillate_1) annotation(
    Line(points = {{-122, 28}, {-66, 28}, {-66, -26}, {124, -26}}, color = {0, 0, 127}));
  connect(T_steam.y, Effect_1.Tin_steam) annotation(
    Line(points = {{-192, 80}, {-162, 80}, {-162, 84}, {-144, 84}}, color = {0, 0, 127}));
  connect(heat_steam_flowrate.y, Effect_1.heat_steam_in) annotation(
    Line(points = {{-192, 46}, {-170, 46}, {-170, 74}, {-144, 74}}, color = {0, 0, 127}));
  connect(seawater_conc.y, Effect_1.seawater_conc) annotation(
    Line(points = {{-194, -2}, {-158, -2}, {-158, 42}, {-144, 42}}, color = {0, 0, 127}));
  connect(Effect_1.seawater_mass_flow_out3, Effect_1.seawater_in) annotation(
    Line(points = {{-128, 22}, {-166, 22}, {-166, 62}, {-144, 62}}, color = {0, 0, 127}));
  connect(Effect_1.steam_sea_out, Effect_1.steam_sea_in) annotation(
    Line(points = {{-90, 52}, {-82, 52}, {-82, 32}, {-94, 32}}, color = {0, 0, 127}));
  connect(Effect_1.distillate_first_effect, total_distillate.distillate_1) annotation(
    Line(points = {{-94, 22}, {-84, 22}, {-84, -26}, {124, -26}}, color = {0, 0, 127}));
protected
  annotation(
    uses(Modelica(version = "3.2.3")));
end desal_effects;
