model controller_2
  Modelica.Blocks.Interfaces.RealInput distillate_demand annotation(
    Placement(visible = true, transformation(origin = {-70, 106}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-44, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_conc annotation(
    Placement(visible = true, transformation(origin = {-71, 87}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-44, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_required annotation(
    Placement(visible = true, transformation(origin = {14, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Real seawater_flow;
  Modelica.Blocks.Interfaces.RealInput steam_flowrate annotation(
    Placement(visible = true, transformation(origin = {-71, 69}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-44, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput steam_reject annotation(
    Placement(visible = true, transformation(origin = {14, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  Modelica.Blocks.Interfaces.RealInput steam_temp annotation(
    Placement(visible = true, transformation(origin = {-71, 51}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-44, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//-78.6419 + 5.36598 x + 9.23055 y
  seawater_required = (-78.6419) + 5.36598 * seawater_conc + 9.23055 * distillate_demand;
//1.82289 + 0.0253708 a - 0.121521 b
  steam_required = 1.82289 + 0.0253708 * seawater_required - 0.121521 * seawater_conc;
  if steam_required <= steam_flowrate then
// heat_steam_req = heat_steam_in;
    steam_allowed = steam_required;
    steam_reject = steam_flowrate - steam_allowed;
    distillate_output = distillate_demand;
    seawater_allowed = seawater_required;
  else
    steam_allowed = steam_flowrate;
//steam_in = 0.0298675*seawater_allowed - 0.0644115*seawater_conc;
    steam_flowrate = 1.82289 + 0.0253708 * seawater_allowed - 0.121521 * seawater_conc;
    seawater_allowed = (-78.6419) + 5.36598 * seawater_conc + 9.23055 * distillate_output;
//seawater_allowed = -13.9388*seawater_conc + 61.716*distillate_output;
    steam_reject = 0;
//steam_allowed = steam_in;
//heat_steam_remain = heat_steam_in - required_steam;
  end if;

annotation(
    uses(Modelica(version = "3.2.3")),
  Diagram(graphics = {Rectangle(origin = {-26, 77}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, lineThickness = 2, extent = {{-28, 43}, {28, -43}})}, coordinateSystem(extent = {{-80, 120}, {20, 20}})),
  version = "",
  Icon(graphics = {Rectangle(origin = {14, 4}, fillColor = {85, 85, 127}, fillPattern = FillPattern.Solid, extent = {{-48, 90}, {48, -90}}), Text(origin = {12, 41}, extent = {{-32, 31}, {32, -31}}, textString = "controller")}));
end controller_2;
