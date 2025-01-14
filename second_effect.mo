model second_effect
  Modelica.Blocks.Interfaces.RealInput steam_next_effect annotation(
    Placement(visible = true, transformation(origin = {-98, 92}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-84, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brine_mass_flow annotation(
    Placement(visible = true, transformation(origin = {-97, 71}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-84, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sea_water_distillate annotation(
    Placement(visible = true, transformation(origin = {-10, 52}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {10, 28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_next_effect1 annotation(
    Placement(visible = true, transformation(origin = {-10, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {9, 75}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_sea_out1 annotation(
    Placement(visible = true, transformation(origin = {-9, 67}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {9, 13}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput distillate_second_effect annotation(
    Placement(visible = true, transformation(origin = {6, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {16, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput sea_water_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {-38, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {16, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {-9, 37}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {9, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  constant Real Lv_steam = 2258000 "J/kg";
  constant Real c_steam = 2100 "J/KgK";
  constant Real c_seawater = 4140 "J/KgK";
  constant Real c_seawater1 = 4170 "J/KgK";
  constant Real Lv_seawater = 2235000 "J/kg";
  Real total_steam1;
  Real brine_volume_flow;
  Real total_salt_mass;
  Real brine_volume_flow2;
  Modelica.Blocks.Interfaces.RealInput steam_sea_in2 annotation(
    Placement(visible = true, transformation(origin = {1, -35}, extent = {{11, -11}, {-11, 11}}, rotation = 0), iconTransformation(origin = {15, -33}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_mass_flow_out2 annotation(
    Placement(visible = true, transformation(origin = {-46, -26}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-54, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brine_conc1 annotation(
    Placement(visible = true, transformation(origin = {-97, 51}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-84, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_conc2 annotation(
    Placement(visible = true, transformation(origin = {-8, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {9, 59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
//brine
  brine_volume_flow = brine_mass_flow / (1000 + brine_conc1) "mass flow to volume flow conversion m3/s";
total_salt_mass = brine_volume_flow*brine_conc1 "total salt in seawater";
//if brine_mass_flow1 == 0 then
//brine_volume_flow2 =0;
//brine_conc2=-1;
//else
  brine_volume_flow2 = brine_mass_flow1 / (1000 + brine_conc2);
brine_conc2 = total_salt_mass / (brine_volume_flow2);
//end if;
//brine_volume_flow = brine_mass_flow/1025 "mass flow to volume flow conversion m3/s";
//total_salt_mass = brine_volume_flow*25 "total salt in seawater";
//total_salt_mass = (brine_mass_flow/1025)*25 "25kg/m3, ((kg/s)/(kg/m3))*kg/m3.... m3/s*kg/m3=kg/s" ;
//brine_volume_flow1 = total_salt_mass/30 "salt volume is brine volume, mass/density.. (kg/s)/(kg/m3) ;
//brine_mass_flow1 = brine_volume_flow1 * 1030 " brine volume * density;
//brine_mass_flow1 = (total_salt_mass/30) * 1030;
//brine_mass_flow1 = ((brine_mass_flow/ 1025 * 25) / 30) * 1030;
//if brine_mass_flow == 0 then
//total_steam1 = 0;
//else
  steam_next_effect * Lv_steam + steam_next_effect * c_steam * (100 - 90) + brine_mass_flow * c_seawater1 * (100 - 90) = total_steam1 * Lv_seawater "steam from previous effect boiling seawater";
//end if;
////steam_next_effect * Lv_steam + steam_next_effect * c_steam * (100 - 90) = total_steam1 * Lv_seawater "steam from previous effect boiling seawater";
  steam_next_effect = sea_water_distillate;
//seawater_mass_flow1 * c_seawater * (80 - 70) = steam_sea_out * c_steam * (95 - 80) + steam_sea_out * Lv_steam "steam from effect 1 heating seawater";
// seawater_out = seawater_mass_flow1 + steam_sea_out;
//seawater_mass_flow = seawater_out;
//if brine_mass_flow == 0 then
//steam_sea_out1 =0;
//else
  steam_sea_out1 * Lv_steam = sea_water_mass_flow1 * c_seawater * (85 - 70);
//end if;
  steam_sea_out1 = distillate_second_effect;
total_steam1 = steam_sea_out1 + steam_next_effect1;

brine_mass_flow1 = brine_mass_flow - total_steam1;
seawater_mass_flow_out2 = sea_water_mass_flow1;
  annotation(
    uses(Modelica(version = "3.2.3")),
  Diagram(graphics = {Rectangle(origin = {-52, 62}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-32, 34}, {32, -34}}), Rectangle(origin = {-20, -47}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-20, 37}, {20, -37}})}, coordinateSystem(extent = {{-120, 120}, {20, -100}})),
  Icon(graphics = {Rectangle(origin = {-36, 50}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-38, 36}, {38, -36}}), Rectangle(origin = {-19, -53}, lineColor = {170, 0, 127}, fillColor = {170, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-25, 35}, {25, -35}}), Text(origin = {-35, 52}, lineColor = {255, 255, 255}, extent = {{-17, 4}, {17, -4}}, textString = "EFFECT 2"), Text(origin = {-18, -45}, lineColor = {255, 255, 255}, extent = {{-18, 5}, {18, -5}}, textString = "Pre-heater")}),
  version = "");
end second_effect;
