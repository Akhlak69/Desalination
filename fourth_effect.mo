model fourth_effect
  Modelica.Blocks.Interfaces.RealOutput steam_next_effect3 annotation(
    Placement(visible = true, transformation(origin = {-10, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {-12, 104}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brine_mass_flow2 annotation(
    Placement(visible = true, transformation(origin = {-97, 71}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-68, 44}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_next_effect2 annotation(
    Placement(visible = true, transformation(origin = {-97, 91}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-68, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sea_water_distillate4 annotation(
    Placement(visible = true, transformation(origin = {-10, 52}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {-12, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_mass_flow3 annotation(
    Placement(visible = true, transformation(origin = {-9, 37}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {-12, 72}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  constant Real Lv_steam = 2258000 "J/kg";
  constant Real c_steam = 2100 "J/KgK";
  constant Real c_seawater = 4140 "J/KgK";
  constant Real c_seawater3 = 4060 "J/KgK";
  constant Real Lv_seawater = 2275000 "J/kg";
  Real total_steam3;
  Real brine_volume_flow3;
  Real total_salt_mass;
  Real brine_volume_flow4;
  Modelica.Blocks.Interfaces.RealOutput distillate_fourth_effect annotation(
    Placement(visible = true, transformation(origin = {12, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-22, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Real total_steam2;
  Modelica.Blocks.Interfaces.RealOutput steam_sea_out3 annotation(
    Placement(visible = true, transformation(origin = {-9, 67}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {-12, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_sea_in4 annotation(
    Placement(visible = true, transformation(origin = {13, -55}, extent = {{11, -11}, {-11, 11}}, rotation = 0), iconTransformation(origin = {-23, -33}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {10, -34}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-22, -74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_mass_flow_out annotation(
    Placement(visible = true, transformation(origin = {-72, -46}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-84, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brine_conc3 annotation(
    Placement(visible = true, transformation(origin = {-97, 51}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-68, 68}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_conc4 annotation(
    Placement(visible = true, transformation(origin = {-8, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-13, 87}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
//brine
  brine_volume_flow3 = brine_mass_flow2 / (1000 + brine_conc3) "mass flow to volume flow conversion m3/s";
  total_salt_mass = brine_volume_flow3 * brine_conc3 "total salt in seawater";
  
  //if brine_mass_flow3 == 0 then
  //brine_conc4 = -1;
  //brine_volume_flow4 = 0;
  //else
  brine_volume_flow4 = brine_mass_flow3 / (1000 + brine_conc4);
brine_conc4 = total_salt_mass / (brine_volume_flow4);
//end if;

//if brine_volume_flow3 == 0 then 
//total_steam3 = 0;
//else
  steam_next_effect2 * Lv_steam + steam_next_effect2 * c_steam * (79 - 66) + brine_mass_flow2 * c_seawater3 * (79 - 66) = total_steam3 * Lv_seawater "steam from previous effect boiling seawater";
  //end if;
  
  steam_next_effect2 = sea_water_distillate4;
//seawater_mass_flow1 * c_seawater * (80 - 70) = steam_sea_out * c_steam * (95 - 80) + steam_sea_out * Lv_steam "steam from effect 1 heating seawater";
// seawater_out = seawater_mass_flow1 + steam_sea_out;
//seawater_mass_flow = seawater_out;
//if brine_mass_flow3 == 0 then
//steam_sea_out3 =0;
//else
  steam_sea_out3 * Lv_steam = seawater_mass_flow1 * c_seawater * (48 - 38);
  //end if;
  
  steam_sea_out3 = distillate_fourth_effect;
  total_steam3 = steam_sea_out3 + steam_next_effect3;
  brine_mass_flow3 = brine_mass_flow2 - total_steam3;
//condenser_block
 // steam_next_effect3 * Lv_steam = seawater_mass_in * c_seawater * (seawater_T_in - seawater_T_out) "steam from previous effect condensing";
 // distillate_condenser = steam_next_effect3;
 // seawater_reject = 0.85 * seawater_mass_in;
 // sea_water_mass_flow1 = seawater_mass_in - seawater_reject;
//steam_next_effect3
  seawater_mass_flow1 = seawater_mass_flow_out;
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(graphics = {Rectangle(origin = {-52, 62}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-32, 34}, {32, -34}}), Rectangle(origin = {-31, -53}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-31, 31}, {31, -31}}), Text(origin = {-56, 37}, extent = {{-20, 9}, {20, -9}}, textString = "Last effect"), Text(origin = {-31, -36}, extent = {{-25, 8}, {25, -8}}, textString = "Pre-heater")}),
  Icon(graphics = {Rectangle(origin = {-40, 67}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-20, 45}, {20, -45}}), Rectangle(origin = {-53, -51}, fillColor = {170, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-21, 29}, {21, -29}}), Text(origin = {-39, 67}, lineColor = {255, 255, 255}, extent = {{-21, 9}, {21, -9}}, textString = "Last effect"), Text(origin = {-5, -43}, lineColor = {255, 255, 255}, extent = {{-21, 11}, {21, -11}}, textString = "Pre-heater"), Text(origin = {-53, -43}, lineColor = {255, 255, 255}, extent = {{-21, 11}, {21, -11}}, textString = "Pre-heater")}));
end fourth_effect;
