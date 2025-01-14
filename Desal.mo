model Desal
  Modelica.Blocks.Interfaces.RealOutput potable_total annotation(
    Placement(visible = true, transformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_flowrate "unit = kg/s" annotation(
    Placement(visible = true, transformation(origin = {-100, 14}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-118, -48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

//Real x2;
  //Real x3;
  //Real z;
  //Real Scale;
  Modelica.Blocks.Interfaces.RealInput steam_enthalpy "unit = J/kg" annotation(
    Placement(visible = true, transformation(origin = {-100, -38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-118, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
constant Real e = 82800 "energy required per kg potable";
Real cp= 1.9e3;
constant Real h2 = 4200 "enthlapy of potable";
Real h3 "enthalpy of residual brine";
  //Real output_desal = 1.39;
  //Real h;
  Modelica.Blocks.Interfaces.RealInput seawater_flowrate "unit = kg/s"annotation(
    Placement(visible = true, transformation(origin = {-102, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_enthalpy "unit = J/kg" annotation(
    Placement(visible = true, transformation(origin = {-100, -78}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-118, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput feedback_flow annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput potable_storage annotation(
    Placement(visible = true, transformation(origin = {100, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput brine_res annotation(
    Placement(visible = true, transformation(origin = {102, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput enthalpy_potable annotation(
    Placement(visible = true, transformation(origin = {104, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//h = input_t * cp;
  potable_total * e + potable_total * h2 + brine_res * h3 = seawater_flowrate * seawater_enthalpy + steam_flowrate * steam_enthalpy "energy balance";
  feedback_flow = steam_flowrate "feedback to loop";
  potable_total = feedback_flow + potable_storage ;
  potable_storage = 34 "potable demand from Atkau plant";
  enthalpy_potable = h2;
  potable_total + brine_res = steam_flowrate + seawater_flowrate "mass balance";

annotation(
    Icon(graphics = {Rectangle(origin = {0, -8}, fillPattern = FillPattern.Solid, extent = {{-98, 58}, {98, -58}}), Text(origin = {-3, 66}, extent = {{-69, 22}, {69, -22}}, textString = "Desalination Block", fontSize = 14)}),
    uses(Modelica(version = "3.2.3")));
end Desal;
