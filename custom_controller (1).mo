model custom_controller
  Modelica.Blocks.Interfaces.RealInput heat_steam_in annotation(
    Placement(visible = true, transformation(origin = {-70, 88}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_in annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tin_steam annotation(
    Placement(visible = true, transformation(origin = {-70, 52}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-36, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_conc annotation(
    Placement(visible = true, transformation(origin = {-70, 32}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput desired_conc annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real seawater_volume_flow;
  Real total_distillate;
  Real total_salt_mass(unit = "kg/s");
  Real brine_volume_flow4;
  Real steam_sea_out1(unit = "kg/s");
  Real steam_sea_out2(unit = "kg/s");
  Real steam_sea_out3(unit = "kg/s");
  Real brine_mass_flow(unit = "kg/s");
  Real brine_mass_flow1(unit = "kg/s");
  Real brine_mass_flow2(unit = "kg/s");
  Real brine_mass_flow3(unit = "kg/s");
  Real total_brine_output(unit = "kg/s");
  Real steam_next_effect(unit = "kg/s");
  Real steam_next_effect1(unit = "kg/s");
  Real steam_next_effect2(unit = "kg/s");
  Real steam_next_effect3(unit = "kg/s");
  Real steam_next_effect4(unit = "kg/s");
  Real steam_sea_out_last(unit = "kg/s");
  Real steam_sea_out(unit = "kg/s");
  Real required_steam(unit = "kg/s");
  parameter Real Lv_steam(unit = "J/kg") = 2258000 "latent heat of water";
  parameter Real c_steam(unit = "J/KgK") = 2100 "specific heat of water";
  parameter Real c_seawater(unit = "J/KgK") = 4140 "specific heat of seawater";
  parameter Real c_seawater1(unit = "J/KgK") = 4170 "specific heat of seawater";
  parameter Real c_seawater2(unit = "J/KgK") = 4080 "specific heat of seawater";
  parameter Real c_seawater3(unit = "J/KgK") = 4060 "specific heat of seawater";
  parameter Real c_seawater4(unit = "J/KgK") = 4000 "specific heat of seawater";
  parameter Real Lv_seawater(unit = "J/kg") = 2225000 "latent heat of seawater";
  parameter Real Lv_seawater1(unit = "J/kg") = 2235000 "latent heat of seawater";
  parameter Real Lv_seawater2(unit = "J/kg") = 2250000 "latent heat of seawater";
  parameter Real Lv_seawater3(unit = "J/kg") = 2275000 "latent heat of seawater";
  parameter Real Lv_seawater4(unit = "J/kg") = 2320000 "latent heat of seawater";
  Real total_steam(unit = "kg/s") "steam produced in first effect";
  Real total_steam1(unit = "kg/s") "steam produced in first effect";
  Real total_steam2(unit = "kg/s") "steam produced in first effect";
  Real total_steam3(unit = "kg/s") "steam produced in first effect";
  Real total_steam4(unit = "kg/s") "steam produced in first effect";
  Modelica.Blocks.Interfaces.RealInput seawater_Tin annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-24, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heat_steam_req annotation(
    Placement(visible = true, transformation(origin = {54, 12}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {112, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heat_steam_remain annotation(
    Placement(visible = true, transformation(origin = {54, 42}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {112, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//last_effect
  seawater_volume_flow = 0.15 * seawater_in / (1000 + seawater_conc) "mass flow to volume flow conversion m3/s";
  total_salt_mass = seawater_volume_flow * seawater_conc "total salt in seawater";
  desired_conc = total_salt_mass / brine_volume_flow4;
  brine_volume_flow4 = total_brine_output / (1000 + desired_conc);
  steam_sea_out_last * Lv_steam = 0.15 * seawater_in * c_seawater * (38 - 28);
  steam_next_effect4 * Lv_steam = seawater_in * c_seawater * (28 - seawater_Tin);
  total_steam4 = steam_sea_out_last + steam_next_effect4;
  total_brine_output = brine_mass_flow3 - total_steam4;
  steam_next_effect3 * Lv_steam + steam_next_effect3 * c_steam * (66 - 44) + brine_mass_flow3 * c_seawater4 * (66 - 44) = total_steam4 * Lv_seawater4 "steam from previous effect boiling seawater";
//fourth_effect
  steam_sea_out3 * Lv_steam = 0.15 * seawater_in * c_seawater * (48 - 38);
  total_steam3 = steam_sea_out3 + steam_next_effect3;
  brine_mass_flow3 = brine_mass_flow2 - total_steam3;
  steam_next_effect2 * Lv_steam + steam_next_effect2 * c_steam * (79 - 66) + brine_mass_flow2 * c_seawater3 * (79 - 66) = total_steam3 * Lv_seawater3 "steam from previous effect boiling seawater";
//third_effect
  steam_sea_out2 * Lv_steam = 0.15 * seawater_in * c_seawater * (70 - 48);
  total_steam2 = steam_sea_out2 + steam_next_effect2;
  brine_mass_flow2 = brine_mass_flow1 - total_steam2;
  steam_next_effect1 * Lv_steam + steam_next_effect1 * c_steam * (90 - 79) + brine_mass_flow1 * c_seawater2 * (90 - 79) = total_steam2 * Lv_seawater2 "steam from previous effect boiling seawater";
//Second Effect
  steam_sea_out1 * Lv_steam = 0.15 * seawater_in * c_seawater * (85 - 70);
  total_steam1 = steam_sea_out1 + steam_next_effect1;
  brine_mass_flow1 = brine_mass_flow - total_steam1;
  steam_next_effect * Lv_steam + steam_next_effect * c_steam * (100 - 90) + brine_mass_flow * c_seawater1 * (100 - 90) = total_steam1 * Lv_seawater1 "steam from previous effect boiling seawater";
//First effect
  0.15 * seawater_in * c_seawater * (100 - 85) = steam_sea_out * Lv_steam;
  steam_next_effect + steam_sea_out = total_steam;
  required_steam * Lv_steam + required_steam * c_steam * (Tin_steam - 100) = total_steam * Lv_seawater + 0.15 * seawater_in * c_seawater * (100 - 100);
  total_distillate = steam_sea_out+steam_sea_out1+steam_sea_out2+steam_sea_out3+steam_sea_out_last+steam_next_effect+steam_next_effect1+steam_next_effect2+steam_next_effect3+steam_next_effect4;
//seawater_in*0.15 = brine_mass_flow + total_steam;
  if required_steam > heat_steam_in then
    heat_steam_req = heat_steam_in;
    heat_steam_remain = heat_steam_in - heat_steam_req;
  else
    heat_steam_req = required_steam;
    heat_steam_remain = heat_steam_in - required_steam;
  end if;
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Ellipse(origin = {27, 0}, lineColor = {170, 0, 127}, fillColor = {170, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-75, 78}, {75, -78}}), Text(origin = {25, 3}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, extent = {{-55, 39}, {55, -39}}, textString = "concentration controller")}));
end custom_controller;
