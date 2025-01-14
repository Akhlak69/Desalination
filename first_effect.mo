model first_effect
  Modelica.Blocks.Interfaces.RealInput steam_sea_in annotation(
    Placement(visible = true, transformation(origin = {83, -27}, extent = {{15, -15}, {-15, 15}}, rotation = 0), iconTransformation(origin = {62, -26}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {84, -66}, extent = {{14, -14}, {-14, 14}}, rotation = 0), iconTransformation(origin = {64, -66}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput distillate_first_effect annotation(
    Placement(visible = true, transformation(origin = {82, -46}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {62, -46}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  constant Real Lv_steam = 2258000 "J/kg";
  constant Real c_steam = 2100 "J/KgK";
  constant Real c_seawater = 4140 "J/KgK";
  constant Real Lv_seawater = 2225000 "J/kg";
  Real total_steam;
  Real seawater_volume_flow;
  Real total_salt_mass;
  Real brine_volume_flow1;
  Modelica.Blocks.Interfaces.RealInput heat_steam_in annotation(
    Placement(visible = true, transformation(origin = {-70, 88}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-40, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tin_steam annotation(
    Placement(visible = true, transformation(origin = {-70, 52}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-39, 97}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput condensed_steam annotation(
    Placement(visible = true, transformation(origin = {-68, 36}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-40, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_mass_flow annotation(
    Placement(visible = true, transformation(origin = {54, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_next_effect annotation(
    Placement(visible = true, transformation(origin = {54, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_sea_out annotation(
    Placement(visible = true, transformation(origin = {54, 12}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {72, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Real Lv_seawater = 2270000 "J/kg";
    Modelica.Blocks.Interfaces.RealOutput seawater_mass_flow_out3 annotation(
    Placement(visible = true, transformation(origin = {4, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-10, -46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_in annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_conc annotation(
    Placement(visible = true, transformation(origin = {-72, 6}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-40, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_conc1 annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heat_steam_out annotation(
    Placement(visible = true, transformation(origin = {-68, 22}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-40, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
//effect 1
// if total_steam >= seawater_mass_flow1 then
//total_steam = seawater_mass_flow1;
// condensed_steam * Lv_steam + heat_steam_in * c_steam * (Tin_steam - 95) = total_steam * Lv_seawater + seawater_mass_flow1 * c_seawater * (95 - 80) "heat steam heating up seawater";
//else
  heat_steam_in * Lv_steam + heat_steam_in * c_steam * (Tin_steam - 100) = total_steam * Lv_seawater + seawater_mass_flow1 * c_seawater * (100 - 95) "heat steam heating up seawater";
    heat_steam_in = condensed_steam;
//end if;
  heat_steam_out = heat_steam_in - condensed_steam;
//(seawater_mass_flow1 * c_seawater * (80 - 70)) = (steam_sea_in * c_steam * (95 - 80)) + (steam_sea_in * Lv_steam) "steam from effect 1 heating seawater";
//brine
  seawater_volume_flow = seawater_mass_flow_out3 / (1000 + seawater_conc) "mass flow to volume flow conversion m3/s";
total_salt_mass = seawater_volume_flow*seawater_conc "total salt in seawater";
//if brine_mass_flow ==0 then
//brine_volume_flow1=0;
//brine_conc1 = -1;
//else
  brine_volume_flow1 = brine_mass_flow / (1000 + brine_conc1);
brine_conc1 = total_salt_mass / (brine_volume_flow1);
//end if;
//total_salt_mass = (seawater_mass_flow/1013)*13 "13kg/m3, ((kg/s)/(kg/m3))*kg/m3.... m3/s*kg/m3=kg/s" ;
//brine_volume = total_salt_mass/25 "salt volume is brine volume, mass/density.. (kg/s)/(kg/m3) ;
//brine_mass_flow = brine_volume * 1025 " brine volume * density;
//brine_mass_flow = (total_salt_mass/25) * 1.025;
// brine_mass_flow = seawater_distillate_first_effect / 1013 * 13 / 25 * 1025;
  brine_mass_flow = seawater_mass_flow1 - total_steam;
//steam mass balance
//pre-heater
  seawater_mass_flow1 * c_seawater * (95 - 85) = steam_sea_out * Lv_steam "steam from effect 1 heating seawater and condensing";
  steam_next_effect + steam_sea_out = total_steam;
//steam_sea_out = steam_sea_in;
  distillate_first_effect = steam_sea_out;  
  seawater_mass_flow1 = seawater_mass_flow_out3;
  annotation(
    Icon(graphics = {Rectangle(origin = {17, 45}, fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-47, 61}, {47, -61}}), Rectangle(origin = {27, -46}, fillColor = {85, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-27, 24}, {27, -24}}), Text(origin = {19, 48}, lineColor = {255, 255, 255}, extent = {{-15, 2}, {15, -2}}, textString = "Effect 1"), Text(origin = {29, -46}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, extent = {{-19, 12}, {19, -12}}, textString = "Pre-heater")}),
    uses(Modelica(version = "3.2.3")),
    Diagram(graphics = {Rectangle(origin = {-7, 49}, fillColor = {85, 0, 127}, lineThickness = 2.5, extent = {{-49, 41}, {49, -41}}), Rectangle(origin = {42, -46}, fillColor = {85, 0, 127}, lineThickness = 2.5, extent = {{-26, 32}, {26, -32}})}));
end first_effect;
