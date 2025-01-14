model third_effect
  Modelica.Blocks.Interfaces.RealInput steam_next_effect1 annotation(
    Placement(visible = true, transformation(origin = {-98, 92}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-70, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput sea_water_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {-38, -62}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {30, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sea_water_distillate2 annotation(
    Placement(visible = true, transformation(origin = {-10, 52}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {8, 36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_mass_flow2 annotation(
    Placement(visible = true, transformation(origin = {-9, 37}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_sea_out2 annotation(
    Placement(visible = true, transformation(origin = {-9, 67}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {9, 17}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput distillate_third_effect annotation(
    Placement(visible = true, transformation(origin = {12, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {30, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brine_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {-97, 71}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_next_effect2 annotation(
    Placement(visible = true, transformation(origin = {-10, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {8, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
 constant Real Lv_steam = 2258000 "J/kg";
  constant Real c_steam = 2100 "J/KgK";
  constant Real c_seawater = 4140 "J/KgK";
  constant Real c_seawater2 = 4080 "J/KgK";
  constant Real Lv_seawater = 2250000 "J/kg";
  Real total_steam2;
  Real brine_volume_flow3;
  Real total_salt_mass;
  Real brine_volume_flow2;
 Modelica.Blocks.Interfaces.RealInput steam_sea_in3 annotation(
    Placement(visible = true, transformation(origin = {13, -55}, extent = {{11, -11}, {-11, 11}}, rotation = 0), iconTransformation(origin = {29, -37}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
 Modelica.Blocks.Interfaces.RealOutput seawater_mass_flow_out1 annotation(
    Placement(visible = true, transformation(origin = {-48, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-40, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Blocks.Interfaces.RealOutput brine_conc3 annotation(
    Placement(visible = true, transformation(origin = {-8, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {7, 71}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
 Modelica.Blocks.Interfaces.RealInput brine_conc2 annotation(
    Placement(visible = true, transformation(origin = {-97, 51}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-70, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//brine
  brine_volume_flow2 = brine_mass_flow1 / (1000 + brine_conc2) "mass flow to volume flow conversion m3/s";
  total_salt_mass = brine_volume_flow2 * brine_conc2 "total salt in seawater";
 //if brine_mass_flow2 == 0 then
  //brine_conc3 = -1;
  //brine_volume_flow3 = 0;
 //else
brine_volume_flow3 = brine_mass_flow2 / (1000+brine_conc3);
brine_conc3 = total_salt_mass / (brine_volume_flow3);
//end if;

//if brine_mass_flow1 ==0 then
//total_steam2 = 0;
//else
steam_next_effect1 * Lv_steam + steam_next_effect1 * c_steam * (90 - 79) + brine_mass_flow1 * c_seawater2 * (90 - 79)= total_steam2 * Lv_seawater "steam from previous effect boiling seawater";
//end if;

steam_next_effect1 = sea_water_distillate2;
//seawater_mass_flow1 * c_seawater * (80 - 70) = steam_sea_out * c_steam * (95 - 80) + steam_sea_out * Lv_steam "steam from effect 1 heating seawater";
// seawater_out = seawater_mass_flow1 + steam_sea_out;
//seawater_mass_flow = seawater_out;

//if brine_mass_flow1 == 0 then
//steam_sea_out2 = 0;
//else
steam_sea_out2*Lv_steam = sea_water_mass_flow1*c_seawater*(70-48);
//end if;

steam_sea_out2 = distillate_third_effect;
total_steam2 = steam_sea_out2 + steam_next_effect2;
brine_mass_flow2 = brine_mass_flow1 - total_steam2;
seawater_mass_flow_out1 = sea_water_mass_flow1;
annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(graphics = {Rectangle(origin = {-18, -65}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-18, 19}, {18, -19}}), Rectangle(origin = {-52, 62}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-32, 34}, {32, -34}})}),
 Icon(graphics = {Rectangle(origin = {-30, 52}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-30, 46}, {30, -46}}), Text(origin = {-30, 58}, lineColor = {255, 255, 255}, extent = {{-20, 6}, {20, -6}}, textString = "Effect 3"), Rectangle(origin = {-5, -57}, fillColor = {170, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-25, 33}, {25, -33}}), Text(origin = {-5, -43}, lineColor = {255, 255, 255}, extent = {{-17, 5}, {17, -5}}, textString = "Pre-heater")}));
end third_effect;
