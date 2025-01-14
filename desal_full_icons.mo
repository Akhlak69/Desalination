model desal_full_icons

replaceable package Water = ThermoPower.Water.StandardWater constrainedby Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";
  ThermoPower.Water.SteamTurbineStodola Turbine_2(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-180, 56}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  ThermoPower.Water.SteamTurbineStodola Turbine_1(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-270, 58}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow furnace annotation(
    Placement(visible = true, transformation(origin = {-541, -76}, extent = {{-29, -29}, {29, 29}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed r1(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(origin = {-206, -12}, extent = {{12, -12}, {-12, 12}}, rotation = 0)));
  ThermoPower.Water.SensT sensT annotation(
    Placement(visible = true, transformation(origin = {-375, 63}, extent = {{-33, -33}, {33, 33}}, rotation = 90)));
  ThermoPower.Water.SensW sensW annotation(
    Placement(visible = true, transformation(origin = {-331, 163}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1e6) annotation(
    Placement(visible = true, transformation(origin = {-626.818, -145.6}, extent = {{-23.3636, -25.7}, {23.3636, 25.7}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable q_F_Tab(table = [0, 0; 3600, 400; 7210, 400]) annotation(
    Placement(visible = true, transformation(origin = {-740, -146}, extent = {{-42, -42}, {42, 42}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(V_l_start = 0.1, V_t = 10, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 300e3, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_start = 1000000) annotation(
    Placement(visible = true, transformation(origin = {-541, 7}, extent = {{-37, -21}, {37, 21}}, rotation = 0)));
  ThermoPower.PowerPlants.SteamTurbineGroup.Components.CondenserPreP condenserPreP1(p(displayUnit = "Pa") = 5389.2) annotation(
    Placement(visible = true, transformation(origin = {-62, 82}, extent = {{-34, -34}, {34, 34}}, rotation = 90)));
  ThermoPower.Examples.RankineCycle.Models.PrescribedSpeedPump pump(redeclare package FluidMedium = Water, SSInit = false, head_nom = {450, 300, 0}, n0 = 1000, nominalInletPressure(displayUnit = "Pa") = 50000, nominalMassFlowRate = 100, nominalOutletPressure(displayUnit = "Pa") = 3000000, q_nom = {0, 0.055, 0.1}, rho0(displayUnit = "g/cm3") = 1000) annotation(
    Placement(visible = true, transformation(origin = {-49, -103}, extent = {{-29, 29}, {29, -29}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed r2(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(extent = {{-118, -24}, {-138, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant k1(k = 1116.5) annotation(
    Placement(visible = true, transformation(origin = {-75, -13}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
  ThermoPower.Water.SteamTurbineStodola Turbine_3(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-151, 315}, extent = {{-37, -37}, {37, 37}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed r3(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(origin = {-60, 250}, extent = {{18, -18}, {-18, 18}}, rotation = 0)));
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-762, 138}, extent = {{8, 8}, {-8, -8}}, rotation = 0)));
  inner Modelica.Fluid.System system2 annotation(
    Placement(visible = true, transformation(origin = {-760, 168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SinkPressure sinkPressure annotation(
    Placement(visible = true, transformation(origin = {385, -435}, extent = {{-63, -63}, {63, 63}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant k2(k = 2000000) annotation(
    Placement(visible = true, transformation(origin = {133, 299}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant k3(k = 2) annotation(
    Placement(visible = true, transformation(origin = {109, -61}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  Desal desal annotation(
    Placement(visible = true, transformation(origin = {435, 79}, extent = {{-155, -155}, {155, 155}}, rotation = 0)));
  ThermoPower.Water.SourceW Potable_source annotation(
    Placement(visible = true, transformation(origin = {429, -262}, extent = {{63, -63}, {-63, 63}}, rotation = 0)));
  ThermoPower.Water.Tank tank(A = 1, V0 = 1, allowFlowReversal = false, y(start = 0.1), y0 = 1, ystart = 0.1) annotation(
    Placement(visible = true, transformation(origin = {253, -245}, extent = {{29, -29}, {-29, 29}}, rotation = 0)));
  ThermoPower.Water.SensW sensW2 annotation(
    Placement(visible = true, transformation(origin = {120, -248}, extent = {{34, -34}, {-34, 34}}, rotation = 0)));
  ThermoPower.Water.SinkW Potable_sink annotation(
    Placement(visible = true, transformation(origin = {-46, -262}, extent = {{60, -60}, {-60, 60}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h_sensor(redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {14, 181}, extent = {{-27, 28}, {27, -28}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEnthalpy sensor_h1(redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {-393, -361}, extent = {{32, 22}, {-32, -22}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput enthalpy_flow annotation(
    Placement(visible = true, transformation(origin = {-330, -458}, extent = {{-24, -24}, {24, 24}}, rotation = 0), iconTransformation(origin = {98, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SensW sensW1 annotation(
    Placement(visible = true, transformation(origin = {56, 30}, extent = {{-34, -34}, {34, 34}}, rotation = -90)));
  ThermoPower.Water.SourceW feedback_source annotation(
    Placement(visible = true, transformation(origin = {-213, -275}, extent = {{75, -75}, {-75, 75}}, rotation = 0)));
  ThermoPower.Water.SensT sensT1 annotation(
    Placement(visible = true, transformation(origin = {115, -451}, extent = {{-37, -37}, {37, 37}}, rotation = 0)));
equation
  connect(r1.flange, Turbine_1.shaft_b) annotation(
    Line(points = {{-218, -12}, {-218, 40.5}, {-250, 40.5}, {-250, 58}}));
  connect(evaporator.heatPort, furnace.port) annotation(
    Line(points = {{-541, -14}, {-541, -47}}, color = {191, 0, 0}));
  connect(Turbine_1.outlet, Turbine_2.inlet) annotation(
    Line(points = {{-244, 84}, {-220, 84}, {-220, 82}, {-206, 82}}, color = {0, 0, 255}));
  connect(q_F_Tab.y, gain.u) annotation(
    Line(points = {{-694, -146}, {-655, -146}}, color = {0, 0, 127}));
  connect(Turbine_2.shaft_b, r2.flange) annotation(
    Line(points = {{-160, 56}, {-138, 56}, {-138, -14}}));
  connect(Turbine_2.outlet, condenserPreP1.steamIn) annotation(
    Line(points = {{-154, 82}, {-96, 82}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(k1.y, pump.nPump) annotation(
    Line(points = {{-36, -13}, {-28, -13}, {-28, -86}}, color = {0, 0, 127}));
  connect(Turbine_3.shaft_b, r3.flange) annotation(
    Line(points = {{-127, 315}, {-78, 315}, {-78, 250}}));
  connect(Potable_source.flange, tank.inlet) annotation(
    Line(points = {{366, -262}, {276, -262}}, color = {170, 85, 255}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(tank.outlet, sensW2.inlet) annotation(
    Line(points = {{230, -262}, {140, -262}}, color = {170, 85, 255}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(Turbine_3.outlet, h_sensor.port) annotation(
    Line(points = {{-121, 345}, {42, 345}, {42, 181}}, color = {0, 170, 255}));
  connect(h_sensor.h_out, desal.steam_enthalpy) annotation(
    Line(points = {{14, 151}, {151.5, 151}, {151.5, 156.5}, {252, 156.5}}, color = {0, 0, 127}));
  connect(sensW1.w, desal.steam_flowrate) annotation(
    Line(points = {{76, 3}, {164.5, 3}, {164.5, 5}, {252, 5}}, color = {0, 0, 127}));
  connect(h_sensor.port, sensW1.inlet) annotation(
    Line(points = {{42, 181}, {42, 50}}, color = {0, 127, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(k2.y, desal.seawater_enthalpy) annotation(
    Line(points = {{170, 300}, {194, 300}, {194, 85}, {252, 85}}, color = {0, 0, 127}));
  connect(desal.potable_storage, Potable_source.in_w0) annotation(
    Line(points = {{605.5, 76}, {752, 76}, {752, -124}, {454, -124}, {454, -224}}, color = {0, 0, 127}));
  connect(desal.potable_storage, Potable_sink.in_w0) annotation(
    Line(points = {{605.5, 76}, {752, 76}, {752, -194}, {-22, -194}, {-22, -226}}, color = {0, 0, 127}));
  connect(sensW2.outlet, Potable_sink.flange) annotation(
    Line(points = {{100, -262}, {14, -262}}, color = {170, 85, 255}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(desal.feedback_flow, feedback_source.in_w0) annotation(
    Line(points = {{605.5, 110}, {672, 110}, {672, -174}, {-183, -174}, {-183, -230}}, color = {0, 0, 127}));
  connect(desal.enthalpy_potable, feedback_source.in_h) annotation(
    Line(points = {{605.5, -2}, {634, -2}, {634, -158}, {-243, -158}, {-243, -230}}, color = {0, 0, 127}));
  connect(sensor_h1.h_out, enthalpy_flow) annotation(
    Line(points = {{-428, -360}, {-442, -360}, {-442, -458}, {-330, -458}}, color = {0, 170, 255}));
  connect(feedback_source.flange, sensor_h1.port) annotation(
    Line(points = {{-288, -274}, {-392, -274}, {-392, -338}}, color = {0, 170, 255}));
  connect(sensW1.outlet, sensT1.inlet) annotation(
    Line(points = {{42, 10}, {42, -466}, {93, -466}}, color = {85, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(gain.y, furnace.Q_flow) annotation(
    Line(points = {{-602, -146}, {-540, -146}, {-540, -104}}, color = {0, 0, 127}));
  connect(sensor_h1.port, evaporator.port_a) annotation(
    Line(points = {{-392, -338}, {-674, -338}, {-674, 8}, {-578, 8}}, color = {0, 127, 255}));
  connect(pump.outlet, evaporator.port_a) annotation(
    Line(points = {{-78, -103}, {-652, -103}, {-652, 8}, {-578, 8}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(evaporator.port_b, sensT.inlet) annotation(
    Line(points = {{-504, 8}, {-362, 8}, {-362, 44}}, color = {0, 127, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(sensT.outlet, sensW.inlet) annotation(
    Line(points = {{-362, 82}, {-362, 111}, {-360, 111}, {-360, 144}}, color = {0, 0, 255}));
  connect(sensW.outlet, Turbine_1.inlet) annotation(
    Line(points = {{-302, 144}, {-296, 144}, {-296, 84}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(evaporator.port_b, Turbine_3.inlet) annotation(
    Line(points = {{-504, 8}, {-436, 8}, {-436, 344}, {-180, 344}}, color = {0, 127, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(k3.y, desal.seawater_flowrate) annotation(
    Line(points = {{143, -61}, {196, -61}, {196, -60}, {249, -60}}, color = {0, 0, 127}));
  connect(sensT1.outlet, sinkPressure.flange) annotation(
    Line(points = {{138, -466}, {322, -466}, {322, -435}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(condenserPreP1.waterOut, pump.inlet) annotation(
    Line(points = {{-28, 82}, {18, 82}, {18, -103}, {-20, -103}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
protected
  annotation(
    uses(ThermoPower(version = "3.1"), Modelica(version = "3.2.3")),
  Diagram(coordinateSystem(extent = {{-800, 360}, {760, -560}})),
  version = "");


end desal_full_icons;
