model desalination_block
replaceable package Water = ThermoPower.Water.StandardWater;
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {96, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ThermoPower.System system1 annotation(
    Placement(visible = true, transformation(origin = {40, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Desal desal annotation(
    Placement(visible = true, transformation(origin = {-29, 31}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  ThermoPower.Water.SourceW sourceW annotation(
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Examples.RankineCycle.Models.PrescribedSpeedPump prescribedSpeedPump(redeclare package FluidMedium = Water,SSInit = false, head_nom = {450, 300, 0}, n0 = 1000, nominalInletPressure(displayUnit = "Pa") = 50000, nominalMassFlowRate = 100, nominalOutletPressure(displayUnit = "Pa") = 3000000, q_nom = {0, 0.055, 0.1}, rho0(displayUnit = "g/cm3") = 1000) annotation(
    Placement(visible = true, transformation(origin = {29, -53}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant constant3(k = 20) annotation(
    Placement(visible = true, transformation(origin = {-22, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ThermoPower.Water.SensW sensW(allowFlowReversal = true)  annotation(
    Placement(visible = true, transformation(origin = {106, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1e3) annotation(
    Placement(visible = true, transformation(origin = {-148, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2[1](k = 1e3) annotation(
    Placement(visible = true, transformation(origin = {-150, 32}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant6(k = 50) annotation(
    Placement(visible = true, transformation(origin = {-150, -34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant5(k = 22) annotation(
    Placement(visible = true, transformation(origin = {-154, 2}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ThermoPower.Examples.RankineCycle.Models.PrescribedSpeedPump prescribedSpeedPump1(redeclare package FluidMedium = Water, SSInit = false, head_nom = {450, 300, 0}, n0 = 1000, nominalInletPressure(displayUnit = "Pa") = 50000, nominalMassFlowRate = 10, nominalOutletPressure(displayUnit = "Pa") = 3000000, q_nom = {0, 0.055, 0.1}, rho0(displayUnit = "g/cm3") = 1000) annotation(
    Placement(visible = true, transformation(origin = {97, -53}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant constant4(k = -20) annotation(
    Placement(visible = true, transformation(origin = {-10, -72}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ThermoPower.Water.SinkW sinkW annotation(
    Placement(visible = true, transformation(origin = {148, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant7(k = 0.5) annotation(
    Placement(visible = true, transformation(origin = {130, -64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ThermoPower.Water.Tank tank(A = 1, V0 = 1, allowFlowReversal = false, initOpt = ThermoPower.Choices.Init.Options.noInit, p(start = 1e5), y(start = 0.1), y0 = 1, ystart = 0.1) annotation(
    Placement(visible = true, transformation(origin = {72, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(desal.output_w, sourceW.in_w0) annotation(
    Line(points = {{-14, 32}, {-4, 32}, {-4, 2}}, color = {0, 0, 127}));
  connect(constant3.y, prescribedSpeedPump.nPump) annotation(
    Line(points = {{-15, -30}, {24, -30}, {24, -48}}, color = {0, 0, 127}));
  connect(sourceW.flange, prescribedSpeedPump.inlet) annotation(
    Line(points = {{10, -4}, {22, -4}, {22, -52}}, color = {0, 0, 255}));
  connect(constant1.y, desal.input_h) annotation(
    Line(points = {{-142, 80}, {-54, 80}, {-54, 38}, {-44, 38}}, color = {0, 0, 127}));
  connect(constant2.y, desal.input_h1) annotation(
    Line(points = {{-144, 32}, {-44, 32}}, color = {0, 0, 127}));
  connect(constant6.y, desal.input_w1) annotation(
    Line(points = {{-144, -34}, {-50, -34}, {-50, 20}, {-44, 20}}, color = {0, 0, 127}));
  connect(constant5.y, desal.input_w) annotation(
    Line(points = {{-148, 2}, {-76, 2}, {-76, 24}, {-44, 24}}, color = {0, 0, 127}));
  connect(prescribedSpeedPump1.outlet, sensW.inlet) annotation(
    Line(points = {{104, -53}, {104, -63.5}, {102, -63.5}, {102, -74}}, color = {0, 0, 255}));
  connect(constant4.y, prescribedSpeedPump1.nPump) annotation(
    Line(points = {{-4, -72}, {72, -72}, {72, -49}, {92, -49}}, color = {0, 0, 127}));
  connect(sensW.outlet, sinkW.flange) annotation(
    Line(points = {{102, -86}, {102, -112}, {138, -112}}, color = {0, 0, 255}));
  connect(constant7.y, sinkW.in_w0) annotation(
    Line(points = {{136, -64}, {144, -64}, {144, -106}}, color = {0, 0, 127}));
  connect(prescribedSpeedPump.outlet, tank.inlet) annotation(
    Line(points = {{36, -52}, {42, -52}, {42, -22}, {64, -22}}, color = {0, 0, 255}));
  connect(tank.outlet, prescribedSpeedPump1.inlet) annotation(
    Line(points = {{80, -22}, {86, -22}, {86, -52}, {90, -52}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.3"), ThermoPower(version = "3.1")),
    Icon(graphics = {Rectangle(origin = {17, 9}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-89, 95}, {89, -95}}), Text(origin = {18, 35}, extent = {{-76, 19}, {76, -19}}, textString = "Desalination")}),
  Diagram(coordinateSystem(extent = {{-160, 100}, {140, -140}})),
  version = "");
end desalination_block;
