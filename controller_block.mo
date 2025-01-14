model controller_block
  //Real seawater_volume_flow;
  //Real total_salt_mass(unit = "kg/s");
  //Real brine_volume_flow4 (unit = "m3/s");
  Real seawater_T_out (unit = "kg/s");
  
  Real steam_sea_out(unit = "kg/s");
  Real steam_sea_out1(unit = "kg/s");
  Real steam_sea_out2(unit = "kg/s");
  Real steam_sea_out3(unit = "kg/s");
  Real steam_sea_out_last(unit = "kg/s");
  
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
  
  Real required_steam(unit = "kg/s");
  Real seawater_mass_flow1 (unit = "kg/s");
  
  
  parameter Real Lv_steam(unit = "J/kg")=2258000 "latent heat of water";
  parameter Real c_steam(unit = "J/KgK")=2100 "specific heat of water";
  
  parameter Real c_seawater(unit = "J/KgK")=4140 "specific heat of seawater";
  parameter Real c_seawater1(unit = "J/KgK")=4170 "specific heat of seawater";
  parameter Real c_seawater2(unit = "J/KgK")=4080 "specific heat of seawater";
  parameter Real c_seawater3(unit = "J/KgK")=4060 "specific heat of seawater";
  parameter Real c_seawater4(unit = "J/KgK")=4000 "specific heat of seawater";
  
  
  parameter Real Lv_seawater(unit = "J/kg")=2225000 "latent heat of seawater";
  parameter Real Lv_seawater1(unit = "J/kg")=2235000 "latent heat of seawater";
  parameter Real Lv_seawater2(unit = "J/kg")=2250000 "latent heat of seawater";
  parameter Real Lv_seawater3(unit = "J/kg")=2275000 "latent heat of seawater";
  parameter Real Lv_seawater4(unit = "J/kg")=2320000 "latent heat of seawater";
  
  Real total_steam(unit = "kg/s") "steam produced in first effect";
  Real total_steam1(unit = "kg/s") "steam produced in first effect";
  Real total_steam2(unit = "kg/s") "steam produced in first effect";
  Real total_steam3(unit = "kg/s") "steam produced in first effect";
  Real total_steam4(unit = "kg/s") "steam produced in first effect";
  
  Modelica.Blocks.Interfaces.RealInput seawater_T_in annotation(
    Placement(visible = true, transformation(origin = {-70, 14}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-58, -10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heat_steam_req annotation(
    Placement(visible = true, transformation(origin = {54, 12}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {76, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heat_steam_remain annotation(
    Placement(visible = true, transformation(origin = {54, 42}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {76, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tin_steam annotation(
    Placement(visible = true, transformation(origin = {-70, 52}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-58, 64}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput heat_steam_in annotation(
    Placement(visible = true, transformation(origin = {-70, 88}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-58, 46}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_mass_in annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-58, 28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput total_distillate annotation(
    Placement(visible = true, transformation(origin = {-70, -4}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-58, -28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_conc annotation(
    Placement(visible = true, transformation(origin = {-70, 32}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-58, 8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));

equation
//First effect
   
    required_steam * Lv_steam + required_steam * c_steam * (Tin_steam - 100) = total_steam * Lv_seawater + seawater_mass_flow1 * c_seawater * (100 - 100) "heat steam heating up seawater";
    
    seawater_mass_flow1 * c_seawater * (100 - 85) = steam_sea_out * Lv_steam "pre-heater steam";
    
steam_next_effect + steam_sea_out = total_steam;
   
     
  if (required_steam > heat_steam_in) then
    heat_steam_req = heat_steam_in;
    heat_steam_remain = heat_steam_in - heat_steam_req;
  else
    heat_steam_req = required_steam;
    heat_steam_remain = heat_steam_in - required_steam;
  end if;
  
  
//effect 2

  steam_sea_out1*Lv_steam = seawater_mass_flow1*c_seawater*(85-70) "pre-heater steam";
 
  steam_next_effect * Lv_steam + steam_next_effect * c_steam * (100 - 90) + brine_mass_flow * c_seawater1 * (100 - 90)= total_steam1 * Lv_seawater1 "steam from previous effect to boil brine";
  
  total_steam1 = steam_sea_out1 + steam_next_effect1;
  brine_mass_flow = seawater_mass_flow1 - total_steam1;

//effect3
steam_sea_out2*Lv_steam = seawater_mass_flow1 * c_seawater * (70-48) "pre-heater steam";

steam_next_effect1 * Lv_steam + steam_next_effect1 * c_steam * (90 - 79) + brine_mass_flow1 * c_seawater2 * (90 - 79)= total_steam2 * Lv_seawater2 "steam from previous effect to boil seawater";

total_steam2 = steam_sea_out2 + steam_next_effect2;
brine_mass_flow1 = brine_mass_flow - total_steam1;

//effect 4
steam_sea_out3 * Lv_steam = seawater_mass_flow1 * c_seawater * (48 - 38)"pre-heater steam";

steam_next_effect2 * Lv_steam + steam_next_effect2 * c_steam * (79 - 66) + brine_mass_flow2 * c_seawater3 * (79 - 66) = total_steam3 * Lv_seawater3 "steam from previous effect to boil seawater"; 
 
total_steam3 = steam_sea_out3 + steam_next_effect3;
brine_mass_flow2 = brine_mass_flow1 - total_steam2;

//last_effect
  steam_sea_out_last * Lv_steam = seawater_mass_flow1 * c_seawater * (38 - 28)"pre-heater steam";
  
  steam_next_effect3 * Lv_steam + steam_next_effect3 * c_steam * (66 - 44) + brine_mass_flow3 * c_seawater4 * (66 - 44) = total_steam4 * Lv_seawater4 "steam from previous effect boiling seawater";
  
 brine_mass_flow3 = brine_mass_flow2 - total_steam3;
 total_brine_output = brine_mass_flow3 - total_steam3;
 
 total_steam4 = steam_next_effect4 + steam_sea_out_last;
  
  //condenser_block
  steam_next_effect4 * Lv_steam = seawater_mass_in * c_seawater * (seawater_T_in - seawater_T_out) "steam from previous effect condensing";
  
  seawater_mass_flow1 = 0.15 * seawater_mass_in;
 
 total_distillate = steam_sea_out + steam_sea_out1 + steam_sea_out2 + steam_sea_out3 + steam_sea_out_last + steam_next_effect + steam_next_effect1 + steam_next_effect2 + steam_next_effect3 + steam_next_effect4;
  
annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Rectangle(origin = {8, 17}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-58, 51}, {58, -51}}), Text(origin = {9, 23}, lineColor = {255, 255, 255}, extent = {{-33, 17}, {33, -17}}, textString = "controller")}));

end controller_block;
