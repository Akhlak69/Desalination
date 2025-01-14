model last_effect
  Modelica.Blocks.Interfaces.RealOutput steam_next_effect4 annotation(
    Placement(visible = true, transformation(origin = {-10, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {-12, 90}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brine_mass_flow3 annotation(
    Placement(visible = true, transformation(origin = {-97, 71}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-68, 44}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_next_effect3 annotation(
    Placement(visible = true, transformation(origin = {-97, 91}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-68, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sea_water_distillate_last annotation(
    Placement(visible = true, transformation(origin = {-10, 52}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {-12, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput total_brine_output annotation(
    Placement(visible = true, transformation(origin = {-9, 37}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {-12, 72}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  constant Real Lv_steam = 2258000 "J/kg";
  constant Real c_steam = 2100 "J/KgK";
  constant Real c_seawater = 4140 "J/KgK";
  constant Real c_seawater4 = 4000 "J/KgK";
  constant Real Lv_seawater = 2320000 "J/kg";
  Real total_steam4;
  Real brine_volume_flow3;
  Real total_salt_mass;
  Real brine_volume_flow5;
  Modelica.Blocks.Interfaces.RealOutput distillate_last_effect annotation(
    Placement(visible = true, transformation(origin = {12, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-22, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Real total_steam2;
  Modelica.Blocks.Interfaces.RealOutput steam_sea_out_last annotation(
    Placement(visible = true, transformation(origin = {-9, 67}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {-12, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_mass_in annotation(
    Placement(visible = true, transformation(origin = {117, 55}, extent = {{11, -11}, {-11, 11}}, rotation = 0), iconTransformation(origin = {100, -38}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput distillate_condenser annotation(
    Placement(visible = true, transformation(origin = {116, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {38, 36}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sea_water_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {42, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {38, -10}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_T_in annotation(
    Placement(visible = true, transformation(origin = {117, 41}, extent = {{11, -11}, {-11, 11}}, rotation = 0), iconTransformation(origin = {100, -18}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_T_out annotation(
    Placement(visible = true, transformation(origin = {116, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {38, 14}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_reject annotation(
    Placement(visible = true, transformation(origin = {116, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {39, -35}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_sea_in5 annotation(
    Placement(visible = true, transformation(origin = {13, -55}, extent = {{11, -11}, {-11, 11}}, rotation = 0), iconTransformation(origin = {-23, -33}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_mass_flow1 annotation(
    Placement(visible = true, transformation(origin = {10, -34}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-22, -74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_mass_flow_out annotation(
    Placement(visible = true, transformation(origin = {-72, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-84, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_next_effect5 annotation(
    Placement(visible = true, transformation(origin = {119, 69}, extent = {{13, -13}, {-13, 13}}, rotation = 0), iconTransformation(origin = {103, 45}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brine_conc4 annotation(
    Placement(visible = true, transformation(origin = {-97, 51}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-68, 68}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput final_brine_conc annotation(
    Placement(visible = true, transformation(origin = {-8, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-13, 105}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
//brine
  brine_volume_flow3 = brine_mass_flow3 / (1000 + brine_conc4) "mass flow to volume flow conversion m3/s";
  total_salt_mass = brine_volume_flow3 * brine_conc4 "total salt in seawater";
  
  //if total_brine_output == 0 then
  //brine_volume_flow4 = 0;
  //final_brine_conc = -1;
  //else
  brine_volume_flow5 = total_brine_output / (1000 + final_brine_conc);
  final_brine_conc = total_salt_mass / brine_volume_flow5;
  //end if;
  
  //steam_next_effect
  //if brine_mass_flow3 == 0 then
  //total_steam3 = 0;
  //else
  steam_next_effect3 * Lv_steam + steam_next_effect3 * c_steam * (66 - 44) + brine_mass_flow3 * c_seawater4 * (66 - 44) = total_steam4 * Lv_seawater "steam from previous effect boiling seawater";
    //end if;
    
  steam_next_effect3 = sea_water_distillate_last;
//seawater_mass_flow1 * c_seawater * (80 - 70) = steam_sea_out * c_steam * (95 - 80) + steam_sea_out * Lv_steam "steam from effect 1 heating seawater";
// seawater_out = seawater_mass_flow1 + steam_sea_out;
//seawater_mass_flow = seawater_out;
//if brine_mass_flow3 == 0 then
//steam_sea_out_last = 0;
  //else
  steam_sea_out_last * Lv_steam = sea_water_mass_flow1 * c_seawater * (38 - seawater_T_out);
    //end if;
    
  steam_sea_out_last = distillate_last_effect;
  total_steam4 = steam_sea_out_last + steam_next_effect4;
  total_brine_output = brine_mass_flow3 - total_steam4;

//condenser_block
  steam_next_effect4 * Lv_steam = seawater_mass_in * c_seawater * (seawater_T_out - seawater_T_in) "steam from previous effect condensing";
  distillate_condenser = steam_next_effect4;
  seawater_reject = 0.85 * seawater_mass_in;
  sea_water_mass_flow1 = seawater_mass_in - seawater_reject;
//steam_next_effect3
sea_water_mass_flow1 = seawater_mass_flow_out;
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(graphics = {Rectangle(origin = {-52, 62}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-32, 34}, {32, -34}}), Rectangle(origin = {-31, -53}, lineColor = {0, 0, 127}, lineThickness = 2, extent = {{-31, 31}, {31, -31}}), Rectangle(origin = {79, 37}, lineColor = {0, 0, 127}, lineThickness = 1.5, extent = {{-27, 39}, {27, -39}}), Text(origin = {-56, 37}, extent = {{-20, 9}, {20, -9}}, textString = "Last effect"), Text(origin = {-31, -36}, extent = {{-25, 8}, {25, -8}}, textString = "Pre-heater"), Text(origin = {74, 51}, extent = {{-18, 7}, {18, -7}}, textString = "condenser")}),
  Icon(graphics = {Rectangle(origin = {-40, 67}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-20, 45}, {20, -45}}), Rectangle(origin = {69, 9}, fillColor = {0, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-23, 51}, {23, -51}}), Rectangle(origin = {-53, -51}, fillColor = {170, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-21, 29}, {21, -29}}), Text(origin = {-39, 67}, lineColor = {255, 255, 255}, extent = {{-21, 9}, {21, -9}}, textString = "Last effect"), Text(origin = {-5, -43}, lineColor = {255, 255, 255}, extent = {{-21, 11}, {21, -11}}, textString = "Pre-heater"), Text(origin = {-53, -43}, lineColor = {255, 255, 255}, extent = {{-21, 11}, {21, -11}}, textString = "Pre-heater"), Text(origin = {71, 15}, lineColor = {255, 255, 255}, extent = {{-19, 17}, {19, -17}}, textString = "condenser")}));
end last_effect;
