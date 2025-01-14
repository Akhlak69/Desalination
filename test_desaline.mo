model test_desaline
  ThermoPower.Water.Tank tank(A = 1, V0 = 1, allowFlowReversal = false, hstart = 4200, y(start = 0.1), y0 = 1, ystart = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-16, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Water = ThermoPower.Water.StandardWater;
  ThermoPower.Water.SourceW sourceW(allowFlowReversal = false)  annotation(
    Placement(visible = true, transformation(origin = {-64, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SinkW sinkW(allowFlowReversal = false)  annotation(
    Placement(visible = true, transformation(origin = {56, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Desal desal annotation(
    Placement(visible = true, transformation(origin = {-91, 49}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  ThermoPower.Water.SensW sensW annotation(
    Placement(visible = true, transformation(origin = {32, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput out_w annotation(
    Placement(visible = true, transformation(origin = {64, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {85, 81}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-4, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput h_output annotation(
    Placement(visible = true, transformation(origin = {64, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy (redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 2000000) annotation(
    Placement(visible = true, transformation(origin = {-168, 44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-168, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 2540000) annotation(
    Placement(visible = true, transformation(origin = {-168, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant4(k = 7.58) annotation(
    Placement(visible = true, transformation(origin = {-188, 28}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(sensW.outlet, sinkW.flange) annotation(
    Line(points = {{38, 10}, {46, 10}}, color = {0, 0, 255}));
  connect(sensW.w, out_w) annotation(
    Line(points = {{40, 20}, {40, 50}, {64, 50}}, color = {0, 0, 127}));
  connect(tank.outlet, specificEnthalpy.port) annotation(
    Line(points = {{-8, 14}, {-2, 14}, {-2, 10}, {10, 10}}, color = {0, 0, 255}));
  connect(specificEnthalpy.port, sensW.inlet) annotation(
    Line(points = {{10, 10}, {26, 10}}, color = {0, 127, 255}));
  connect(specificEnthalpy.h_out, h_output) annotation(
    Line(points = {{22, 20}, {26, 20}, {26, 74}, {64, 74}}, color = {0, 0, 127}));
  connect(constant1.y, desal.seawater_enthalpy) annotation(
    Line(points = {{-162, 44}, {-141, 44}, {-141, 50}, {-116, 50}}, color = {0, 0, 127}));
  connect(constant2.y, desal.seawater_flowrate) annotation(
    Line(points = {{-162, 14}, {-142, 14}, {-142, 30}, {-116, 30}}, color = {0, 0, 127}));
  connect(constant3.y, desal.steam_enthalpy) annotation(
    Line(points = {{-162, 64}, {-134, 64}, {-134, 59.5}, {-116, 59.5}}, color = {0, 0, 127}));
  connect(constant4.y, desal.steam_flowrate) annotation(
    Line(points = {{-182, 28}, {-116, 28}, {-116, 39}}, color = {0, 0, 127}));
  connect(desal.potable_total, sourceW.in_w0) annotation(
    Line(points = {{-68, 58}, {-68, 18}}, color = {0, 0, 127}));
  connect(desal.potable_total, sinkW.in_w0) annotation(
    Line(points = {{-68, 58}, {52, 58}, {52, 16}}, color = {0, 0, 127}));
  connect(desal.enthalpy_potable, sourceW.in_h) annotation(
    Line(points = {{-68, 38}, {-60, 38}, {-60, 18}}, color = {0, 0, 127}));
  connect(desal.enthalpy_potable, sinkW.in_h) annotation(
    Line(points = {{-68, 38}, {60, 38}, {60, 16}}, color = {0, 0, 127}));
  connect(sourceW.flange, tank.inlet) annotation(
    Line(points = {{-54, 12}, {-24, 12}, {-24, 14}}, color = {0, 0, 255}));
protected
  annotation(
    uses(Modelica(version = "3.2.3"), ThermoPower(version = "3.1")),
    Icon(graphics = {Rectangle(origin = {-16, 5}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-82, 101}, {82, -101}}), Text(origin = {-23, 68}, extent = {{-69, 14}, {69, -14}}, textString = "Desalination")}),
    Diagram(coordinateSystem(extent = {{-200, 100}, {80, -40}})),
    version = "");
end test_desaline;
