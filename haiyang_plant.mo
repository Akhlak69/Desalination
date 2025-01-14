model haiyang_plant
  Modelica.Blocks.Interfaces.RealInput distillate_demand annotation(
    Placement(visible = true, transformation(origin = {-70, 106}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-44, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_conc annotation(
    Placement(visible = true, transformation(origin = {-71, 87}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-44, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_required annotation(
    Placement(visible = true, transformation(origin = {14, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Real seawater_flow;
  Modelica.Blocks.Interfaces.RealInput steam_flowrate annotation(
    Placement(visible = true, transformation(origin = {-71, 69}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-44, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_required annotation(
    Placement(visible = true, transformation(origin = {14, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Real steam_allowed;
  //Real seawater_allowed;
  Modelica.Blocks.Interfaces.RealOutput distillate_output annotation(
    Placement(visible = true, transformation(origin = {14, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput seawater_allowed annotation(
    Placement(visible = true, transformation(origin = {14, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_allowed annotation(
    Placement(visible = true, transformation(origin = {14, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real steam_sp_enthalpy = 2696035;
  // J/kgK for 1bar and 110 C
  //parameter Real cp_in = 2100;
  //parameter Real cp_out = 2100;
  parameter Real T_in = 254.6;
  // desal/district in temp degrees C
  parameter Real T_sat = 184.06;
  // desal output temp degrees C
  //parameter Real T_3 = 50;  //turbine output temp
  parameter Real sp_enthalpy_out1 = 2773522;
  // weighted enthalpy out of LP turbine
  parameter Real sp_enthalpy_out2 = 2686297;
  parameter Real sp_enthalpy_in = 2949367;
  parameter Real generator_efficiency = 0.98;
  parameter Real turbine_efficiency1 = 0.8864457;
  parameter Real turbine_efficiency2 = 0.90571;
  parameter Real specific_heat_cap = 2227.69 ; // J/kgK
  //parameter Real district_heating = 160 * 10^6; //in Watts
  Real enthalpy_required;
  Real steam_mass_flow_desal;
  Real steam_dh;
  Real electric_power_loss;
  Real turbine_power_loss;
  Real sp_enthalpy_out;
  Real turbine_efficiency;
  //Real loss_efficiency;
  Real steam_extracted;
  Real hp_turbine_output;
  constant Real Lv_steam = 2258000 "J/kg";
  constant Real c_steam = 2100 "J/KgK";
  Modelica.Blocks.Interfaces.RealInput district_heating annotation(
    Placement(visible = true, transformation(origin = {-71, 33}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-44, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_temp annotation(
    Placement(visible = true, transformation(origin = {-71, 51}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(extent = {{-61, -5}, {-35, 21}}, rotation = 0)));
equation
//-78.6419 + 5.36598 x + 9.23055 y
  seawater_required = (-78.6419) + 5.36598 * seawater_conc + 9.23055 * distillate_demand;
//1.82289 + 0.0253708 a - 0.121521 b
  steam_required = 1.82289 + 0.0253708 * seawater_required - 0.121521 * seawater_conc;
  enthalpy_required = steam_required * Lv_steam + steam_required * c_steam * (110 - 100);//steam_required * steam_sp_enthalpy;
// 110C, 1 bar steam
  (steam_mass_flow_desal * Lv_steam) + (steam_mass_flow_desal * specific_heat_cap*(T_in - T_sat)) = enthalpy_required;
// steam flow to desal satisfying enthalpy required
//sp_enthalpy_in = cp_in * T_in;
  if steam_mass_flow_desal <= steam_flowrate then
    steam_allowed = steam_mass_flow_desal;
    distillate_output = distillate_demand;
    seawater_allowed = seawater_required;
  else
    steam_allowed = steam_flowrate;
    steam_flowrate = 1.82289 + 0.0253708 * seawater_allowed - 0.121521 * seawater_conc;
    seawater_allowed = (-78.6419) + 5.36598 * seawater_conc + 9.23055 * distillate_output;
  end if;
//(steam_allowed * (cp_out * T_out)) + (steam_dh * (cp_in * T_in)) = district_heating;
  //(steam_dh *0.3655* (sp_enthalpy_in - sp_enthalpy_out1)) + (0.6345 * steam_dh * (sp_enthalpy_in - sp_enthalpy_out2)) = district_heating / (0.9 * 0.9);

hp_turbine_output = (1577.62*(2785617.6 - 2539992) + 89.911*(2785617.6 - 2685599.6) + 82.9389*(2785617.6-2718396.2)+ 71.716*(2785617.6-2610469.8))/(0.98*0.9);

steam_flowrate * (sp_enthalpy_in - sp_enthalpy_out) = (1170*10^6/(0.98*0.9)) - hp_turbine_output;



steam_dh * (sp_enthalpy_in - sp_enthalpy_out) = district_heating / (0.9 * 0.9);
// 0.6345 = 74.764/(74.764+43.067)
  
  steam_extracted = steam_allowed + steam_dh;
  turbine_efficiency = (turbine_efficiency1+turbine_efficiency2)/2;
  turbine_power_loss = steam_extracted * (sp_enthalpy_in - sp_enthalpy_out)*turbine_efficiency;
  //turbine_power_loss = (steam_extracted * 0.3655 * (sp_enthalpy_in - sp_enthalpy_out1) * turbine_efficiency1) + (steam_extracted * 0.6345 * (sp_enthalpy_in - sp_enthalpy_out2) * turbine_efficiency2);


//watts
//loss_efficiency = 1 - (T_3+273)/(T_in+273);
  electric_power_loss = generator_efficiency * turbine_power_loss;
// if steam_required <= steam_flowrate then
// heat_steam_req = heat_steam_in;
//  steam_allowed = steam_required;
//steam_reject = steam_flowrate - steam_allowed;
//distillate_output = distillate_demand;
//seawater_allowed = seawater_required;
//else
//steam_allowed = steam_flowrate;
//steam_in = 0.0298675*seawater_allowed - 0.0644115*seawater_conc;
//steam_flowrate = 1.82289 + 0.0253708 * seawater_allowed - 0.121521 * seawater_conc;
//seawater_allowed = (-78.6419) + 5.36598 * seawater_conc + 9.23055 * distillate_output;
//seawater_allowed = -13.9388*seawater_conc + 61.716*distillate_output;
//steam_reject = 0;
//steam_allowed = steam_in;
//heat_steam_remain = heat_steam_in - required_steam;
//end if;
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(graphics = {Rectangle(origin = {-26, 77}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, lineThickness = 2, extent = {{-28, 43}, {28, -43}})}, coordinateSystem(extent = {{-80, 120}, {20, 20}})),
    version = "",
    Icon(graphics = {Rectangle(origin = {14, 4}, fillColor = {85, 85, 127}, fillPattern = FillPattern.Solid, extent = {{-48, 90}, {48, -90}}), Text(origin = {12, 41}, extent = {{-32, 31}, {32, -31}}, textString = "controller")}));
end haiyang_plant;
